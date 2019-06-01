<?php
    
    require_once "common.php";
    
    $result = ["actorId"=>null, "movies" => [], "firstName" => $_REQUEST['firstname'], "lastName" => $_REQUEST['lastname']];
    
    // Find the actor id on DB
    $result['actorId'] = findIdBestActorMatch($_REQUEST['firstname'], $_REQUEST['lastname']);
    if ($result['actorId']) {
        $searchAllQuery = "select m.name, m.year from movies m
        inner join roles r on r.movie_id = m.id
        where r.actor_id = :actor_id";
        $stm = getConnection()->prepare($searchAllQuery);
        $stm->execute(
            [
                'actor_id' => $result['actorId'],
            ]
        );
        $result['movies'] = $stm->fetchAll(PDO::FETCH_ASSOC);
    }
    
    echo json_encode($result);
    
