<!-- <GABOR,GALAZZO,20024195> -->
<!-- Metodologie per il web - A.A. 2018/2019 - Esercizio 3: Six degrees of separation - Kevin Bacon -->

<!DOCTYPE html>
<html lang="en">
<!-- Metodologie per il web - A.A. 2018/2019 - Esercizio 3: Six degrees of separation - Kevin Bacon -->
<head>
    <title>My Movie Database (MyMDb)</title>
    <meta charset="utf-8">

    <!-- Links to provided files.  Do not edit or remove these links -->
    <link href="http://www.cs.washington.edu/education/courses/cse190m/12sp/homework/5/favicon.png" type="image/png"
          rel="shortcut icon">
    <script src="http://www.cs.washington.edu/education/courses/cse190m/12sp/homework/5/provided.js"></script>
    <script src="prototype.js"></script>
    <script src="ajax_util.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8="
            crossorigin="anonymous"></script>

    <!-- Link to your JS file that you should edit -->
    <script src="bacon.js"></script>

    <!-- Link to your CSS file that you should edit -->
    <link href="bacon.css" type="text/css" rel="stylesheet">
</head>

<body>
<div id="frame">
    <div id="banner">
        <a href="index.php"><img src="http://www.cs.washington.edu/education/courses/cse190m/12sp/homework/5/mymdb.png"
                                 alt="banner logo"></a>
        My Movie Database
    </div>

    <div id="main">
        <!-- your HTML output follows -->

        <div id="content">
            <h1>The One Degree of Kevin Bacon</h1>
            <p>Type in an actor's name to see if he/she was ever in a movie with Kevin Bacon!</p>
            <p><img src="http://www.cs.washington.edu/education/courses/cse190m/12sp/homework/5/kevin_bacon.jpg"
                    alt="Kevin Bacon"></p>
        </div>

        <!-- form to search for every movie by a given actor -->
        <form id="search-all-form">
            <fieldset>
                <legend>All movies</legend>
                <div>
                    <input name="firstname" type="text" size="12" placeholder="first name" autofocus="autofocus">
                    <input name="lastname" type="text" size="12" placeholder="last name">
                    <input type="submit" value="go">
                </div>
            </fieldset>
        </form>

        <!-- form to search for movies where a given actor was with Kevin Bacon -->
        <form id="search-kevin-form">
            <fieldset>
                <legend>Movies with Kevin Bacon</legend>
                <div>
                    <input name="firstname" type="text" size="12" placeholder="first name">
                    <input name="lastname" type="text" size="12" placeholder="last name">
                    <input type="submit" value="go">
                </div>
            </fieldset>
        </form>
    </div> <!-- end of #main div -->

    <div id="w3c">
        <a href="http://validator.w3.org/check/referer">
            <img src="http://www.cs.washington.edu/education/courses/cse190m/12sp/homework/4/w3c-html.png" alt="Valid HTML" >
        </a>
        <a href="http://jigsaw.w3.org/css-validator/check/referer">
            <img src="http://jigsaw.w3.org/css-validator/images/vcss" alt="Valid CSS" >
        </a>
        <a href="https://webster.cs.washington.edu/jslint/?referer">
            <img src="https://webster.cs.washington.edu/w3c-js.png" alt="Valid JS" /></a>
    </div>
</div> <!-- end of #frame div -->
</body>
</html>

