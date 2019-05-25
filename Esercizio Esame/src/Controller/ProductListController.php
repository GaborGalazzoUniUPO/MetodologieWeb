<?php


namespace Controller;


use Repository\ProductRepository;

class ProductListController extends AbstractController
{

    public function doGET()
    {

        $category = $this->get('category', 0);
        $type = $this->get('type', 0);
        $search_text = $this->get('search_text', '');


        $productRepository = new ProductRepository();

        $products = $productRepository->search($category, $type, $search_text);


        $this->render('page-product-list', [
            'category' => $category,
            'type' => $type,
            'search_text' => $search_text,
            'products' => $products

        ]);
    }

    public function doPOST()
    {
        $this->doGET();
    }
}