<?php
    
    namespace Entity;
    
    class Review implements \JsonSerializable
    {
        
        private $id;
        
        /**
         * @var string
         */
        private $author;
        
        private $author_id;
        /**
         * @var int
         */
        private $vote;
        /**
         * @var string
         */
        private $content;
        /**
         * @var \DateTime
         */
        private $created_at;
        
        private $product_id;
        
        /**
         * @return string
         */
        public function getAuthor(): string
        {
            return $this->author;
        }
        
        /**
         * @param string $author
         */
        public function setAuthor(string $author): void
        {
            $this->author = $author;
        }
        
        /**
         * @return int
         */
        public function getVote(): int
        {
            return $this->vote;
        }
        
        /**
         * @param int $vote
         */
        public function setVote(int $vote): void
        {
            $this->vote = $vote;
        }
        
        /**
         * @return string
         */
        public function getContent(): string
        {
            return $this->content;
        }
        
        /**
         * @param string $content
         */
        public function setContent(string $content): void
        {
            $this->content = $content;
        }
        
        /**
         * @return \DateTime
         */
        public function getCreatedAt(): \DateTime
        {
            return new \DateTime($this->created_at);
        }
        
        /**
         * @param \DateTime $created_at
         */
        public function setCreatedAt(\DateTime $created_at): void
        {
            $this->created_at = $created_at;
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
         * Specify data which should be serialized to JSON
         *
         * @link  https://php.net/manual/en/jsonserializable.jsonserialize.php
         * @return mixed data which can be serialized by <b>json_encode</b>,
         * which is a value of any type other than a resource.
         * @since 5.4.0
         */
        public function jsonSerialize()
        {
            $json = array();
            foreach ($this as $key => $value) {
                $json[$key] = $value;
            }
            
            $json['created_at'] = $this->getCreatedAt()->format("F j, Y");
            
            return $json;
        }
    
        /**
         * @return array
         */
        public function validate()
        {
            $error = [];
            if($this->vote < 1 || $this->vote > 4){
                $error['vote'] = "The vote must be between 1 and 4 stars";
            }
            
            if(strlen($this->content) < 80)
                $error['content'] = "The content must be minimum 80 characters long";
            elseif ( strlen($this->content) > 512)
                $error['content'] = "The content must be maximum 512b n characters long";
            
            return $error;
        }
    
        /**
         * @return mixed
         */
        public function getAuthorId()
        {
            return $this->author_id;
        }
    
        /**
         * @param mixed $author_id
         */
        public function setAuthorId($author_id): void
        {
            $this->author_id = $author_id;
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
    }