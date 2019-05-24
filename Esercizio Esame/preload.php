<?php

    /**
     * Preload File to require in each page to load classes and configurations
     */
    
    spl_autoload_register(
        function ($class) {
            require_once "src/$class.php";
        }
    );

    $config = require_once "config.php";

    \Functionality\Database::getConnection($config['database']);

