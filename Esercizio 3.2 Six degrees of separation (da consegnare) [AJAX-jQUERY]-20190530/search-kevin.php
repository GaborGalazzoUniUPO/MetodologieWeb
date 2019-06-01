<?php
    
    require_once "common.php";
    
    $result = ["actorId"=>null, "movies" => [], "firstName" => $_REQUEST['firstname'], "lastName" => $_REQUEST['lastname']];
    
    // Find the actor id on DB
    $result['actorId'] = findIdBestActorMatch($_REQUEST['firstname'], $_REQUEST['lastname']);
    // Find Kevin Bacon's id on DB
    $kevinBaconId = findIdBestActorMatch("Kevin", "Bacon");
    if ($result['actorId']) {
        $searchAllQuery = "select m.name, m.year from movies m
        inner join roles ra on ra.movie_id = m.id
        inner join roles rkb on rkb.movie_id = m.id
        where ra.actor_id = :actor_id
        and rkb.actor_id = :kevin_id";
        $stm = getConnection()->prepare($searchAllQuery);
        $stm->execute(
            [
                'actor_id' => $result['actorId'],
                'kevin_id' => $kevinBaconId,
            ]
        );
        $result['movies'] = $stm->fetchAll(PDO::FETCH_ASSOC);
    }
    
    echo json_encode($result);
