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
        $order = $this->get('order');
        $page = $this->get('page', 0);


        $order_field = 'p.id';
        $order_direction = 'desc';
        switch ($order){
            case 'name_asc':
                $order_field = 'p.name';
                $order_direction = 'asc';
                break;
            case 'name_desc':
                $order_field = 'p.name';
                $order_direction = 'desc';
                break;
            case 'price_desc':
                $order_field = 'p.unit_price';
                $order_direction = 'desc';
                break;
            case 'price_asc':
                $order_field = 'p.unit_price';
                $order_direction = 'asc';
                break;
        }


        $productRepository = new ProductRepository();

        $productCount = $productRepository->searchCount($category, $type, $search_text);

        $products = $productRepository->search($category, $type, $search_text, $order_field, $order_direction, $page);


        $this->render('page-product-list', [
            'category' => $category,
            'type' => $type,
            'search_text' => $search_text,
            'products' => $products,
            'order' => $order,
            'product_count' => $productCount,
            'page' => $page

        ]);
    }

    public function doPOST()
    {
        $this->doGET();
    }
}