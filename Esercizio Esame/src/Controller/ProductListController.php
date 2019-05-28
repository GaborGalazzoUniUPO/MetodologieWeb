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
        $order_p = $this->get('order');
        $page = $this->get('page', 0);
        $order = 'id desc';
        switch ($order_p){
            case 'name_asc':
                $order = 'p.name asc';
                break;
            case 'name_desc':
                $order = 'p.name desc';
                break;
            case 'price_desc':
                $order = 'p.unit_price desc';
                break;
            case 'price_asc':
                $order = 'p.unit_price asc';
                break;
            default:
                $order = 'p.id desc';
                break;

        }


        $productRepository = new ProductRepository();

        $products = $productRepository->search($category, $type, $search_text, $order, $page);


        $this->render('page-product-list', [
            'category' => $category,
            'type' => $type,
            'search_text' => $search_text,
            'products' => $products,
            'order' => $order_p

        ]);
    }

    public function doPOST()
    {
        $this->doGET();
    }
}