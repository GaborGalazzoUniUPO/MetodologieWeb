<?php


/**
 * @param $str1
 * @param $str2
 * @return bool
 */
function personality_match($str1, $str2)
{
    for ($i = 0; $i < 4; $i++) {
        if ($str1[$i] == $str2[$i]) {
            return True;
        }
    }
    return false;
}

/**
 * @param $name
 * @param $gender
 * @param $age
 * @param $personality
 * @param $os
 */
function create_user($name, $gender, $age, $personality, $os)
{
    ?>
    <p><?= $name ?><img src="http://www.cs.washington.edu/education/courses/cse190m/12sp/homework/4/user.jpg"
                        alt="Profile Image"></p>
    <ul>
        <li>
            <strong>Gender:</strong> <?= $gender ?>
        </li>
        <li>
            <strong>Age:</strong> <?= $age ?>
        </li>
        <li>
            <strong>Type:</strong> <?= $personality ?>
        </li>
        <li>
            <strong>OS:</strong> <?= $os ?>
        </li>
    </ul>
    <?php

}

$u_name = $_GET["name"];
list($u_gender, $u_age, $u_personality, $u_os, $u_seeking_age_min, $u_seeking_age_max) = null;

$lines = file("singles.txt", FILE_IGNORE_NEW_LINES);
$singles = array();

foreach ($lines as $line) {
    $single = explode(",", $line);
    if ($single[0] == $u_name)
        list($u_name, $u_gender, $u_age, $u_personality, $u_os, $u_seeking_age_min, $u_seeking_age_max) = $single;
    else
        array_push($singles, $single);
}


include("top.html");

?>

<b>Matches for <?= $u_name ?></b>

<div class="match">
    <?php

    foreach ($singles as $single) {
        list($s_name, $s_gender, $s_age, $s_personality, $s_os) = $single;
        if (
            $s_gender != $u_gender &&
            $s_age >= $u_seeking_age_min &&
            $s_age <= $u_seeking_age_max &&
            $s_os == $u_os &&
            personality_match($u_personality, $s_personality)
        ) {
            create_user($s_name, $s_gender, $s_age, $s_personality, $s_os);
        }
    }
    ?>
</div>

<?php include("bottom.html"); ?>
