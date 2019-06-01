<?php

namespace Entity;

class User
{

    /**
     * @var int
     */
    private $id;

    /**
     * @var string
     */
    private $name;

    /**
     * @var string
     */
    private $surname;

    /**
     * @var int
     */
    private $salt;

    /**
     * @var string
     */
    private $secret;

    /**
     * @var string
     */
    private $email;
    
    private $default_payment_method;
    
    private $default_shipping_address;
    
    private $from_cookie = false;

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @param int $id
     */
    public function setId(int $id): void
    {
        $this->id = $id;
    }

    /**
     * @return string
     */
    public function getName(): string
    {
        return $this->name;
    }

    /**
     * @param string $name
     */
    public function setName(string $name): void
    {
        $this->name = $name;
    }

    /**
     * @return string
     */
    public function getSurname(): string
    {
        return $this->surname;
    }

    /**
     * @param string $surname
     */
    public function setSurname(string $surname): void
    {
        $this->surname = $surname;
    }

    /**
     * @return int
     */
    public function getSalt(): int
    {
        return $this->salt;
    }

    /**
     * @param int $salt
     */
    public function setSalt(int $salt): void
    {
        $this->salt = $salt;
    }

    /**
     * @return string
     */
    public function getSecret(): string
    {
        return $this->secret;
    }

    /**
     * @param string $secret
     */
    public function setSecret(string $secret): void
    {
        $this->secret = $secret;
    }

    /**
     * @return string
     */
    public function getEmail(): string
    {
        return $this->email;
    }

    /**
     * @param string $email
     */
    public function setEmail(string $email): void
    {
        $this->email = $email;
    }
    
    /**
     * @return mixed
     */
    public function getDefaultPaymentMethod()
    {
        return $this->default_payment_method;
    }
    
    /**
     * @param mixed $default_payment_method
     */
    public function setDefaultPaymentMethod($default_payment_method): void
    {
        $this->default_payment_method = $default_payment_method;
    }
    
    /**
     * @return mixed
     */
    public function getDefaultShippingAddress()
    {
        return $this->default_shipping_address;
    }
    
    /**
     * @param mixed $default_shipping_address
     */
    public function setDefaultShippingAddress($default_shipping_address): void
    {
        $this->default_shipping_address = $default_shipping_address;
    }
    
    /**
     * @return bool
     */
    public function isFromCookie(): bool
    {
        return $this->from_cookie;
    }
    
    /**
     * @param bool $from_cookie
     */
    public function setFromCookie(bool $from_cookie): void
    {
        $this->from_cookie = $from_cookie;
    }
    
    
    
    public function validate()
    {
        $error = [];

        if ($this->name == null || !preg_match('/[a-zA-Z]+/',$this->name))
            $error['name'] = 'The First Name cannot be empty';

        if ($this->surname == null || !preg_match('/[a-zA-Z]+/',$this->surname))
            $error['surname'] = 'The Last Name cannot be empty';

        if ($this->email == null || !filter_var($this->email, FILTER_VALIDATE_EMAIL))
            $error['email'] = 'The email is invalid';

        if ($this->id == null && !preg_match('/(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/', $this->secret))
            $error['secret'] = 'Invalid Password. The password must contain  at least 1 uppercase letter, at least 1 lowercase letter, at least one number, and at least one special character.';


        return $error;
    }
}