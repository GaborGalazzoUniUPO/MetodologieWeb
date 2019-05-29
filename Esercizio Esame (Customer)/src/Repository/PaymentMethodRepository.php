<?php
    
    namespace Repository;
    
    use Entity\PaymentMethod;

    class PaymentMethodRepository extends AbstractRepository
    {
    
        /**
         * @param $onwer_id
         *
         * @return PaymentMethod[]
         */
        public function findByOwnerId($owner_id){
            $query = "select token_id, card_type, last_digits, exipry, owner_id from payment_methods
            where owner_id = :owner_id";
        
            $stm = $this->connection->prepare($query);
            $stm->execute(['owner_id' => $owner_id]);
            $result = [];
            while ($sa = $stm->fetchObject(PaymentMethod::class)){
                $result[] = $sa;
            }
            return $result;
        }
    
        public function findByIdAndOwner($id, $owner_id)
        {
            $query = "select token_id, card_type, last_digits, exipry, owner_id from payment_methods
            where owner_id = :owner_id and id = :id";
    
            $stm = $this->connection->prepare($query);
            $stm->execute(['owner_id' => $owner_id, 'id' =>$id]);
            if($r = $stm->fetchObject(PaymentMethod::class))
                return $r;
            return null;
        }
    }