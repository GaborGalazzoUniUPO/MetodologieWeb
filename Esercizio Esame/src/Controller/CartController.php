<?php


namespace Controller;


use Repository\CartRepository;
use Repository\ProductRepository;

class CartController extends AbstractController
{


    public function doGET()
    {
        $this->render('page-cart', ['cart' => $_SESSION['cart']]);
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

        $this->goBack();
        $this->redirect($this->get('redirect_to', 'product-list'));
    }

    public function doDELETE(){

        $product_id = $this->get('product_id', -1);

        $cartRepository = new CartRepository();

        $cartRepository->removeProduct($_SESSION['cart']->getId(), $product_id);

        $this->goBack();
        $this->redirect('cart');

    }
}