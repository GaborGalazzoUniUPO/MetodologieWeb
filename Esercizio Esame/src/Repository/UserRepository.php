<?php


namespace Repository;


use Entity\User;

class UserRepository extends AbstractRepository implements Repository
{

    /**
     * @param $entity User
     */
    public function save($entity)
    {
        $query = "INSERT INTO users (name, surname, email, secret, salt) values (:name, :surname, :email, :secret, :salt);";

        $stm = $this->connection->prepare($query);
        $status = $stm->execute([
            'name' => $entity->getName(),
            'surname' => $entity->getSurname(),
            'email' => $entity->getEmail(),
            'secret' => $entity->getSecret(),
            'salt' => $entity->getSalt()
        ]);


        if($status){
            $entity->setId($this->connection->lastInsertId('users'));
        }
    }

    public function update($entity)
    {
        // TODO: Implement update() method.
    }

    public function delete($entity)
    {
        // TODO: Implement delete() method.
    }

    public function findById($id)
    {
        // TODO: Implement findById() method.
    }

    public function findAll()
    {
        // TODO: Implement findAll() method.
    }

    /**
     * @param $email string
     * @return User|null
     */
    public function findByEmail($email)
    {
        $query = "select * from users where email = :email;";

        /** @var  \PDOStatement $stm */
        $stm = $this->connection->prepare($query);

        $stm->execute([
            'email' => $email,
        ]);

        return $stm->fetchObject(User::class);
    }
}