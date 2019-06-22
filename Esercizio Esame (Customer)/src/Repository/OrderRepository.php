<?php
    
    namespace Repository;
    
    use Entity\CartProduct;
    use Entity\Order;
    
    class OrderRepository extends AbstractRepository
    {
        
        public function save(\Entity\Order $order, $cart_id)
        {
            $this->connection->beginTransaction();
            try {
                $query = "insert into orders (transaction, owner_id, shipment_type, payment_method_id, shipping_address_id, code)
                VALUES   (:transaction, :owner_id, :shipment_type, :payment_method_id, :shipping_address_id, :code);";
                $stm = $this->connection->prepare($query);
                $r = $stm->execute(
                    [
                        'transaction' => $order->getTransaction(),
                        'owner_id' => $order->getOwnerId(),
                        'shipment_type' => $order->getShipmentType(),
                        'payment_method_id' => $order->getPaymentMethodId(),
                        'shipping_address_id' => $order->getShippingAddressId(),
                        'code' => $order->getCode(),
                    ]
                );
                if ($r) {
                    $order->setId($this->connection->lastInsertId('orders'));
                }
                
                $query = "insert into order_products (stock_unit, order_id) select stock_unit, :order_id from cart_products where cart_id = :cart_id;";
                $stm = $this->connection->prepare($query);
                $r = $stm->execute(
                    [
                        'order_id' => $order->getId(),
                        'cart_id' => $cart_id,
                    ]
                );
                
                $query = "delete from cart_products where cart_id = :cart_id";
                $stm = $this->connection->prepare($query);
                $r = $stm->execute(
                    [
                        'cart_id' => $cart_id,
                    ]
                );
                $this->connection->commit();
            } catch (\Exception $e) {
                $this->connection->rollBack();
                throw $e;
            }
            
            return $order;
            
        }
        
        public function findByOwner($owner_id)
        {
            $query = " select o.id,
                o.code,
                o.created_at,
                o.status,
                o.shipment_type,
                o.transaction,
                o.shipping_address_id,
                o.payment_method_id,
                o.owner_id,
                o.tracking_code,
                o.delivered_at,
               count(s.id)       as item_count,
               sum(p.unit_price) as total
        from orders o
                 left join order_products op on o.id = op.order_id
                 left join stock_units s on s.id = op.stock_unit
                 left join products p on p.id = s.product_id
        where owner_id = :owner_id
        group by o.id";
            $stm = $this->connection->prepare($query);
            $stm->execute(['owner_id' => $owner_id]);
            $res = [];
            while ($r = $stm->fetchObject(Order::class)) {
                $res[] = $r;
            }
            
            return $res;
        }
        
        public function findLastByOwnerId($user_id)
        {
            return [];
        }
    
        /**
         * @param $order_id
         * @param $owner_id
         *
         * @return Order|null
         */
        public function findByIdAndOwner($order_id, $owner_id)
        {
            $query = " select o.id,
                o.code,
                o.created_at,
                o.status,
                o.shipment_type,
                o.transaction,
                o.shipping_address_id,
                o.payment_method_id,
                o.owner_id,
                o.tracking_code,
                o.delivered_at,
               count(s.id)       as item_count,
               sum(p.unit_price) as total
        from orders o
                 left join order_products op on o.id = op.order_id
                 left join stock_units s on s.id = op.stock_unit
                 left join products p on p.id = s.product_id
        where owner_id = :owner_id and o.id = :order_id
        group by o.id";
            $stm = $this->connection->prepare($query);
            $stm->execute(['owner_id' => $owner_id, 'order_id' => $order_id]);
            if ($r = $stm->fetchObject(Order::class)) {
    
                $this->refreshOrderProduct($r);
                
                return $r;
            }
    
            return null;
        }
    
        /**
         * @param $order Order
         */
        private function refreshOrderProduct($order)
        {
            $query = "
            select p.name,
                   p.photo_url,
                   p.unit_price,
                   count(s.id) as qta,
                   p.id
            from order_products op
                     inner join stock_units s on s.id = op.stock_unit
                     inner join products p on s.product_id = p.id
            where op.order_id = :order_id
            group by p.id";
    
            $stm = $this->connection->prepare($query);
            $stm->execute(['order_id' => $order->getId()]);
    
            $products = [];
    
            while ($cartProduct = $stm->fetchObject(CartProduct::class)) {
                $products[] = $cartProduct;
            }
    
            $order->setProducts($products);
        }
    }