<?php include_once "common/header-default.html.php";
    /**
     * @var $product  \Entity\Product
     * @var $qta      integer
     * @var $real_qta integer
     */
?>


<div class="card  p-2">
    <div class="row no-gutters">
        <aside class="col-sm-12 col-md-3 border-right">
            <figure class="media">
                <div class="img-wrap"><img class="img-thumbnail img-sm"
                                           src="<?= $product->getPhotoUrl() ?>"></div>
                <figcaption class="media-body align-self-center">
                    <div class="icontext align-self-center">
                        <?php if($qta == $real_qta): ?>
                        <div class="icon-wrap icon-xs bg-success round">
                            <i class="fa fa-check white"></i>
                        </div>
                        <br/>
                        <div>
                            <h5 class="mt-3 ml-3"><p class="text-success"><?= $real_qta ?> item added </p></h5>
                        </div>
                        <?php elseif ($real_qta == 0): ?>
                            <div class="icon-wrap icon-xs bg-danger round">
                                <i class="fa fa-exclamation white"></i>
                            </div>
                            <br/>
                            <div>
                                <h5 class="mt-3 ml-3"><p class="text-danger"> Product no more available </p></h5>
                            </div>
                        <?php else: ?>
                            <div class="icon-wrap icon-xs bg-warning round">
                                <i class="fa fa-exclamation white"></i>
                            </div>
                            <br/>
                            <div>
                                <h5 class="mt-3 ml-3"><p class="text-warning"><?= $real_qta ?> item added </p></h5>
                            </div>
                        <?php endif; ?>
                    </div> <!-- icontext.// -->

                </figcaption>
            </figure>
        </aside>
        <article class="col-sm-12 col-md-4 align-self-center pl-2 p-2">
            <h4 class="title  p-2">
                Cart subtotal (<?= $_SESSION['cart']->getItemCount() ?> item): €<?= number_format(
                    $_SESSION['cart']->getTotal(),
                    2
                ) ?>
            </h4>

        </article> <!-- col.// -->
        <aside class="col-sm-12 col-md-5 align-self-center text-right">
            <div class="action-wrap">

                <a href="/cart.php" class="btn btn-outline-secondary"> Cart </a>
                <a href="#" class="btn btn-primary"> Proceed to checkout ( <?= $_SESSION['cart']->getItemCount() ?>
                    item)</a>
            </div> <!-- action-wrap.// -->
        </aside> <!-- col.// -->
    </div> <!-- row.// -->
</div> <!-- card.// -->


<?php include_once "common/footer.html.php" ?>
