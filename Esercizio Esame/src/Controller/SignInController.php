<?php


namespace Controller;


use Repository\UserRepository;

class SignInController extends AbstractController
{

    public function doGET()
    {
        $this->render('sign-in-page', $_GET);
    }

    public function doPOST()
    {
        $email = $this->get("email");
        $password = $this->get("password");

        $error = [];

        if (!$email)
            $error['email'] = "Insert an email";

        if (!$password)
            $error['password'] = 'Insert a password';

        $userRepository = new UserRepository();


        $user = $userRepository->findByEmail($email);
        if ($user && $password) {
            if (!password_verify($password . $user->getSalt(), $user->getSecret()))
                $error['sign-in'] = "Invalid email or password";
        } else {
            $error['sign-in'] = "Invalid email or password";
        }

        if (count($error) > 0)
            $this->redirect("sign-in", [
                'email' => $email,
                'password' => $password,
                'redirect_to' => $this->get('redirect_to'),
                'error' => $error
            ]);

        $this->startUserSession($user);

        $this->redirect($this->get('redirect_to', 'index'));
    }

    public function doDELETE()
    {
        $this->closeUserSession();
        $this->redirect($this->get('redirect_to', 'index'));
    }
}