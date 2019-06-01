<?php #<GABOR,GALAZZO,20024195>
    
    require_once 'autoload.php';

    // Create a nerd from the sign-in form data
    $nerd = new Nerd();
    $nerd->setName($_POST['name']);
    $nerd->setGender($_POST['gender']);
    $nerd->setAge($_POST['age']);
    $nerd->setPersonality($_POST['personality']);
    $nerd->setOs($_POST['os']);
    $nerd->setSeekingAgeMin($_POST['min_age']);
    $nerd->setSeekingAgeMax($_POST['max_age']);
    
    /** @var NerdDAO $nerdDAO */
    $nerdDAO = new NerdFileDAO();
    // Store the new nerd
    $nerdDAO->save($nerd);
    
?>

<?php include("top.html"); ?>

<b>Thank you!</b>
<p>Welcome to NerdLuv, <?= $_POST["name"]; ?>!</p>
<p>Now <a href="matches.php">log in to see your matches!</a></p>

<?php include("bottom.html"); ?>
