<?php
    
    interface NerdDAO
    {
        /**
         * Retrieve a list of all nerds
         * @return Nerd[]
         */
        public function getAll();
    
        /**
         * Store a new nerd
         * @param $nerd Nerd
         * @return int|bool
         */
        public function save($nerd);
    }