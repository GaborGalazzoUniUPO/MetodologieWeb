<?php include("top.html"); ?>

<b>Thank you!</b>
<p>Welcome to NerdLuv, <?= $_REQUEST["name"]; ?>!</p>
<p>Now <a href="matches.php">log in to see your matches!</a></p>

<?php
file_put_contents(
    'singles.txt',
    implode(",",$_REQUEST),
    FILE_APPEND);
?>


<?php include("bottom.html"); ?>
