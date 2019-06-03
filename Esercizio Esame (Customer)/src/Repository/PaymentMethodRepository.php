<?php
    
    namespace Repository;
    
    use Entity\PaymentMethod;
    
    class PaymentMethodRepository extends AbstractRepository
    {
        
        /**
         * @param $owner_id
         *
         * @return PaymentMethod[]
         */
        public function findByOwnerId($owner_id)
        {
            $query = "select id,token_id, card_type, last_digits, expiry, owner_id, full_name from payment_methods
            where owner_id = :owner_id and deleted_at is null";
            
            $stm = $this->connection->prepare($query);
            $stm->execute(['owner_id' => $owner_id]);
            $result = [];
            while ($sa = $stm->fetchObject(PaymentMethod::class)) {
                $result[] = $sa;
            }
            
            return $result;
        }
    
        /**
         * @param $id
         * @param $owner_id
         *
         * @return PaymentMethod|null
         */
        public function findByIdAndOwner($id, $owner_id)
        {
            $query = "select id,token_id, card_type, last_digits, expiry, owner_id,full_name from payment_methods
            where owner_id = :owner_id and id = :id";
            
            $stm = $this->connection->prepare($query);
            $stm->execute(['owner_id' => $owner_id, 'id' => $id]);
            if ($r = $stm->fetchObject(PaymentMethod::class)) {
                return $r;
            }
            
            return null;
        }
        
        public function save(PaymentMethod $paymentMethod)
        {
            $query = "insert into payment_methods (card_type, last_digits, expiry, owner_id, token_id, full_name) VALUES
            (:card_type, :last_digits, :expiry, :owner_id, :token_id, :full_name)";
            $stm = $this->connection->prepare($query);
            $status = $stm->execute(
                [
                    'card_type' => $paymentMethod->getCardType(),
                    'last_digits' => $paymentMethod->getLastDigits(),
                    'expiry' => $paymentMethod->getExpiry(),
                    'owner_id' => $paymentMethod->getOwnerId(),
                    'token_id' => $paymentMethod->getTokenId(),
                    'full_name' => $paymentMethod->getFullName(),
                ]
            );
            
            if ($status) {
                $paymentMethod->setId($this->connection->lastInsertId('payment_methods'));
            }
            
            return $paymentMethod;
            
        }
    
        public function delete($id)
        {
            $query = "update payment_methods set deleted_at = CURRENT_TIMESTAMP where id = :id";
            $stm = $this->connection->prepare($query);
            return $stm->execute(['id' =>$id]);
        }
    }