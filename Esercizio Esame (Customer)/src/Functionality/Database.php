<?php


namespace Functionality;


use PDO;

class Database
{

    /** @var \PDO */
    private static $instance = null;



    /**
     * @param array $config
     * @return \PDO
     */
    public static function getConnection($config = null)
    {
        if(self::$instance == null)
        {
            if($config == null)
                throw new \InvalidArgumentException('config cannot be null');

            self::$instance = new PDO(
                "mysql:dbname=$config[db_name];host=$config[host]",
                $config['user'],
                $config['password']);

            self::$instance->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }

        return self::$instance;
    }


    protected function __construct($config)
    {
    }

    private function __clone()
    {
    }

    private function __wakeup()
    {
    }


}