<?php


namespace Repository;


interface Repository
{

    public function save($entity);

    public function update($entity);

    public function delete($entity);

    public function findById($id);

    public function findAll();
}