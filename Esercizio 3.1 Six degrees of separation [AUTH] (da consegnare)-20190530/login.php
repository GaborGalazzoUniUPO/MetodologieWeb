<?php

    require_once("verify-session.php");
    
    $invalid_login = false;
    
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        require_once 'common.php';
        $username = $_REQUEST['username'];
        $password = $_REQUEST['password'];
        
        $query = "select * from user where username = :username";
        $stm = getConnection()->prepare($query);
        $stm->execute(['username' => $username]);
        if ($stm->rowCount() < 1) {
            $invalid_login = true;
        } else {
            $user = $stm->fetch(PDO::FETCH_ASSOC);
            if (password_verify($password, $user["password"])) {
                $_SESSION['user'] = $user;
                header("location: /index.php");
            } else {
                $invalid_login = true;
            }
        }
        
    }elseif ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_REQUEST['logout'])){
        session_unset();
        session_regenerate_id(true);
        session_destroy();
    }
    
    include("top.php");
?>

<h1>The One Degree of Kevin Bacon</h1>
<p>Type in an actor's name to see if he/she was ever in a movie with Kevin Bacon!</p>
<p><img src="http://www.cs.washington.edu/education/courses/cse190m/12sp/homework/5/kevin_bacon.jpg" alt="Kevin Bacon">
</p>

<!-- login-form -->
<form action="login.php" method="post">
    <fieldset>
        <legend>Login</legend>
        <div>
            <input name="username" type="text" size="12" placeholder="username">
            <input name="password" type="password" size="12" placeholder="password">
            <input type="submit" value="Login">
        </div>
        <?php if ($invalid_login): ?>
            <div class="error">
                <span>Invalid credentials</span>
            </div>
        <?php endif; ?>
    </fieldset>
</form>


<?php
    include("bottom.html");
?>
