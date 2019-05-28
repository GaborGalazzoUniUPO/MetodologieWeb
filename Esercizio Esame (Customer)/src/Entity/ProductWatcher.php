<?php
    
    namespace Entity;
    
    class ProductWatcher
    {
        private $id;
        private $product_id;
        private $user_id;
    
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
        public function getProductId()
        {
            return $this->product_id;
        }
    
        /**
         * @param mixed $product_id
         */
        public function setProductId($product_id): void
        {
            $this->product_id = $product_id;
        }
    
        /**
         * @return mixed
         */
        public function getUserId()
        {
            return $this->user_id;
        }
    
        /**
         * @param mixed $user_id
         */
        public function setUserId($user_id): void
        {
            $this->user_id = $user_id;
        }
        
        
    }