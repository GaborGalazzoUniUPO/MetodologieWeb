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
        
        private $item_count;
        
        private $total;
        private $delivered_at;
        private $tracking_code;
    
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
        
        public function getStatusString(){
            switch ($this->status){
                case 0:
                    return '<span class="text-warning">Under processing</span>';
                case 1:
                    return '<span class="text-primary">Sent (Tracking code: '.$this->tracking_code.')</span>';
                case 2:
                    return '<span class="text-success">Delivered '.$this->delivered_at.'</span>';
                    
            }
            return '<span class="text-danger">Error</span>';
        }
    
        /**
         * @return mixed
         */
        public function getDeliveredAt()
        {
            return $this->delivered_at;
        }
    
        /**
         * @param mixed $delivered_at
         */
        public function setDeliveredAt($delivered_at): void
        {
            $this->delivered_at = $delivered_at;
        }
    
        /**
         * @return mixed
         */
        public function getTrackingCode()
        {
            return $this->tracking_code;
        }
    
        /**
         * @param mixed $tracking_code
         */
        public function setTrackingCode($tracking_code): void
        {
            $this->tracking_code = $tracking_code;
        }
    
    }