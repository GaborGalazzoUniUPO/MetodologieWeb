<?php


namespace Repository;


use Entity\Cart;
use Entity\CartProduct;

class CartRepository extends AbstractRepository
{

    public function findByCookie($cookie_cart)
    {
        $query = "
        select c.id,
               c.cookie_cart,
               c.created_at,
               c.owner_id,
               count(s.id)       as item_count,
               sum(p.unit_price) as total
        from carts c
                 left join cart_products cp on c.id = cp.cart_id
                 left join stock_units s on s.id = cp.stock_unit
                 left join products p on p.id = s.product_id
        where cookie_cart = :cookie_cart
        group by c.id
        ";
        $stm = $this->connection->prepare($query);
        $stm->execute(['cookie_cart' => $cookie_cart]);


        /** @var Cart $cart */
        $cart = $stm->fetchObject(Cart::class);

        if ($cart) {
            $this->refreshCartProduct($cart);

        }
        return $cart?$cart:null;


    }

    public function addProduct($cartId, $productId)
    {
        $this->connection->beginTransaction();
        try {
            $this->connection->query("lock tables stock_units as sr READ, stock_units as sw WRITE, cart_products write;");


            $query = "select id from stock_units as sr where status = 0 and product_id = :p_id";
            $stm = $this->connection->prepare($query);
            $stm->execute(['p_id' => $productId]);
            $sku = $stm->fetchColumn();


            $query = "update stock_units as sw set status = 1 where id = :id";
            $stm = $this->connection->prepare($query);
            $stm->execute([':id' => $sku]);

            $query = "insert into cart_products (stock_unit, cart_id)
            values (:sku, :cart_id)";
            $stm = $this->connection->prepare($query);
            $stm->execute([':sku' => $sku, 'cart_id' => $cartId]);

            $this->connection->query("unlock tables;");
            $this->connection->commit();
            return true;
        } catch (\Exception $e) {
            $this->connection->rollBack();
            $this->connection->query("unlock tables;");
            return false;
        }
    }

    /**
     * @param $userId
     */
    public function findActiveByUser($userId)
    {
        $query = "
        select c.id,
               c.cookie_cart,
               c.created_at,
               c.owner_id,
               count(s.id)       as item_count,
               sum(p.unit_price) as total
        from carts c
                 left join cart_products cp on c.id = cp.cart_id
                 left join stock_units s on s.id = cp.stock_unit
                 left join products p on p.id = s.product_id
        where owner_id = :owner_id
        group by c.id
        ";
        $stm = $this->connection->prepare($query);
        $stm->execute(['owner_id' => $userId]);

        /** @var Cart $cart */
        $cart = $stm->fetchObject(Cart::class);
        if ($cart) {
            $this->refreshCartProduct($cart);

        }
        return $cart;
    }

    public function createCart($userId = null)
    {
        $cookie_cart = uniqid();
        $query = "
        insert into carts (cookie_cart, owner_id) values (:cookie_cart, :owner_id)
        ";
        $stm = $this->connection->prepare($query);
        $stm->execute(['cookie_cart' => $cookie_cart, 'owner_id' => $userId]);
        return $cookie_cart;
    }

    public function mergeCarts($destId, $sourceId)
    {
        $query = "update cart_products set cart_id = :dest_id
        where cart_id = :source_id";
        $stm = $this->connection->prepare($query);
        $stm->execute(
            [
                'dest_id' => $destId,
                'source_id' => $sourceId
            ]
        );
        return $this->delete($sourceId);
    }

    public function update(Cart $cart)
    {
        $query = "
        update carts set owner_id = :owner_id, cookie_cart = :cookie_cart
        where id = :cart_id;
        ";
        $stm = $this->connection->prepare($query);
        return $stm->execute(
            [
                'owner_id' => $cart->getOwnerId(),
                'cookie_cart' => $cart->getCookieCart(),
                'cart_id' => $cart->getId()
            ]
        );

    }

    private function delete($id)
    {
        $query = "delete from carts 
        where id = :id";
        $stm = $this->connection->prepare($query);
        $stm->execute(
            [
                'id' => $id
            ]
        );
    }

    public function removeProduct($cartId, $productId)
    {
        $query = "select s.id as sku_id,
               cd.id as cart_product_id
        from cart_products cd
                 inner join stock_units s on s.id = cd.stock_unit
        where cd.cart_id = :cart_id and s.product_id = :product_id
        limit 1";

        $stm = $this->connection->prepare($query);
        $stm->execute([
            'cart_id' => $cartId,
            'product_id' => $productId
        ]);
        $resp = $stm->fetch();
        $sku = $resp[0];
        $cp = $resp[1];

        $query = "delete from cart_products where id = :id";
        $this->connection->prepare($query)->execute(['id'=>$cp]);
        $query = "update stock_units set status = 0 where id = :id";
        $this->connection->prepare($query)->execute(['id' => $sku]);
    }
    
    public function findById($id)
    {
        $query = "
        select c.id,
               c.cookie_cart,
               c.created_at,
               c.owner_id,
               count(s.id)       as item_count,
               sum(p.unit_price) as total
        from carts c
                 left join cart_products cp on c.id = cp.cart_id
                 left join stock_units s on s.id = cp.stock_unit
                 left join products p on p.id = s.product_id
        where c.id = :id
        group by c.id
        ";
        $stm = $this->connection->prepare($query);
        $stm->execute(['id' => $id]);
    
    
        /** @var Cart $cart */
        $cart = $stm->fetchObject(Cart::class);
    
        if ($cart) {
            $this->refreshCartProduct($cart);
        
        }
        return $cart?$cart:null;
    }
    
    /**
     * @param $cart Cart
     */
    public function refreshCartProduct($cart){
        $query = "
            select p.name,
                   p.photo_url,
                   p.unit_price,
                   count(s.id) as qta,
                   p.id
            from cart_products cp
                     inner join stock_units s on s.id = cp.stock_unit
                     inner join products p on s.product_id = p.id
            where cp.cart_id = :cart_id
            group by p.id";
    
        $stm = $this->connection->prepare($query);
        $stm->execute(['cart_id' => $cart->getId()]);
    
        $products = [];
    
        while ($cartProduct = $stm->fetchObject(CartProduct::class)) {
            $products[] = $cartProduct;
        }
    
        $cart->setProducts($products);
    }
}