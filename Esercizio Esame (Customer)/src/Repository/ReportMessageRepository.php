<?php
    
    namespace Repository;
    
    use Entity\ReportMessage;

    class ReportMessageRepository extends AbstractRepository
    {
        
        public function findByOrderId($order_id){
            $query = "select id, order_id, type, text, created_at from report_messages
            where order_id = :order_id order by created_at";
            $stm = $this->connection->prepare($query);
            $stm->execute(['order_id' => $order_id]);
            $resp = [];
            while ($r = $stm->fetchObject(ReportMessage::class)){
                $resp[] = $r;
            }
            return $resp;
        }
        
        public function setRead($order_id){
            $query = "update report_messages set `read` = 1 where order_id = :order_id and type = 1";
            $stm = $this->connection->prepare($query);
            $stm->execute(['order_id' => $order_id]);
            
        }
        
    
        public function save(ReportMessage $msg)
        {
            $query = "insert into report_messages (order_id, text) VALUES
            (:order_id, :text)";
            $stm = $this->connection->prepare($query);
            $stm->execute(['order_id' => $msg->getOrderId(), 'text' => $msg->getText()]);
        }
    
    }