<?php
    
    namespace Repository;
    
    use Entity\User;
    
    class UserRepository extends AbstractRepository implements Repository
    {
        
        /**
         * @param $entity User
         *
         * @return User
         */
        public function save($entity)
        {
            $query = "INSERT INTO users (name, surname, email, secret, salt, default_payment_method, default_shipping_address)
        values (:name, :surname, :email, :secret, :salt, :default_payment_method, :default_shipping_address);";
            
            $stm = $this->connection->prepare($query);
            $status = $stm->execute(
                [
                    'name' => $entity->getName(),
                    'surname' => $entity->getSurname(),
                    'email' => $entity->getEmail(),
                    'secret' => $entity->getSecret(),
                    'salt' => $entity->getSalt(),
                    'default_payment_method' => $entity->getDefaultPaymentMethod(),
                    'default_shipping_address' => $entity->getDefaultShippingAddress(),
                ]
            );
            
            if ($status) {
                $entity->setId($this->connection->lastInsertId('users'));
            }
            
            return $entity;
        }
    
        /**
         * @param $entity User
         *
         * @return mixed
         */
        public function update($entity)
        {
            $query = "UPDATE users SET name = :name, surname = :surname, email = :email, secret = :secret,
                salt = :salt, default_payment_method = :default_payment_method, default_shipping_address =:default_shipping_address
            where id = :id;";
            
            $stm = $this->connection->prepare($query);
            $status = $stm->execute(
                [
                    'name' => $entity->getName(),
                    'surname' => $entity->getSurname(),
                    'email' => $entity->getEmail(),
                    'secret' => $entity->getSecret(),
                    'salt' => $entity->getSalt(),
                    'default_payment_method' => $entity->getDefaultPaymentMethod(),
                    'default_shipping_address' => $entity->getDefaultShippingAddress(),
                    'id' => $entity->getId()
                ]
            );
            
            return $entity;
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
         *
         * @return User|null
         */
        public function findByEmail($email)
        {
            $query = "select * from users where email = :email;";
            
            /** @var  \PDOStatement $stm */
            $stm = $this->connection->prepare($query);
            
            $stm->execute(
                [
                    'email' => $email,
                ]
            );
            
            return $stm->fetchObject(User::class);
        }
    }