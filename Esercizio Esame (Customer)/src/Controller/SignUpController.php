<?php

namespace Controller;

use Controller\AbstractController;
use Entity\User;
use Repository\UserRepository;

class SignUpController extends AbstractController{

    public  function doGET(){
        
        $this->render("page-sign-up", $_GET);
    }

    public  function doPOST(){

        $user = new User();
        $user->setName($this->get('name'));
        $user->setSurname($this->get('surname'));
        $user->setSecret($this->get('secret'));
        $user->setEmail($this->get('email'));

        $error = $user->validate();

        if(count($error) > 0)
            $this->render("page-sign-up",[
                'name' => $user->getName(),
                'surname' => $user->getSurname(),
                'secret' => $user->getSecret(),
                'email' => $user->getEmail(),
                'redirect_to' => $this->get('redirect_to'),
                'error' => $error
            ]);

        $pwd = $user->getSecret();

        // Store password securely
        $user->setSalt(rand(1000000,9999999));
        $password = $pwd.$user->getSalt();
        $hash =  password_hash($password, PASSWORD_BCRYPT, ['cost' => 12]);
        $user->setSecret($hash);

        try {
            //Save user on DB
            $userRepo = new UserRepository();
            $userRepo->save($user);
        }catch (\PDOException $e){

            $error = [];
            if ($e->errorInfo[1] == 1062) {
                $error['email'] = 'This Email has already been used';
            }else {
                $error['internal'] = $e->getMessage();
            }

            $this->redirect("sign-up", [
                'name' => $user->getName(),
                'surname' => $user->getSurname(),
                'secret' => $pwd,
                'email' => $user->getEmail(),
                'redirect_to' => $this->get('redirect_to'),
                'error' => $error
            ]);
        }

        $this->startUserSession($user);

        $this->redirect($this->get('redirect_to', 'index'));
    }




}