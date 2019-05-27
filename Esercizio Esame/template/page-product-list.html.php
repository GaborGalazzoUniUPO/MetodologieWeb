<?php include_once 'common/header-default.html.php' ?>

<?php
/**
 * @var $products \Entity\Product[]
 * @var  $index
 * @var  $product \Entity\Product
 */
foreach ($products as $index => $product): ?>

    <?php if ($index % 3 == 0): ?>
        <div class="row">
    <?php endif; ?>
    <div class="col-md-4">
        <figure class="card card-product">
            <div class="img-wrap">
                <?php if(strtotime($product->getDateAdded()) > strtotime('-7 days')): ?>
                <span class="badge-new"> NEW </span>
                <?php endif;?>
                <?php if ($product->getStockCount() <= 5): ?>
                    <?php if ($product->getStockCount() == 0) : ?>
                        <span class="badge-danger "><b> NOT AVAILABLE</b></span>
                    <?php else: ?>
                        <span class="badge-warning "><b> Only <?= $product->getStockCount() ?> left </b></span>
                    <?php endif; ?>

                <?php endif; ?>

                <img src="<?= $product->getPhotoUrl() ?>"></div>
            <figcaption class="info-wrap">
                <h4><a class="title" href="/product.php?id=<?= $product->getId() ?>"><?= $product->getName() ?></a>
                </h4>
                <p class="desc"><?= $product->getSmallDescription() ?></p>
                <div class="rating-wrap">
                    <ul class="rating-stars">
                        <li class="stars-active" style="width:<?= $product->getReviewAvg() * 25 ?>%">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </li>
                        <li>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </li>
                    </ul>
                    <div class="label-rating"><?= $product->getReviewCount() ?> reviews</div>
                </div> <!-- rating-wrap.// -->
            </figcaption>
            <div class="bottom-wrap">
                <div class="price-wrap h5">
                    <span class="price-new">€<?= number_format(
                            $product->getUnitPrice(),
                            2
                        ) ?></span>
                </div> <!-- price-wrap.// -->
            </div> <!-- bottom-wrap.// -->
        </figure>
    </div> <!-- col // -->
    <?php if ($index % 3 == 2): ?>
        </div> <!-- row.// -->
    <?php endif; ?>

<?php endforeach; ?>

<?php include_once 'common/footer.html.php' ?>
