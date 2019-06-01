<?php # <GABOR,GALAZZO,20024195>
    /**
     * File for common and utility functions
     */
    
    /**
     * @return PDO the connection to the database
     */
    function getConnection()
    {
        
        static $connection;
        
        $db_user = 'root';
        $db_password = '';
        $db_name = 'imdb_small';
        $db_host = 'localhost';
        
        if (!$connection) {
            try {
                $connection = new PDO("mysql:dbname=$db_name;host=$db_host", $db_user, $db_password);
                $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            } catch (Exception $e) {
                echo "Database connection error: <br/>";
                echo $e->getMessage();
                exit(1);
            }
        }
        
        return $connection;
    }
    
    /**
     * @param $firstName string actor's first name
     * @param $lastName  string actor's surname
     *
     * @return integer|null the matching actor's id
     */
    function findIdBestActorMatch($firstName, $lastName)
    {
        $query = "select id from actors
        where first_name LIKE concat(:first_name , '%')
        and last_name = :last_name
        order by film_count desc, id
        limit 1";
        $stm = getConnection()->prepare($query);
        $stm->execute(
            [
                'first_name' => $firstName,
                'last_name' => $lastName,
            ]
        );
        if ($result = $stm->fetchColumn()) {
            return $result;
        }
        
        return null;
    }
    
    /**
     * @param $table array an array containing film name and year [["name"=>'', "year"=>''], ... ]
     * @param $caption string the table caption
     */
    function createTable($table, $caption)
    {
        ?>

        <table>
            <caption><?= $caption ?></caption>
            <tr>
                <th>#</th>
                <th>Title</th>
                <th>Year</th>
            </tr>
            <?php
                $number = 1;
                foreach ($table as $line) {
                    $title = htmlspecialchars($line["name"]);
                    ?>
                    <tr>
                        <td><?=$number ?></td>
                        <td><?=$title ?></td>
                        <td><?=$line["year"] ?></td>
                    </tr>
                    <?php
                    $number++;
                }
            ?>
        </table>
        <?php
        
    }
    
    