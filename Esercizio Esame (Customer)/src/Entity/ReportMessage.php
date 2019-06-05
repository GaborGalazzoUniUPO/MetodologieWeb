<?php
    
    namespace Entity;
    
    class ReportMessage
    {
        private $id;
        private $order_id;
        private $type;
        private $text;
        private $created_at;
    
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
        public function getOrderId()
        {
            return $this->order_id;
        }
    
        /**
         * @param mixed $order_id
         */
        public function setOrderId($order_id): void
        {
            $this->order_id = $order_id;
        }
    
        /**
         * @return mixed
         */
        public function getType()
        {
            return $this->type;
        }
    
        /**
         * @param mixed $type
         */
        public function setType($type): void
        {
            $this->type = $type;
        }
    
        /**
         * @return mixed
         */
        public function getText()
        {
            return $this->text;
        }
    
        /**
         * @param mixed $text
         */
        public function setText($text): void
        {
            $this->text = $text;
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
        
        
    }