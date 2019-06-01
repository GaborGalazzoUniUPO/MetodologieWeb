<?php # <GABOR,GALAZZO,20024195>
    
    /**
     * Preload File to require in each page to load classes and configurations
     */
    
    spl_autoload_register(
        function ($class) {
            require_once "classes/$class.php";
        }
    );