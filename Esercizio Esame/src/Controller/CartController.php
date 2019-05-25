<?php


namespace Controller;


use Repository\CartRepository;
use Repository\ProductRepository;

class CartController extends AbstractController
{


    public function doGET()
    {
        // TODO: Implement doGET() method.
    }

    public function doPOST()
    {
        $productRepository = new ProductRepository();
        $product = $productRepository->findById($this->get('product_id', -1));

        if (!$product)
            $this->render('error-404');

        $cartRepository = new CartRepository();

        for ($i = 0; $i < $this->get('qta', 1); $i++)
            $cartRepository->addProduct($_SESSION['cart']->getId(), $product->getId());

        $this->redirect($this->get('redirect_to', 'product-list'));
    }
}