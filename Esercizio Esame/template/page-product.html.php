<?php include_once "common/header-default.html.php" ?>

<?php
/**
 * @var $product \Entity\Product
 * @var $reviews \Entity\Review[]
 */
?>

<div class="card">
    <div class="row no-gutters">
        <aside class="col-sm-5 border-right">
            <article class="img-wrap mt-3">
                <div class="img-big-wrap">
                    <div><a href="<?= $product->getPhotoUrl() ?>" data-fancybox=""><img
                                    src="<?= $product->getPhotoUrl() ?>"></a></div>
                </div> <!-- slider-product.// -->
            </article> <!-- gallery-wrap .end// -->
        </aside>
        <aside class="col-sm-7">
            <article class="p-5">
                <h3 class="title mb-3"><?= $product->getName() ?></h3>

                <div class="mb-3">
                    <var class="price h3 text-warning">
                        <span class="currency">€</span><span class="num"><?= $product->getUnitPrice() ?></span>
                    </var>
                </div> <!-- price-detail-wrap .// -->
                <dl>
                    <dt>Description</dt>
                    <dd><p><?= nl2br($product->getDescription()) ?></p></dd>
                </dl>

                <dl class="row">
                    <?php foreach ($product->getCategoryInfo() as $category => $info): ?>
                        <dt class="col-sm-3"><?= $category ?></dt>
                        <dd class="col-sm-9"><?= $info ?></dd>
                    <?php endforeach; ?>
                </dl>


                <div class="rating-wrap">

                    <ul class="rating-stars">
                        <li class="stars-active" style="width:<?= $product->getReviewAvg() * 25 ?>%">
                            <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                        </li>
                        <li>
                            <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                        </li>
                    </ul>
                    <div class="label-rating"><?= $product->getReviewCount() ?> reviews</div>
                </div> <!-- rating-wrap.// -->
                <hr>
                <div class="row">
                    <div class="col-sm-5">
                        <dl class="dlist-inline">
                            <dt>Quantity:</dt>
                            <dd>
                                <select class="form-control form-control-sm" <?= (!$product->getStockCount()) ? 'disabled' : '' ?>
                                        style="width:70px;">
                                    <option> 1</option>
                                    <option> 2</option>
                                    <option> 3</option>
                                </select>
                            </dd>
                        </dl>  <!-- item-property .// -->
                    </div> <!-- col.// -->
                </div> <!-- row.// -->
                <hr>
                <?php if ($product->getStockCount()): ?>
                    <a class="btn  btn-outline-primary" href="#"> <i class="fas fa-shopping-cart"></i> Add to cart </a>
                <?php else: ?>
                    <a class="btn  btn-outline-primary" href="#"> Alert me when become available </a>
                <?php endif; ?>
            </article> <!-- card-body.// -->
        </aside> <!-- col.// -->
    </div> <!-- row.// -->
</div> <!-- card.// -->

<div class="card mt-3">
    <div class="card-body">
        <?php foreach ($reviews as $review): ?>
            <div class="mb-3" style="border-bottom: 1px dotted #ccc">
                <dl class="dlist-inline">
                    <dt class="mr-5"><?= $review->getAuthor() ?> </dt>
                    <dd>
                        <div class="rating-wrap">
                            <ul class="rating-stars">
                                <li class="stars-active" style="width:<?= $review->getVote() * 25 ?>%">
                                    <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                </li>
                                <li>
                                    <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                </li>
                            </ul>
                        </div> <!-- rating-wrap.// -->
                    </dd>
                </dl>

                <p class="text-muted"><?= $review->getCreatedAt()->format("F j, Y") ?></p>

                <P> <?= $review->getContent() ?></P>

            </div>
        <?php endforeach; ?>

        <a href="#" class="btn btn-light btn-block"> See more </a>
    </div>
</div>


<?php include_once "common/footer.html.php" ?>
