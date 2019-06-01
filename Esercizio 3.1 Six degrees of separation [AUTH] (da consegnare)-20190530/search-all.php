<?php
    require_once("verify-session.php");
    require_once("common.php");
    
    include("top.php");
    
    // Find the actor id on DB
    $actorId = findIdBestActorMatch($_REQUEST['firstname'], $_REQUEST['lastname']);
    if ($actorId) {
        $searchAllQuery = "select m.name, m.year from movies m
        inner join roles r on r.movie_id = m.id
        where r.actor_id = :actor_id";
        $stm = getConnection()->prepare($searchAllQuery);
        $stm->execute(
            [
                'actor_id' => $actorId,
            ]
        );
        ?>
        <h1>Results for <b><?= $_REQUEST['firstname']." ".$_REQUEST['lastname'] ?></b></h1>
        <?php
        createTable(
            $stm->fetchAll(PDO::FETCH_ASSOC),
            "All Films"
        );
    } else {
        ?>
        <h1>Actor <b> <?= $_REQUEST['firstname']." ".$_REQUEST['lastname'] ?> </b> not found</h1>
        <?php
    }
    include("search-forms.html");
    include("bottom.html");
?>

