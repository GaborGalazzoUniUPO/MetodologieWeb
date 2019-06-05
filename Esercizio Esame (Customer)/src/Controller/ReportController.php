<?php
    
    namespace Controller;
    
    use Entity\ReportMessage;
    use Repository\OrderRepository;
    use Repository\ReportMessageRepository;

    class ReportController extends AbstractController
    {
    
        public function doGET()
        {
            if (!$this->getUserSession()) {
                $this->redirect('sign-in', ['redirect_to' => '/report.php?order_id='.$this->get('order_id')]);
            }
            
            $orderRepo = new OrderRepository();
            $order = $orderRepo->findByIdAndOwner($this->get('order_id'), $this->getUserSession()->getId());
    
            if(!$order)
                $this->render('error-404');
            
            $reportMessageRepo = new ReportMessageRepository();
            
            $msgs = $reportMessageRepo->findByOrderId($order->getId());
            $reportMessageRepo->setRead($order->getId());
            
            $this->render('page-report', ['msgs' => $msgs, 'order' => $order]);
        }
    
        public function doPOST()
        {
            if (!$this->getUserSession()) {
                $this->redirect('sign-in', ['redirect_to' => '/report.php?order_id='.$this->get('order_id')]);
            }
    
            $orderRepo = new OrderRepository();
            $order = $orderRepo->findByIdAndOwner($this->get('order_id'), $this->getUserSession()->getId());
    
            if(!$order)
                $this->render('error-404');
            
            $msg = new ReportMessage();
            $msg->setOrderId($order->getId());
            $msg->setText($this->get('text'));
    
            $reportMessageRepo = new ReportMessageRepository();
            
            $reportMessageRepo->save($msg);
            
            $this->redirect('report', ['order_id' => $order->getId()]);
        }
    }