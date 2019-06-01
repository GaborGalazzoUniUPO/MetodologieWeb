<!-- <GABOR,GALAZZO,20024195> -->
<?php include("top.html"); ?>

<?php
    
    require_once "common.php";
    // Find the actor id on DB
    $actorId = findIdBestActorMatch($_REQUEST['firstname'], $_REQUEST['lastname']);
    // Find Kevin Bacon's id on DB
    $kevinBaconId = findIdBestActorMatch("Kevin", "Bacon");
    if ($actorId) {
        $searchAllQuery = "select m.name, m.year from movies m
        inner join roles ra on ra.movie_id = m.id
        inner join roles rkb on rkb.movie_id = m.id
        where ra.actor_id = :actor_id
        and rkb.actor_id = :kevin_id";
        $stm = getConnection()->prepare($searchAllQuery);
        $stm->execute(
            [
                'actor_id' => $actorId,
                'kevin_id' => $kevinBaconId,
            ]
        );
        if($stm->rowCount() == 0){
            echo "<h1><b>$_REQUEST[firstname] $_REQUEST[lastname]</b> wasn't in any films with Kevin Bacon</h1>";
        }else {
            echo " <h1>Results for <b> $_REQUEST[firstname] $_REQUEST[lastname] </b> and Kevin Bacon</h1>";
            createTable($stm->fetchAll(PDO::FETCH_ASSOC),
                "Films with $_REQUEST[firstname] $_REQUEST[lastname] and Kevin Bacon");
        }
    } else {
        ?>
        <h1>Actor <b> <?= $_REQUEST['firstname']." ".$_REQUEST['lastname'] ?> </b> not found</h1>
        <?php
    }

?>
<?php include("bottom.html"); ?>
