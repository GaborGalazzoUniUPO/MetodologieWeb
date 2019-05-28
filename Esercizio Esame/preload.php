<?php

/**
 * Preload File to require in each page to load classes and configurations
 */

spl_autoload_register(
    function ($class) {
        require_once "src/$class.php";
    }
);

$config = require_once "config.php";

\Functionality\Database::getConnection($config['database']);


session_start();

if (!isset($_SESSION["user"])) {
    if (isset($_COOKIE['cookie_session'])) {
        $_SESSION["user"] = (new \Repository\CookieRepository())->getUserByCookieSession($_COOKIE['cookie_session']);
    } else
        $_SESSION["user"] = null;
}

$cartRepository = new \Repository\CartRepository();


if (isset($_COOKIE['cookie_cart'])) {
    $_SESSION["cart"] = $cartRepository->findByCookie($_COOKIE['cookie_cart']);
} else if(isset($_SESSION["cart"])){
    setcookie('cookie_cart', $_SESSION["cart"]->getCookieCart(), time() + 2592000);
}


if (!isset($_SESSION["cart"])) {
    if (isset($_SESSION["user"])) {
        $_SESSION["cart"] = $cartRepository->findActiveByUser($_SESSION["user"]->getId());
        if ($_SESSION["cart"]) {
            setcookie('cookie_cart', $_SESSION["cart"]->getCookieCart(), time() + 2592000);
        } else {
            $cookie_cart = $cartRepository->createCart($_SESSION["user"]->getId());
            setcookie('cookie_cart', $cookie_cart, time() + 2592000);
            $_SESSION["cart"] = $cartRepository->findByCookie($cookie_cart);
        }
    }else{
        $cookie_cart = $cartRepository->createCart();
        setcookie('cookie_cart', $cookie_cart, time() + 2592000);
        $_SESSION["cart"] = $cartRepository->findByCookie($cookie_cart);
    }
}else {
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
                    setcookie('cookie_cart', $user_cart->getCookieCart(), time() + 2592000);
                }
            } else {
                $_SESSION["cart"] = $user_cart;
                setcookie('cookie_cart', $user_cart->getCookieCart(), time() + 2592000);
            }
        }
    }
}

