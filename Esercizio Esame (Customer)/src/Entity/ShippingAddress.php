<?php
    
    namespace Entity;
    
    class ShippingAddress
    {
        private $id;
        private $owner_id;
        private $street;
        private $country;
        private $city;
        private $region;
        private $zip_code;
        private $full_name;
    
        public function __toString()
        {
            return "$this->street, $this->zip_code $this->city $this->region, $this->country";
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
        public function getStreet()
        {
            return $this->street;
        }
    
        /**
         * @param mixed $street
         */
        public function setStreet($street): void
        {
            $this->street = $street;
        }
    
       
    
        /**
         * @return mixed
         */
        public function getCountry()
        {
            return $this->country;
        }
    
        /**
         * @param mixed $country
         */
        public function setCountry($country): void
        {
            $this->country = $country;
        }
    
        /**
         * @return mixed
         */
        public function getCity()
        {
            return $this->city;
        }
    
        /**
         * @param mixed $city
         */
        public function setCity($city): void
        {
            $this->city = $city;
        }
    
        /**
         * @return mixed
         */
        public function getRegion()
        {
            return $this->region;
        }
    
        /**
         * @param mixed $region
         */
        public function setRegion($region): void
        {
            $this->region = $region;
        }
    
        /**
         * @return mixed
         */
        public function getZipCode()
        {
            return $this->zip_code;
        }
    
        /**
         * @param mixed $zip_code
         */
        public function setZipCode($zip_code): void
        {
            $this->zip_code = $zip_code;
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