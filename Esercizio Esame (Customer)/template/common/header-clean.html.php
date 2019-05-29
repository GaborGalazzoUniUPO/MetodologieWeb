<!DOCTYPE HTML>
<html lang="en">
<?php include_once "head.html.php" ?>
<body>
<header class="section-header">

    <section class="header-main shadow-sm">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-3 col-sm-6">
                    <div class="col-lg-3 col-sm-4">
                        <?php include_once "logo.html.php" ?>
                    </div>
                </div>
            </div> <!-- col.// -->
        </div> <!-- row.// -->
        </div> <!-- container.// -->
    </section> <!-- header-main .// -->
</header> <!-- section-header.// -->

<!-- ========================= SECTION MAIN ========================= -->
<section class="section-content padding-y bg">
    <div class="container">
        <?php if (isset($error, $error['internal'])): ?>
            <div class="alert alert-danger">
                <strong>Internal Error!</strong> <?= $error['internal'] ?> <br/>
                If this error persist please contact our team.
            </div>
        <?php endif; ?>
