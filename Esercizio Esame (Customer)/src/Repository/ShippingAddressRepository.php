<?php
    
    namespace Repository;
    
    use Entity\ShippingAddress;

    class ShippingAddressRepository extends AbstractRepository
    {
        /**
         * @param $onwer_id
         *
         * @return ShippingAddress[]
         */
        public function findByOwnerId($owner_id){
            $query = "select id, street, city, region, country, zip_code, full_name, owner_id from shipping_addresses
            where owner_id = :owner_id";
            
            $stm = $this->connection->prepare($query);
            $stm->execute(['owner_id' => $owner_id]);
            $result = [];
            while ($sa = $stm->fetchObject(ShippingAddress::class)){
                $result[] = $sa;
            }
            return $result;
        }
    
        public function findByIdAndOwner($id, $owner_id)
        {
            $query = "select id, street, city, region, country, zip_code, full_name, owner_id from shipping_addresses
            where owner_id = :owner_id and id = :id";
    
            $stm = $this->connection->prepare($query);
            $stm->execute(['owner_id' => $owner_id, 'id' =>$id]);
            
            if($r = $stm->fetchObject(ShippingAddress::class))
                return $r;
            return null;
        }
    
    }