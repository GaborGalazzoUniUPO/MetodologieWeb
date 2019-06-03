<?php
    
    namespace Repository;
    
    use Entity\Review;
    
    class ReviewRepository extends AbstractRepository implements Repository
    {
        
        /**
         * @param $entity Review
         */
        public function save($entity)
        {
            $query = "insert into reviews (author_id, product_id, vote, content) values
        (:author_id, :product_id, :vote, :content)";
            $stm = $this->connection->prepare($query);
            $stm->execute(
                [
                    "author_id" => $entity->getAuthorId(),
                    "product_id" => $entity->getProductId(),
                    "vote" => $entity->getVote(),
                    "content" => $entity->getContent(),
                ]
            );
            $entity->setId($this->connection->lastInsertId('reviews'));
        }
    
        /**
         * @param $entity Review
         */
        public function update($entity)
        {
            $query = "update reviews set vote = :vote, content = :content
            where author_id = :author_id and product_id = :product_id";
            $stm = $this->connection->prepare($query);
            $stm->execute(
                [
                    "author_id" => $entity->getAuthorId(),
                    "product_id" => $entity->getProductId(),
                    "vote" => $entity->getVote(),
                    "content" => $entity->getContent(),
                ]
            );
        }
    
        public function delete($id)
        {
            $query = "delete from reviews
            where id = :id";
            $stm = $this->connection->prepare($query);
            $stm->execute(
                [
                    "id" => $id,
                ]
            );
        }
        
        public function findById($id)
        {
            // TODO: Implement findById() method.
        }
        
        public function findAll()
        {
            // TODO: Implement findAll() method.
        }
        
        public function getReviewCountByProductId($id)
        {
            $query = "
        select count(r.id)
        from reviews r
        where r.product_id = :p_id;
        ";
            
            $stm = $this->connection->prepare($query);
            $stm->execute(['p_id' => $id]);
            
            return $stm->fetchColumn();
        }
        
        public function findRecentByProductId($id)
        {
            
            $query = "
        select concat(u.name, ' ', u.surname) as author,
               r.vote,
               r.content,
               r.created_at,
               r.author_id,
               r.id
        from reviews r
                 inner join users u on r.author_id = u.id
        where r.product_id = :p_id
        order by r.created_at desc 
        limit 5;
        ";
            
            $stm = $this->connection->prepare($query);
            $stm->execute(['p_id' => $id]);
            
            $reviews = [];
            while ($review = $stm->fetchObject(Review::class)) {
                $reviews[] = $review;
            }
            
            return $reviews;
        }
        
        public function findByProductId($product_id, $batch, $ord, $user_id)
        {
            switch ($ord) {
                case 'rate_asc':
                    $ord = 'r.vote asc';
                    break;
                case 'rate_desc':
                    $ord = 'r.vote desc';
                    break;
                case 'date_asc':
                    $ord = 'r.created_at asc';
                    break;
                default:
                    $ord = 'r.created_at desc';
                    break;
            }
            $query = "
        select concat(u.name, ' ', u.surname) as author,
               r.vote,
               r.content,
               r.created_at,
               r.author_id,
               r.id,
               r.author_id = :author_id as is_author
        from reviews r
                 inner join users u on r.author_id = u.id
        where r.product_id = :p_id
        order by is_author desc, $ord
        limit :b, 5;
        ";
            
            $batch *= 5;
            $stm = $this->connection->prepare($query);
            $stm->bindParam('b', $batch, \PDO::PARAM_INT);
            $stm->bindParam('p_id', $product_id, \PDO::PARAM_INT);
            $stm->bindParam('author_id', $user_id, \PDO::PARAM_INT);
            $stm->execute();
            
            $reviews = [];
            while ($review = $stm->fetchObject(Review::class)) {
                $reviews[] = $review;
            }
            
            return $reviews;
        }
    
        public function findByProductIdAndUserId($product_id, $user_id)
        {
            $query = "
        select concat(u.name, ' ', u.surname) as author,
               r.vote,
               r.content,
               r.created_at,
               r.author_id,
               r.id
        from reviews r
                 inner join users u on r.author_id = u.id
        where r.product_id = :p_id
        and r.author_id = :author_id
        limit 1;
        ";
    
            $stm = $this->connection->prepare($query);
            $stm->execute(['p_id' => $product_id, 'author_id' => $user_id]);
    
          
            if($review = $stm->fetchObject(Review::class))
                return $review;
            return null;
        }
    
    }