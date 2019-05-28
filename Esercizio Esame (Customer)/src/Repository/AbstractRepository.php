<?php


namespace Repository;


use Functionality\Database;

class AbstractRepository
{

    protected $connection;

    public function __construct()
    {
        $this->connection = Database::getConnection();
    }

}