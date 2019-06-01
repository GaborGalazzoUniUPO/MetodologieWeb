<?php


namespace Repository;


use Entity\Review;

class ReviewRepository extends AbstractRepository implements Repository
{

    public function save($entity)
    {
        // TODO: Implement save() method.
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
    
    public function getReviewCountByProductId($id){
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
               r.created_at
        from reviews r
                 inner join users u on r.author_id = u.id
        where r.product_id = :p_id
        order by r.created_at desc 
        limit 5;
        ";

        $stm = $this->connection->prepare($query);
        $stm->execute(['p_id' => $id]);

        $reviews = [];
        while ($review = $stm->fetchObject(Review::class)){
            $reviews[] = $review;
        }
        return $reviews;
    }
    
    public function findByProductId($product_id, $batch, $ord)
    {
        switch ($ord){
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
               r.created_at
        from reviews r
                 inner join users u on r.author_id = u.id
        where r.product_id = :p_id
        order by $ord
        limit :b, 5;
        ";
    
        $batch *= 5;
        $stm = $this->connection->prepare($query);
        $stm->bindParam('b', $batch, \PDO::PARAM_INT);
        $stm->bindParam('p_id', $product_id, \PDO::PARAM_INT);
        $stm->execute();
    
        $reviews = [];
        while ($review = $stm->fetchObject(Review::class)){
            $reviews[] = $review;
        }
        return $reviews;
    }
    
}