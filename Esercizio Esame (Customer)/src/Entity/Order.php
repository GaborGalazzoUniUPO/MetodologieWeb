<?php
    
    namespace Entity;
    
    class Order
    {
        
        private $id;
        private $transaction;
        private $status;
        private $owner_id;
        private $created_at;
        private $shipment_type;
        private $payment_method_id;
        private $shipping_address_id;
        private $code;
        
        private $products;
    
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
        public function getTransaction()
        {
            return $this->transaction;
        }
    
        /**
         * @param mixed $transaction
         */
        public function setTransaction($transaction): void
        {
            $this->transaction = $transaction;
        }
    
        /**
         * @return mixed
         */
        public function getStatus()
        {
            return $this->status;
        }
    
        /**
         * @param mixed $status
         */
        public function setStatus($status): void
        {
            $this->status = $status;
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
        public function getCreatedAt()
        {
            return $this->created_at;
        }
    
        /**
         * @param mixed $created_at
         */
        public function setCreatedAt($created_at): void
        {
            $this->created_at = $created_at;
        }
    
        /**
         * @return mixed
         */
        public function getShipmentType()
        {
            return $this->shipment_type;
        }
    
        /**
         * @param mixed $shipment_type
         */
        public function setShipmentType($shipment_type): void
        {
            $this->shipment_type = $shipment_type;
        }
    
        /**
         * @return mixed
         */
        public function getPaymentMethodId()
        {
            return $this->payment_method_id;
        }
    
        /**
         * @param mixed $payment_method_id
         */
        public function setPaymentMethodId($payment_method_id): void
        {
            $this->payment_method_id = $payment_method_id;
        }
    
        /**
         * @return mixed
         */
        public function getShippingAddressId()
        {
            return $this->shipping_address_id;
        }
    
        /**
         * @param mixed $shipping_address_id
         */
        public function setShippingAddressId($shipping_address_id): void
        {
            $this->shipping_address_id = $shipping_address_id;
        }
    
        /**
         * @return mixed
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
        public function getCode()
        {
            return $this->code;
        }
    
        /**
         * @param mixed $code
         */
        public function setCode($code): void
        {
            $this->code = $code;
        }
    
    }