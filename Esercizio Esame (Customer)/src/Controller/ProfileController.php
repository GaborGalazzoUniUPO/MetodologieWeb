<?php
    
    namespace Controller;
    
    use Repository\OrderRepository;
    use Repository\PaymentMethodRepository;
    use Repository\ShippingAddressRepository;

    class ProfileController extends AbstractController
    {
    
        public function doGET()
        {
            if (!$this->getUserSession()) {
                $this->redirect('sign-in', ['redirect_to' => '/profile.php']);
            }
            
            $paymentMethods = (new PaymentMethodRepository())->findByOwnerId($this->getUserSession()->getId());
            $shippingAddresses = (new ShippingAddressRepository())->findByOwnerId($this->getUserSession()->getId());
            $orders = (new OrderRepository())->findByOwner($this->getUserSession()->getId());
            
            $this->render('page-profile', [
                'user' => $this->getUserSession(),
                'paymentMethods' => $paymentMethods,
                'shippingAddresses' => $shippingAddresses,
                'orders' => $orders
            ]);
            
        }
    
        public function doPOST()
        {
            // TODO: Implement doPOST() method.
        }
    }