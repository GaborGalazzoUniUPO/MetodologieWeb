<?php #<GABOR,GALAZZO,20024195>
    
    session_start();
    
    if (!isset($_SESSION['user']) && $_SERVER['PHP_SELF'] != '/login.php') {
        header("location: /login.php");
        exit(1);
    }
