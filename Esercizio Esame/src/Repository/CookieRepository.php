<?php


namespace Repository;


use Entity\User;
use Functionality\Database;

class CookieRepository extends AbstractRepository
{

    public function getUserByCookieSession($cookie_session){

        $stm = $this->connection->prepare("
                select u.*
                from cookies c
                         left join users u on c.user_id = u.id
                where c.cookie_session = :cookie_session;");
        $stm->execute(['cookie_session' => $cookie_session]);
        return $stm->fetchObject(User::class);
    }


    public function generateSessionCookie(User $user)
    {
        $session_cookie = uniqid();
        $stm = $this->connection->prepare("
                insert into cookies (cookie_session, user_id)
                values (:cookie_session, :user_id);");
        $stm->execute(['cookie_session' => $session_cookie, 'user_id' => $user->getId()]);
        return $session_cookie;
    }
}