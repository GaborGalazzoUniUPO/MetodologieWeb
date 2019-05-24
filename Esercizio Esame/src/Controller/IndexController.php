<?php


namespace Controller;


class IndexController extends AbstractController
{

    public function doGET()
    {
        $this->redirect('home', $_GET);
    }

    public function doPOST()
    {
        // TODO: Implement doPOST() method.
    }
}