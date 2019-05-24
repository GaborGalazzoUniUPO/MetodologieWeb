<?php

namespace Controller;

use Entity\User;

abstract class AbstractController
{

    public function __construct()
    {
        session_start();
    }

    public function doAction(){
        $function = "do" . $_SERVER['REQUEST_METHOD'];
        $this->$function();
    }

    public abstract function doGET();

    public abstract function doPOST();

    protected function get($key, $default = null)
    {
        return isset($_REQUEST[$key]) ? $_REQUEST[$key] : $default;
    }


    /**
     * @param string $template
     * @param array $params
     */
    protected function render($template, $params = [])
    {

        extract($params);

        include_once $_SERVER['DOCUMENT_ROOT'] . DIRECTORY_SEPARATOR . "template" . DIRECTORY_SEPARATOR . $template . ".html.php";
        exit(0);
    }

    protected function redirect($page, $params = [])
    {
        if (strpos($page, '.php/'))
            header("Location: $page&" . http_build_query($params));
        else
            header("Location: /$page.php/?" . http_build_query($params));
        exit(0);
    }


    protected function startUserSession(User $user)
    {
        $this->closeUserSession();

        session_start();
        $_SESSION["user"] = $user;

    }

    protected function getUserSession()
    {
        return $_SESSION["user"];
    }

    protected function closeUserSession()
    {
        session_unset();
        session_regenerate_id(TRUE);
        session_destroy();
    }
}