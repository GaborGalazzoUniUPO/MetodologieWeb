<?php include("top.html"); ?>

<form action="matches-submit.php" method="get">
    <fieldset>
        <legend>Returning User:</legend>
        <ul>
            <li>
                <label>
                    <strong>Name:</strong>
                    <input type="text" size="16" name="name">
                </label>
            </li>
        </ul>

        <input type="submit" value="View My Matches">
    </fieldset>
</form>


<?php include("bottom.html"); ?>
