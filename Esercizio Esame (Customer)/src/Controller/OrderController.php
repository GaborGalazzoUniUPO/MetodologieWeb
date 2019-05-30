<?php
    
    namespace Controller;
    
    use Entity\Cart;
    use Entity\Order;
    use Entity\PaymentMethod;
    use Functionality\PaymentService;
    use Repository\CartRepository;
    use Repository\OrderRepository;

    class OrderController extends AbstractController
    {
    
        public function doGET()
        {
            // TODO: Implement doGET() method.
        }
    
        public function doPOST()
        {
            if(isset($_SESSION['checkout-confirm'])){
                extract($_SESSION['checkout-confirm']);
    
                /**
                 * @var $cart                        \Entity\Cart
                 * @var $product                     \Entity\CartProduct
                 * @var $shippingAddress             \Entity\ShippingAddress
                 * @var $paymentMethod               \Entity\PaymentMethod
                 * @var $user                        \Entity\User
                 * @var $shipment_type               integer
                 */
                $resp = PaymentService::charge($paymentMethod->getTokenId(), $cart->getTotal()+($shipment_type ? 20:10));
                if($resp['error'])
                    $this->render('error-generic',[
                        "error" => "Payment Error: ".$resp['error']
                    ]);
                
                $order = new Order();
                $order->setOwnerId($user->getId());
                $order->setTransaction($resp['transaction']);
                $order->setShipmentType($shipment_type);
                $order->setPaymentMethodId($paymentMethod->getId());
                $order->setShippingAddressId($shippingAddress->getId());
                $order->setCode(uniqid("ord_"));
                
                $orderRepo = new OrderRepository();
                $orderRepo->save($order, $cart->getId());
    
                $_SESSION['cart'] = (new CartRepository())->findById($cart->getId());
                
                
                $this->render('page-order-success',[
                    'order' => $order
                ]);
                
                
                
                
                
            }else{
                $this->render('error-generic',[
                    "error" => "Checkout confirm session expired: please retry to do the checkout again."
                ]);
            }
            
        }
    }