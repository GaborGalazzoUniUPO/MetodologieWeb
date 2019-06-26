<?php

namespace Controller;

use Entity\User;
use Functionality\Database;
use Repository\CookieRepository;

abstract class AbstractController
{
    /** @var CookieRepository */
    private $cookieRepository;

    public function __construct()
    {
        $this->cookieRepository = new CookieRepository();
        $this->init();
    }

    public function init()
    {
        session_start();

        if (!isset($_SESSION["user"]) || !$_SESSION['user']) {
            if (isset($_COOKIE['cookie_session'])) {
                $_SESSION["user"] = (new \Repository\CookieRepository())->getUserByCookieSession(
                    $_COOKIE['cookie_session']
                );
                if ($_SESSION["user"])
                    $_SESSION["user"]->setFromCookie(true);
            } else {
                $_SESSION["user"] = null;
            }
        }

        $cartRepository = new \Repository\CartRepository();

        if (isset($_COOKIE['cookie_cart'])) {
            $_SESSION["cart"] = $cartRepository->findByCookie($_COOKIE['cookie_cart']);
        } else {
            if (isset($_SESSION["cart"])) {
                $sessionCart = $cartRepository->findByCookie($_SESSION["cart"]->getCookieCart());
                if ($sessionCart) {
                    setcookie('cookie_cart', $_SESSION["cart"]->getCookieCart(), time() + 2592000, "/");
                } else {
                    unset($_SESSION["cart"]);
                }
            }
        }

        if (!isset($_SESSION["cart"])) {
            if (isset($_SESSION["user"]) && $_SESSION['user']) {
                $_SESSION["cart"] = $cartRepository->findActiveByUser($_SESSION["user"]->getId());
                if ($_SESSION["cart"]) {
                    setcookie('cookie_cart', $_SESSION["cart"]->getCookieCart(), time() + 2592000, "/");
                } else {
                    $cookie_cart = $cartRepository->createCart($_SESSION["user"]->getId());
                    setcookie('cookie_cart', $cookie_cart, time() + 2592000, "/");
                    $_SESSION["cart"] = $cartRepository->findByCookie($cookie_cart);
                }
            } else {
                $cookie_cart = $cartRepository->createCart();
                setcookie('cookie_cart', $cookie_cart, time() + 2592000, "/");
                $_SESSION["cart"] = $cartRepository->findByCookie($cookie_cart);
            }
        } else {
            if (isset($_SESSION["user"])) {
                if ($_SESSION["cart"]->getOwnerId() != $_SESSION["user"]->getId()) {
                    $user_cart = $cartRepository->findActiveByUser($_SESSION["user"]->getId());
                    if ($_SESSION["cart"]->getOwnerId() == null) {
                        if (!$user_cart) {
                            $_SESSION["cart"]->setOwnerId($_SESSION['user']->getId());
                            $cartRepository->update($_SESSION["cart"]);
                        } else {
                            $cartRepository->mergeCarts($user_cart->getId(), $_SESSION["cart"]->getId());
                            $_SESSION["cart"] = $cartRepository->findActiveByUser($_SESSION["user"]->getId());
                            setcookie('cookie_cart', $user_cart->getCookieCart(), time() + 2592000, "/");
                        }
                    } else {
                        $_SESSION["cart"] = $user_cart;
                        setcookie('cookie_cart', $user_cart->getCookieCart(), time() + 2592000, "/");
                    }
                }
            }
        }

        if (isset($_SESSION['checkout-confirm'])) {
            $_SESSION['checkout-confirm']['expiry']--;

            if ($_SESSION['checkout-confirm']['expiry'] < 0) {
                unset($_SESSION['checkout-confirm']);
            }
        }
    }

    public function doAction()
    {
        if (isset($_REQUEST['action']) && $_SERVER['REQUEST_METHOD'] == 'POST') {
            $function = "do" . $_REQUEST['action'];
        } else {
            $function = "do" . $_SERVER['REQUEST_METHOD'];
        }
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
        if (strpos($page, '.php?') || strpos($page, '.php/?')) {
            header("Location: $page&" . http_build_query($params));
        } elseif (substr_compare($page, '.php', -strlen('.php')) === 0) {
            header("Location: $page/?&" . http_build_query($params));
        } else {
            header("Location: /$page.php?" . http_build_query($params));
        }
        exit(0);
    }

    protected function startUserSession(User $user)
    {
        session_destroy();

        session_start();
        session_regenerate_id(true);
        $_SESSION["user"] = $user;
        $cookie_session = $this->cookieRepository->generateSessionCookie($user);
        setcookie('cookie_session', $cookie_session, time() + 2592000, "/");

    }

    /**
     * @return User
     */
    protected function getUserSession()
    {
        return $_SESSION["user"];
    }

    protected function closeUserSession()
    {
        session_unset();
        session_regenerate_id(true);
        session_destroy();
        if (isset($_COOKIE['cookie_session'])) {
            setcookie('cookie_session', '', -1, "/");
        }

    }

    protected function goBack()
    {
        $this->render('action-go-back');
    }
}