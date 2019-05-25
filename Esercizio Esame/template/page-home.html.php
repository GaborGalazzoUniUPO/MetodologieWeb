<?php include_once "common/header-no-sb.html.php" ?>


<div class="container d-flex flex-column" style="min-height:80vh;">

    <div class="row mt-auto">
        <div class="col-lg-8 col-sm-12 text-center mx-auto">
            <h1 class="display-4 mb-3">Marketplace platform</h1>
            <p class="lead mb-5">
                Project for the examination of programming methods for the web</p>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-10 col-md-10 col-sm-12 mx-auto text-center">
            <form class="form-noborder" action="/product-list.php" method="get">
                <div class="form-row mb-5">
                    <div class="col-lg-2 col-sm-12 form-group">
                        <select name="category" class="custom-select form-control-lg">
                            <option value="-1" selected> All category</option>
                            <option value="1"> Book</option>
                            <option value="2"> Comic</option>
                            <option value="3"> Audio CD</option>
                            <option value="4"> Vinyl</option>
                            <option value="5"> DVD Movie</option>
                            <option value="6"> Video Games</option>
                        </select>
                    </div>
                    <div class="col-lg-5 col-sm-12 form-group">
                        <input name="search_text" class="form-control form-control-lg" type="text" placeholder="Search keyword">
                    </div>

                    <div class="col-lg-2 col-sm-12 form-group">
                        <select class="custom-select form-control-lg" name="type">
                            <option value="0">All type</option>
                            <option value="1">Only best</option>
                            <option value="2">Latest</option>
                        </select>
                    </div>
                    <div class="col-lg-3 col-sm-12 form-group">
                        <button class="btn btn-warning btn-block btn-lg" type="submit">Search</button>
                    </div>
                </div>
            </form>
            <p class="small">Enjoy this wonderful platform</p>
            <ul class="list-inline my-5">
                <li class="list-inline-item">
                    <a class="h4 text-light p-2" href="#">
                        <i class="fab fa-twitter"></i>
                    </a>
                </li>
                <li class="list-inline-item">
                    <a class="h4 text-light p-2" href="#">
                        <i class="fab fa-facebook"></i>
                    </a>
                </li>
                <li class="list-inline-item">
                    <a class="h4 text-light p-2" href="#">
                        <i class="fab fa-dribbble"></i>
                    </a>
                </li>
                <li class="list-inline-item">
                    <a class="h4 text-light p-2" href="#">
                        <i class="fab fa-instagram"></i>
                    </a>
                </li>
            </ul>
        </div> <!-- col.// -->
    </div> <!-- row.// -->

</div>

<?php include_once "common/footer.html.php" ?>
