<!-- <GABOR,GALAZZO,20024195> -->
<?php include("top.html"); ?>
<form action="signup-submit.php" method="post">
    <fieldset>
        <legend>New User Signup:</legend>
        <ul>
            <li>
                <label>
                    <strong>Name:</strong>
                    <input type="text" size="16" name="name">
                </label>
            </li>
            <li>
                <strong>Gender:</strong>
                <label>Male<input type="radio" name="gender" value="M"></label>
                <label>Female<input type="radio" name="gender" value="F" checked="checked"></label>
            </li>
            <li>
                <label>
                    <strong>Age:</strong>
                    <input type="text" size="6" maxlength="2" name="age">
                </label>
            </li>
            <li>

                <label>
                    <strong>Personality type:</strong>
                    <input type="text" size="6" maxlength="4" name="personality">
                </label>
                (<a href="http://www.humanmetrics.com/cgi-win/JTypes2.asp">Don't know your type?</a>)
            </li>
            <li>

                <label>
                    <strong>Favorite OS:</strong>
                    <select name="os">
                        <option>Windows</option>
                        <option>Mac OS X</option>
                        <option selected="selected">Linux</option>
                    </select>
                </label>
            </li>
            <li>
                <label>
                    <strong>Seeking age:</strong>
                </label>
                <input type="text" size="6" maxlength="2" name="min_age" placeholder="min">
                to
                <input type="text" size="6" maxlength="2" name="max_age" placeholder="max">

            </li>
            <li>

                <label>
                    <strong>Favorite gender:</strong>
                    <select name="f_gender">
                        <option value="O" selected="selected">Opposite</option>
                        <option value="M">Male</option>
                        <option value="F">Female</option>
                    </select>
                </label>
            </li>
        </ul>
        <input type="submit" value="Sign Up">
    </fieldset>
</form>
<?php include("bottom.html"); ?>
