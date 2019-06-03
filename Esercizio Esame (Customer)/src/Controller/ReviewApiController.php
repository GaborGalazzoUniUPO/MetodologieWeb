<?php
    
    namespace Controller;
    
    use Repository\ReviewRepository;

    class ReviewApiController extends AbstractController
    {
    
        public function doGET()
        {
            $product_id = $this->get('product_id');
            $revRepo = new ReviewRepository();
            
            $ord = $this->get('ord');
            $batch = $this->get('batch', 0);
            
            $revCount = $revRepo->getReviewCountByProductId($product_id);
            $reviews = $revRepo->findByProductId($product_id, $batch, $ord, $this->getUserSession()?$this->getUserSession()->getId():-1);
            
            
            echo json_encode(
                ["count" => $revCount, "reviews" => $reviews]
            );
            
            
        }
    
        public function doPOST()
        {
            // TODO: Implement doPOST() method.
        }
    
        public function doDELETE(){
            $reviewRepo = new ReviewRepository();
        
            $review = $reviewRepo->findByProductIdAndUserId($this->get('product_id'), $this->getUserSession()?$this->getUserSession()->getId():-1);
        
            $reviewRepo->delete($review?$review->getId():-1);
            
            $this->doGET();
        
           
        }
    }