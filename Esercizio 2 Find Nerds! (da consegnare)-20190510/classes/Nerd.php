<?php
    
    class Nerd
    {
        private $name;
        private $gender;
        private $age;
        private $personality;
        private $os;
        private $seeking_age_min;
        private $seeking_age_max;
    
        
        /**
         * @return string
         */
        public function getName()
        {
            return $this->name;
        }
    
        /**
         * @param string $name
         */
        public function setName($name): void
        {
            $this->name = $name;
        }
    
        /**
         * @return string
         */
        public function getGender()
        {
            return $this->gender;
        }
    
        /**
         * @param string $gender
         */
        public function setGender($gender): void
        {
            $this->gender = $gender;
        }
    
        /**
         * @return integer
         */
        public function getAge()
        {
            return $this->age;
        }
    
        /**
         * @param integer $age
         */
        public function setAge($age): void
        {
            $this->age = $age;
        }
    
        /**
         * @return string
         */
        public function getPersonality()
        {
            return $this->personality;
        }
    
        /**
         * @param string $personality
         */
        public function setPersonality($personality): void
        {
            $this->personality = $personality;
        }
    
        /**
         * @return string
         */
        public function getOs()
        {
            return $this->os;
        }
    
        /**
         * @param string $os
         */
        public function setOs($os): void
        {
            $this->os = $os;
        }
    
        /**
         * @return integer
         */
        public function getSeekingAgeMin()
        {
            return $this->seeking_age_min;
        }
    
        /**
         * @param integer $seeking_age_min
         */
        public function setSeekingAgeMin($seeking_age_min): void
        {
            $this->seeking_age_min = $seeking_age_min;
        }
    
        /**
         * @return integer
         */
        public function getSeekingAgeMax()
        {
            return $this->seeking_age_max;
        }
    
        /**
         * @param integer $seeking_age_max
         */
        public function setSeekingAgeMax($seeking_age_max): void
        {
            $this->seeking_age_max = $seeking_age_max;
        }
    
        /**
         * Check that the two personalities have at least one common letter
         * @param $personality1
         * @param $personality2
         *
         * @return bool the two personalities have at least one common letter
         */
        public static function isPersonalityMatch($personality1, $personality2)
        {
            for ($i = 0; $i < 4; $i++) {
                if ($personality1[$i] == $personality2[$i]) {
                    return True;
                }
            }
            return false;
        }
    
        /**
         * Check that the nerd parameter is within the specifications of this nerd
         * @param $nerd Nerd
         * @return bool the parameter has different sex && the parameter age is between seekingAge && the OS is the same && isPersonalityMatch
         * @see Nerd::isPersonalityMatch()
         */
        public function isMatchForMe($nerd){
            return $nerd->getGender() != $this->gender &&
            $nerd->getAge() >= $this->seeking_age_min &&
            $nerd->getAge() <= $this->seeking_age_max &&
            $nerd->getOs() == $this->os &&
            self::isPersonalityMatch($nerd->personality, $this->personality);
        }
    
        /**
         * Print a card containing this nerd infos
         */
        public function toListItem(){
            ?>
            <p><?= $this->name ?><img src="http://www.cs.washington.edu/education/courses/cse190m/12sp/homework/4/user.jpg"
                                alt="Profile Image"></p>
            <ul>
                <li>
                    <strong>Gender:</strong> <?= $this->gender ?>
                </li>
                <li>
                    <strong>Age:</strong> <?= $this->age ?>
                </li>
                <li>
                    <strong>Type:</strong> <?= $this->personality ?>
                </li>
                <li>
                    <strong>OS:</strong> <?= $this->os ?>
                </li>
            </ul>
            <?php
        }
        
        
    
    }