<!-- <GABOR,GALAZZO,20024195> -->
<?php


    
    require_once 'preload.php';
    
    $name_param = $_GET["name"];
    
    /** @var NerdDAO $nerdDAO */
    $nerdDAO = new NerdFileDAO();
    
    /** @var Nerd[] $available_nerds */
    $available_nerds = array();
    
    /** @var Nerd $user */
    $nerd_param = null; //
    
    // Obtain a list of available nerds and find the $name_param corresponding nerd ($nerd_param)
    foreach ($nerdDAO->getAll() as $nerd) {
        if ($nerd->getName() != $name_param) {
            array_push($available_nerds, $nerd);
        } else {
            $nerd_param = $nerd;
        }
    }

?>

<?php include("top.html"); ?>

<b>Matches for <?= $nerd_param->getName() ?></b>

<div class="match">
    <?php
        // Display all user that matches $nerd_param preferences
        foreach ($available_nerds as $nerd) {
            if ($nerd_param->isMatchForMe($nerd)) {
                $nerd->toListItem();
            }
        }
    ?>
</div>

<?php include("bottom.html"); ?>
