<?php


namespace Controller;


class HomeController extends AbstractController
{

    public function doGET()
    {
        $this->render('page-home');
    }

    public function doPOST()
    {
        $this->doGET();
    }
}