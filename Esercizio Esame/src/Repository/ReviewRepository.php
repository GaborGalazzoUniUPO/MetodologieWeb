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


}