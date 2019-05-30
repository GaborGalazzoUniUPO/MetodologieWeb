<?php
    
    namespace Repository;
    
    class OrderRepository extends AbstractRepository
    {
        
        public function save(\Entity\Order $order, $cart_id)
        {
            $this->connection->beginTransaction();
            try {
                $query = "insert into orders (transaction, owner_id, shipment_type, payment_method_id, shipping_address_id, code)
                VALUES   (:transaction, :owner_id, :shipment_type, :payment_method_id, :shipping_address_id, :code);";
                $stm = $this->connection->prepare($query);
                $r = $stm->execute(
                    [
                        'transaction' => $order->getTransaction(),
                        'owner_id' => $order->getOwnerId(),
                        'shipment_type' => $order->getShipmentType(),
                        'payment_method_id' => $order->getPaymentMethodId(),
                        'shipping_address_id' => $order->getShippingAddressId(),
                        'code' => $order->getCode(),
                    ]
                );
                if ($r) {
                    $order->setId($this->connection->lastInsertId('orders'));
                }
                
                $query = "insert into order_products (stock_unit, order_id) select stock_unit, :order_id from cart_products where cart_id = :cart_id;";
                $stm = $this->connection->prepare($query);
                $r = $stm->execute(
                    [
                        'order_id' => $order->getId(),
                        'cart_id' => $cart_id,
                    ]
                );
                
                $query = "delete from cart_products where cart_id = :cart_id";
                $stm = $this->connection->prepare($query);
                $r = $stm->execute(
                    [
                        'cart_id' => $cart_id,
                    ]
                );
                $this->connection->commit();
            } catch (\Exception $e) {
                $this->connection->rollBack();
                throw $e;
            }
            
            return $order;
            
        }
        
        public function moveProductsFromCartToOrder($order, $cart_id)
        {
        
        }
    }