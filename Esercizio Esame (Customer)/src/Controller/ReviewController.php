<?php
    
    namespace Controller;
    
    use Entity\Review;
    use Repository\ProductRepository;
    
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
            
            $this->render('page-review-add', ['product' => $product]);
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
            
            $review->setAuthor($this->getUserSession()->getId());
            $review->setContent($this->get('content'));
            $review->setVote(intval($this->get('vote')));
            $review->setProductId($product->getId());
            
            $error = $review->validate();
            
            if(count($error) > 0){
                $this->render('page-review-add',
                    [
                        'product' => $product,
                        'error' => $error,
                        'vote' => $this->get('vote'),
                        'content' => $this->get('content')
                    ]);
            }
            var_dump($_REQUEST);
        }
    }