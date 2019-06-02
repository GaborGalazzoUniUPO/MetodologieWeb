<?php include_once "common/header-default.html.php";
    /**
     * @var $product  \Entity\Product
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
                        <div class="icon-wrap icon-xs bg-success round">
                            <i class="fa fa-check white"></i>
                        </div>
                        <br/>
                        <div>
                            <h5 class="mt-3 ml-3"><p class="text-success">Review added!</p></h5>
                        </div>
                    </div> <!-- icontext.// -->

                </figcaption>
            </figure>
        </aside>
        <article class="col-sm-12 col-md-9 align-self-center pl-2 p-2">
            <h5 class="title  p-2">
                Your review for <a href="/product.php?id=<?= $product->getId() ?>"><?=$product->getName()?></a> is now readable by all our customers, thank you for supporting us!
            </h5>

        </article> <!-- col.// -->
    </div> <!-- row.// -->
</div> <!-- card.// -->


<?php include_once "common/footer.html.php" ?>
