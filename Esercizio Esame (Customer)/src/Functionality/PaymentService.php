<?php
    
    namespace Functionality;
    
    class PaymentService
    {
        
        public static function validateCardNumber($number)
        {
            $cardtype = array(
                "visa" => "/^4[0-9]{12}(?:[0-9]{3})?$/",
                "mastercard" => "/^5[1-5][0-9]{14}$/",
            );
            
            if (preg_match($cardtype['visa'], $number)) {
                return 'Visa';
                
            } else {
                if (preg_match($cardtype['mastercard'], $number)) {
                    return 'Mastercard';
                } else {
                    return false;
                }
            }
        }
    
        public static function validateFullName($full_name)
        {
            return preg_match("/^[\w\s]+$/", $full_name);
        }
    
        public static function validateExpiry($month, $year)
        {
            try {
                $date = date_create_from_format('Y-n-1', "$year-$month-1");
                if(!$date)
                    return false;
                return $date->getTimestamp() > strtotime('now');
            }catch (\Exception $e){
                return false;
            }
        
        }
    
        public static function validateCVC($cvc)
        {
            return preg_match("/^[0-9]{3}$/", $cvc);
        }
    
        public static function registerCard($number, $full_name, $exp_month, $exp_year, $cvc)
        {
            $error = [];
            if(!($cardType = PaymentService::validateCardNumber($number))){
                $error['number'] = 'Invalid card Number';
            }
            if(!PaymentService::validateFullName($full_name)){
                $error['full_name'] = 'Invalid card Full name';
            }
            if(!PaymentService::validateExpiry($exp_month, $exp_year)){
                $error['expiry'] = 'Invalid Expire date';
            }
            if(!PaymentService::validateCVC($cvc)){
                $error['cvc'] = 'Invalid CVC';
            }
            
            return [
                'error' => $error,
                'full_name' => $full_name,
                'card_type' => $cardType,
                'expiry' => "$exp_year-$exp_month-1",
                'last_digits' =>substr(trim($number), -4),
                'token_id' => uniqid()
            ];
        }
    
        public static function charge($getTokenId, int $param)
        {
         
            $error = null;
            $transaction = uniqid("transaction_");
            
            if(rand(0,10)>7){
                switch (rand(0,3)){
                    case 0:
                        $error = "Not enough money on your account";
                        break;
                    case 1:
                        $error = "We cannot contact your bank now";
                        break;
                    case 2:
                        $error = "Service temporary unavailable, please retry after 5 minutes";
                        break;
                    default:
                        $error = "Transaction negated from your bank account";
                }
            }
            
            return ["error" => $error, "transaction" => $transaction];
        }
    
    }