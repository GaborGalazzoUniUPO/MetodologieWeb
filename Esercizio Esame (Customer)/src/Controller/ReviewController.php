<?php
    
    namespace Controller;
    
    use Entity\Review;
    use Repository\ProductRepository;
    use Repository\ReviewRepository;

    class ReviewController extends AbstractController
    {
        
        public function doGET()
        {
            if (!$this->getUserSession()) {
                $this->redirect('sign-in', ['redirect_to' => '/review.php/?product_id='.$this->get('product_id', -1)]);
            }
            $productRepository = new ProductRepository();
            $product = $productRepository->findById($this->get('product_id', -1));
            
            if (!$product) {
                $this->render('error-404');
            }
    
    
            $review = (new ReviewRepository())->findByProductIdAndUserId($product->getId(), $this->getUserSession()?$this->getUserSession()->getId(): -1);
    
    
            $this->render('page-review-add', ['product' => $product, 'review' => $review]);
        }
        
        public function doPOST()
        {
            if (!$this->getUserSession()) {
                $this->redirect('sign-in', ['redirect_to' => '/review.php/?product_id='.$this->get('product_id', -1)]);
            }
            
            $productRepository = new ProductRepository();
            $product = $productRepository->findById($this->get('product_id', -1));
            
            if (!$product) {
                $this->render('error-404');
            }
            
            $review = new Review();
            
            $review->setAuthorId($this->getUserSession()->getId());
            $review->setContent($this->get('content'));
            $review->setVote(intval($this->get('vote')));
            $review->setProductId($product->getId());
            
            $error = $review->validate();
            
            if(count($error) > 0){
                $this->render('page-review-add',
                    [
                        'product' => $product,
                        'error' => $error,
                        'review' => $review
                    ]);
            }
            
            
            $reviewRepo = new ReviewRepository();
            
            try {
                $reviewRepo->save($review);
            }catch (\PDOException $e){
                if($e->errorInfo[1] == 1062)
                    $reviewRepo->update($review);
                else throw $e;
            }
            
            $this->render('page-review-added', [
                'product' => $product,
                'review' => $review
            ]);
        }
        
       
    }