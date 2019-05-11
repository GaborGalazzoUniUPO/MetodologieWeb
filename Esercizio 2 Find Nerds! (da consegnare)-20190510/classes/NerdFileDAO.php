<?php
    
    class NerdFileDAO implements NerdDAO
    {
        
    
        /**
         * @return Nerd[]
         */
        public function getAll()
        {
            $result = array();
            $lines = file(self::getFileStore());
            foreach ($lines as $line){
                list($name, $gender, $age, $personality, $os, $seeking_age_min, $seeking_age_max) = explode(",",$line);
                $nerd = new Nerd();
                $nerd->setName($name);
                $nerd->setGender($gender);
                $nerd->setAge(intval($age));
                $nerd->setPersonality($personality);
                $nerd->setOs($os);
                $nerd->setSeekingAgeMin(intval($seeking_age_min));
                $nerd->setSeekingAgeMax(intval($seeking_age_max));
                array_push($result, $nerd);
            }
            return $result;
        }
    
        /**
         * @param $nerd Nerd
         *
         * @return int|bool
         */
        public function save($nerd)
        {
            $values = array_values((array)$nerd);
            return file_put_contents(self::getFileStore(),
                "\n".implode(",",$values),
                FILE_APPEND);
        }
        
        /** @return string FileStore path */
        public static function getFileStore(){
            return $_SERVER['DOCUMENT_ROOT'].DIRECTORY_SEPARATOR .'singles.txt';
        }
    }