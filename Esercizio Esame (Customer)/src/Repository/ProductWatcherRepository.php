<?php
    
    namespace Repository;
    

    use Entity\ProductWatcher;

    class ProductWatcherRepository extends AbstractRepository implements Repository
    {
    
        /**
         * @param $entity ProductWatcher
         */
        public function save($entity)
        {
           $query = "insert into product_watchers (product_id, user_id) values (:product_id, :user_id)";
           $stm = $this->connection->prepare($query);
           $stm->execute(['product_id' => $entity->getProductId(), 'user_id' => $entity->getUserId()]);
        }
    
        public function update($entity)
        {
            // TODO: Implement update() method.
        }

        /**
         * @param $entity ProductWatcher
         */
        public function delete($entity)
        {
            $query = "delete from product_watchers where (product_id = :product_id and user_id = :user_id)";
            $stm = $this->connection->prepare($query);
            $stm->execute(['product_id' => $entity->getProductId(), 'user_id' => $entity->getUserId()]);
        }
    
        public function findById($id)
        {
            // TODO: Implement findById() method.
        }
    
        public function findAll()
        {
            // TODO: Implement findAll() method.
        }


    }