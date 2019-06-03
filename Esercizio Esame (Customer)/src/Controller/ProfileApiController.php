<?php
    
    namespace Controller;
    
    use Repository\PaymentMethodRepository;
    use Repository\ShippingAddressRepository;

    class ProfileApiController extends AbstractController
    {
    
        public function doGET()
        {
            // TODO: Implement doGET() method.
        }
    
        public function doPOST()
        {
            // TODO: Implement doPOST() method.
        }
        
        public function doDELETE(){
            
            if($this->get('payment_method'))
            {
                $pmRepo = new PaymentMethodRepository();
                $pm = $pmRepo->findByIdAndOwner($this->get('payment_method'), $this->getUserSession()?$this->getUserSession()->getId():-1);
                if($pm){
                    $pmRepo->delete($pm->getId());
                    http_response_code(200);
                    echo json_encode(["status" => "ok"]);
                    exit(0);
                }else{
                    http_response_code(404);
                    echo json_encode(["status" => "not_found"]);
                    exit(0);
                }
            }
    
            if($this->get('shipping_address'))
            {
                $saRepo = new ShippingAddressRepository();
                $sa = $saRepo->findByIdAndOwner($this->get('shipping_address'), $this->getUserSession()?$this->getUserSession()->getId():-1);
                if($sa){
                    $saRepo->delete($sa->getId());
                    http_response_code(200);
                    echo json_encode(["status" => "ok"]);
                    exit(0);
                }else{
                    http_response_code(404);
                    echo json_encode(["status" => "not_found"]);
                    exit(0);
                }
            }
            
        }
    }