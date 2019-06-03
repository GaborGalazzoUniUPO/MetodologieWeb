<?php


namespace Controller;


use Repository\ProductRepository;
use Repository\ReviewRepository;

class ProductController extends AbstractController
{

    public function doGET()
    {
        $product_id = $this->get('id', -1);

        $productRepository = new ProductRepository();

        $product = $productRepository->findById($product_id);

        if(!$product)
            $this->render('error-404');
        
        $this->render('page-product',
            [
                'product' => $product
                ]);


    }

    public function doPOST()
    {
        // TODO: Implement doPOST() method.
    }
}