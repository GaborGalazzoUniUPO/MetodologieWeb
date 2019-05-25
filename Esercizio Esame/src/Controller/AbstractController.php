<?php

namespace Controller;

use Entity\User;
use Functionality\Database;
use Repository\CookieRepository;

abstract class AbstractController
{
    /** @var CookieRepository  */
    private $cookieRepository;

    public function __construct()
    {
        $this->cookieRepository = new CookieRepository();
    }

    public function doAction()
    {
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

        include_once $_SERVER['DOCUMENT_ROOT'] . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . "template" . DIRECTORY_SEPARATOR . $template . ".html.php";
        exit(0);
    }

    protected function redirect($page, $params = [])
    {
        if (strpos($page, '.php?'))
            header("Location: $page&" . http_build_query($params));
        else
            header("Location: /$page.php?" . http_build_query($params));
        exit(0);
    }


    protected function startUserSession(User $user)
    {
        session_destroy();
        session_regenerate_id(TRUE);

        session_start();
        $_SESSION["user"] = $user;
        $cookie_session = $this->cookieRepository->generateSessionCookie($user);
        setcookie('cookie_session', $cookie_session, time()+2592000);

    }

    protected function validateUserSession()
    {

        if (!isset($_SESSION["user"])) {
            if (isset($_COOKIE['cookie_session'])) {
                $_SESSION["user"] = $this->cookieRepository->getUserByCookieSession($_COOKIE['cookie_session']);
            }else
                $_SESSION["user"] = null;
        }
    }

    protected function closeUserSession()
    {
        session_unset();
        session_regenerate_id(TRUE);
        session_destroy();
        if (isset($_COOKIE['cookie_session'])) {
            setcookie('cookie_session', '', -1);
        }

    }
}