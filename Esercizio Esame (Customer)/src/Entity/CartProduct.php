<?php
    
    namespace Entity;
    
    class CartProduct
    {
        
        /**
         * @var int
         */
        private $id;
        /**
         * @var string
         */
        private $name;
        /**
         * @var string
         */
        private $photo_url;
        /**
         * @var float
         */
        private $unit_price;
        /**
         * @var int
         */
        private $qta;
        
        /**
         * @return int
         */
        public function getId(): int
        {
            return $this->id;
        }
        
        /**
         * @param int $id
         */
        public function setId(int $id): void
        {
            $this->id = $id;
        }
        
        /**
         * @return string
         */
        public function getName(): string
        {
            return $this->name;
        }
        
        /**
         * @param string $name
         */
        public function setName(string $name): void
        {
            $this->name = $name;
        }
        
        /**
         * @return string
         */
        public function getPhotoUrl(): string
        {
            return $this->photo_url;
        }
        
        /**
         * @param string $photo_url
         */
        public function setPhotoUrl(string $photo_url): void
        {
            $this->photo_url = $photo_url;
        }
        
        /**
         * @return float
         */
        public function getUnitPrice(): float
        {
            return $this->unit_price;
        }
        
        /**
         * @param float $unit_price
         */
        public function setUnitPrice(float $unit_price): void
        {
            $this->unit_price = $unit_price;
        }
        
        /**
         * @return int
         */
        public function getQta(): int
        {
            return $this->qta;
        }
        
        /**
         * @param int $qta
         */
        public function setQta(int $qta): void
        {
            $this->qta = $qta;
        }
        
    }