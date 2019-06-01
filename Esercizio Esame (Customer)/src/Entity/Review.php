<?php
    
    namespace Entity;
    
    class Review implements \JsonSerializable
    {
        
        /**
         * @var string
         */
        private $author;
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
    }