<?php
    
    namespace Entity;
    
    class PaymentMethod
    {
        private $id;
        private $token_id;
        private $owner_id;
        private $expiry;
        private $card_type;
        private $last_digits;
        private $full_name;
    
        /**
         * @return mixed
         */
        public function getTokenId()
        {
            return $this->token_id;
        }
    
        /**
         * @param mixed $token_id
         */
        public function setTokenId($token_id): void
        {
            $this->token_id = $token_id;
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
        public function getExpiry()
        {
            return $this->expiry;
        }
    
        /**
         * @param mixed $expiry
         */
        public function setExpiry($expiry): void
        {
            $this->expiry = $expiry;
        }
    
        /**
         * @return mixed
         */
        public function getCardType()
        {
            return $this->card_type;
        }
    
        /**
         * @param mixed $card_type
         */
        public function setCardType($card_type): void
        {
            $this->card_type = $card_type;
        }
    
        /**
         * @return mixed
         */
        public function getLastDigits()
        {
            return $this->last_digits;
        }
    
        /**
         * @param mixed $last_digits
         */
        public function setLastDigits($last_digits): void
        {
            $this->last_digits = $last_digits;
        }
    
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
        public function getFullName()
        {
            return $this->full_name;
        }
    
        /**
         * @param mixed $full_name
         */
        public function setFullName($full_name): void
        {
            $this->full_name = $full_name;
        }
    
    }