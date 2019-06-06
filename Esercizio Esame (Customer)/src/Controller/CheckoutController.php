<?php
    
    namespace Controller;
    
    use Entity\PaymentMethod;
    use Entity\ShippingAddress;
    use Functionality\PaymentService;
    use Repository\PaymentMethodRepository;
    use Repository\ShippingAddressRepository;
    use Repository\UserRepository;

    class CheckoutController extends AbstractController
    {
        
        public function doGET()
        {
            
            if (!$this->getUserSession() || $this->getUserSession()->isFromCookie()) {
                $this->redirect('sign-in', ['redirect_to' => 'checkout']);
            }
            
            $pmRepo = new PaymentMethodRepository();
            
            $paymentMethods = $pmRepo->findByOwnerId($this->getUserSession()->getId());
            
            $saRepo = new ShippingAddressRepository();
            
            $shippingAddresses = $saRepo->findByOwnerId($this->getUserSession()->getId());
            
            $this->render(
                'page-checkout',
                array_merge(
                    [
                        'cart' => $_SESSION['cart'],
                        'user' => $this->getUserSession(),
                        'paymentMethods' => $paymentMethods,
                        'shippingAddresses' => $shippingAddresses,
                    ],
                    $_REQUEST
                )
            );
        }
        
        public function doPOST()
        {
            if (!$this->getUserSession() || $this->getUserSession()->isFromCookie()) {
                $this->redirect('sign-in', ['redirect_to' => 'checkout']);
            }
            $error = [];
            
            $shippingAddress = $this->get('shipping_address', -1);
            $paymentMethod = $this->get('payment_method', -1);
            
            $saRepo = new ShippingAddressRepository();
            $pmRepo = new PaymentMethodRepository();
            
            if ($shippingAddress == 'new') {
                
                $shippingAddress = new ShippingAddress();
                $shippingAddress->setFullName($this->get('address_full_name'));
                $shippingAddress->setStreet($this->get('street'));
                $shippingAddress->setCity($this->get('city'));
                $shippingAddress->setRegion($this->get('region'));
                $shippingAddress->setZipCode($this->get('zip_code'));
                $shippingAddress->setCountry($this->get('country'));
                $shippingAddress->setOwnerId($this->getUserSession()->getId());
                
                $saErrors = $shippingAddress->validate();
                
                if (count($saErrors) > 0) {
                    $error = array_merge($error, $saErrors);
                } else {
                    $saRepo->save($shippingAddress);
                }
            } else {
                $shippingAddress = $saRepo->findByIdAndOwner($shippingAddress, $this->getUserSession()->getId());
                
            }
            
            if ($paymentMethod == 'new') {
                
                
                $result = PaymentService::registerCard(
                    $this->get('number'),
                    $this->get('full_name'),
                    $this->get('exp_month'),
                    $this->get('exp_year'),
                    $this->get('cvc')
                );
                if (count($result['error']) > 0) {
                    $error = array_merge($error, $result['error']);
                } else {
                    $paymentMethod = new PaymentMethod();
                    $paymentMethod->setFullName($result['full_name']);
                    $paymentMethod->setCardType($result['card_type']);
                    $paymentMethod->setExpiry($result['expiry']);
                    $paymentMethod->setLastDigits($result['last_digits']);
                    $paymentMethod->setTokenId($result['token_id']);
                    $paymentMethod->setOwnerId($this->getUserSession()->getId());
                    
                    $pmRepo->save($paymentMethod);
                }
                
            } else {
                $paymentMethod = $pmRepo->findByIdAndOwner($paymentMethod, $this->getUserSession()->getId());
                
            }
            
            if (!$shippingAddress) {
                $error['shipping_address'] = "Shipping address required";
            }
            if (!$paymentMethod) {
                $error['payment_method'] = "Payment method required";
            }



            if (count($error) > 0) {

                $paymentMethods = $pmRepo->findByOwnerId($this->getUserSession()->getId());
                $shippingAddresses = $saRepo->findByOwnerId($this->getUserSession()->getId());
                $this->render(
                    "page-checkout",
                    array_merge(
                        [
                            'cart' => $_SESSION['cart'],
                            'user' => $this->getUserSession(),
                            'error' => $error,
                            'paymentMethods' => $paymentMethods,
                            'shippingAddresses' => $shippingAddresses,
                        ],
                        $_REQUEST
                    )
                );
            }
            
            $this->getUserSession()->setDefaultPaymentMethod($paymentMethod->getId());
            $this->getUserSession()->setDefaultShippingAddress($shippingAddress->getId());
            
            $userRepo = new UserRepository();
            $userRepo->update($this->getUserSession());
            

           
            $_SESSION['checkout-confirm'] = [
                'paymentMethod' => $paymentMethod,
                'shippingAddress' => $shippingAddress,
                'cart' => $_SESSION['cart'],
                'shipment_type' => $this->get('shipment_type',0),
                'user' => $this->getUserSession(),
                'expiry' => 1
            ];
            
            $this->render("page-checkout-confirm", [
                'paymentMethod' => $paymentMethod,
                'shippingAddress' => $shippingAddress,
                'cart' => $_SESSION['cart'],
                'shipment_type' => $this->get('shipment_type',0),
                'user' => $this->getUserSession(),
            ]);
        }
    }