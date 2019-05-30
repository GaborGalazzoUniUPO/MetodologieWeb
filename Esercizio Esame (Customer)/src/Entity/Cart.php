<?php


namespace Entity;


class Cart
{

    private $id;

    private $cookie_cart;

    private $created_at;

    private $products;

    private $owner_id;
    
    private $item_count;
    
    private $total;

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     */
    public function setId($id): void
    {
        $this->id = $id;
    }

    /**
     * @return mixed
     */
    public function getCookieCart()
    {
        return $this->cookie_cart;
    }

    /**
     * @param mixed $cookie_cart
     */
    public function setCookieCart($cookie_cart): void
    {
        $this->cookie_cart = $cookie_cart;
    }

    /**
     * @return mixed
     */
    public function getCreatedAt()
    {
        return new \DateTime($this->created_at);
    }

    /**
     * @param mixed $created_at
     */
    public function setCreatedAt($created_at): void
    {
        $this->created_at = $created_at;
    }

    /**
     * @return CartProduct[]
     */
    public function getProducts()
    {
        return $this->products;
    }

    /**
     * @param mixed $products
     */
    public function setProducts($products): void
    {
        $this->products = $products;
    }

    /**
     * @return mixed
     */
    public function getOwnerId()
    {
        return $this->owner_id;
    }

    /**
     * @param mixed $owner_id
     */
    public function setOwnerId($owner_id): void
    {
        $this->owner_id = $owner_id;
    }
    
    /**
     * @return mixed
     */
    public function getItemCount()
    {
        return $this->item_count;
    }
    
    /**
     * @param mixed $item_count
     */
    public function setItemCount($item_count): void
    {
        $this->item_count = $item_count;
    }
    
    /**
     * @return mixed
     */
    public function getTotal()
    {
        return $this->total;
    }
    
    /**
     * @param mixed $total
     */
    public function setTotal($total): void
    {
        $this->total = $total;
    }
    
}

