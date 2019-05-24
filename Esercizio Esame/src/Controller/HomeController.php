<?php


namespace Controller;


class HomeController extends AbstractController
{

    public function doGET()
    {
        $this->render('home-page', $_GET);
    }

    public function doPOST()
    {
        // TODO: Implement doPOST() method.
    }
}