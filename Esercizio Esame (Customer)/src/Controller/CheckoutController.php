<?php
    
    namespace Controller;
    
    use Entity\ShippingAddress;
    use Repository\PaymentMethodRepository;
    use Repository\ShippingAddressRepository;

    class CheckoutController extends AbstractController
    {
    
        public function doGET()
        {
            
            if(!$this->getUserSession())
                $this->redirect('sign-in', ['redirect_to' => 'checkout']);
            
            $pmRepo = new PaymentMethodRepository();
            
            $paymentMethods = $pmRepo->findByOwnerId($this->getUserSession()->getId());
            
            $saRepo = new ShippingAddressRepository();
            
            $shippingAddresses = $saRepo->findByOwnerId($this->getUserSession()->getId());
            
            $this->render('page-checkout',
                array_merge([
                    'cart' => $_SESSION['cart'],
                    'user' => $this->getUserSession(),
                    'paymentMethods' => $paymentMethods,
                    'shippingAddresses' => $shippingAddresses
                ], $_REQUEST));
        }
    
        public function doPOST()
        {
            if(!$this->getUserSession())
                $this->redirect('sign-in', ['redirect_to' => 'checkout']);
            $error = [];
            
            $shippingAddress = $this->get('shipping_address', -1);
            $paymentMethod = $this->get('payment_method', -1);
            
            $saRepo = new ShippingAddressRepository();
            $pmRepo = new PaymentMethodRepository();
            
            if($shippingAddress == 'new'){
            
            } else {
                $shippingAddress = $saRepo->findByIdAndOwner($shippingAddress, $this->getUserSession()->getId());
                
            }
    
            if($paymentMethod == 'new'){
        
            } else {
                $paymentMethod = $pmRepo->findByIdAndOwner($paymentMethod, $this->getUserSession()->getId());
                
            }
    
            if(!$shippingAddress)
                $error['shipping_address'] = "Shipping address required";
            if(!$paymentMethod)
                $error['payment_method'] = "Payment method required";
            
            if(count($error) > 0)
                $this->redirect("checkout",
                    array_merge([
                        'error' => $error
                    ], $_REQUEST));
            var_dump([$_REQUEST, $error]);
        }
    }