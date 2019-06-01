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
                    <?php if (strtotime($product->getDateAdded()) > strtotime('-7 days')): ?>
                        <span class="badge-new"> NEW </span>
                    <?php endif; ?>
                    <?php if ($product->getStockCount() <= 5): ?>
                        <?php if ($product->getStockCount() == 0) : ?>
                            <span class="badge-danger "><b> NOT AVAILABLE</b></span>
                        <?php else: ?>
                            <span class="badge-warning "><b> Only <?= $product->getStockCount() ?> left </b></span>
                        <?php endif; ?>
                    
                    <?php endif; ?>
                    <div><a href="<?= $product->getPhotoUrl() ?>"><img
                                    src="<?= $product->getPhotoUrl() ?>"></a></div>
                </div> <!-- slider-product.// -->
            </article> <!-- gallery-wrap .end// -->
        </aside>
        <aside class="col-sm-7">
            <article class="p-5">
                <h3 class="title mb-3"><?= $product->getName() ?></h3>

                <div class="mb-3">
                    <var class="price h3 text-warning">
                        <span class="currency">€</span><span class="num"><?= number_format(
                                $product->getUnitPrice(),
                                2
                            ) ?></span>
                    </var>
                </div> <!-- price-detail-wrap .// -->
                <dl>
                    <dt>Description</dt>
                    <dd><p><?= nl2br($product->getDescription()) ?></p></dd>
                </dl>

                <dl class="row">
                    <?php foreach ($product->getCategoryInfo() as $category => $info): ?>
                        <dt class="col-md-3"><?= $category ?></dt>
                        <?php if (!is_array($info)): ?>
                            <dd class="col-md-9"><?= $info ?></dd>
                        <?php else: ?>
                            <dd class="col-md-9">
                                <ul class="p-0">
                                    <?php foreach ($info as $item): ?>
                                        <li><?= $item ?></li>
                                    <?php endforeach; ?>
                                </ul>
                            </dd>
                        <?php endif; ?>
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
                <form action="/cart.php" method="post">
                    <input type="hidden" name="product_id" value="<?= $product->getId() ?>">

                    <div class="row">
                        <div class="col-sm-5">
                            <dl class="dlist-inline">
                                <dt>Quantity:</dt>
                                <dd>
                                    <select name="qta"
                                            class="form-control form-control-sm" <?= (!$product->getStockCount(
                                    )) ? 'disabled' : '' ?>
                                            style="width:70px;">
                                        <?php for ($i = 1; $i <= $product->getStockCount(); $i++): ?>
                                            <option> <?= $i ?></option>
                                        <?php endfor; ?>
                                    </select>
                                </dd>
                            </dl>  <!-- item-property .// -->
                        </div> <!-- col.// -->
                    </div> <!-- row.// -->
                    <hr>
                    <?php if ($product->getStockCount()): ?>
                    <button type="submit" class="btn  btn-outline-primary"><i class="fas fa-shopping-cart"></i> Add
                        to cart
                    </button>
                </form>
                <?php else: ?>
                    </form>
                    <form action="/product-watcher.php" method="post">
                        <input type="hidden" name="product_id" value="<?= $product->getId() ?>">
                        <button type="submit" class="btn  btn-outline-primary"><i
                                    class="fas fa-eye"></i> Notify me when become available
                        </button>
                    </form>
                
                <?php endif; ?>

            </article> <!-- card-body.// -->
        </aside> <!-- col.// -->
    </div> <!-- row.// -->
</div> <!-- card.// -->

<div class="card mt-3">

    <div class="card-body">
        <div class="card-title row">
            <div class="col">
                <span class="h4">Reviews </span> <span class="h5" id="count"></span>
            </div>
            <div class="col text-right">
                <dl class="dlist-inline">
                    <dt>Sort by:</dt>
                    <dd>
                        <select id="order" name="ord" class="form-control">

                            <option value="rate_asc">
                                Rate: Low to High
                            </option>
                            <option value="rate_desc">
                                Rate: High to Low
                            </option>
                            <option value="date_asc">
                                Date: Older to Newer
                            </option>
                            <option value="date_desc" selected>
                                Date: Newer to Older
                            </option>
                        </select>
                    </dd>
                </dl>
            </div>
        </div>
        <div id="reviews">

        </div>
        <a id="load_more" class="btn btn-light btn-block"> Load More </a>
        <a href="/review.php?product_id=<?= $product->getId() ?>" id="load_more" class="btn btn-outline-secondary btn-block"> Write a review </a>
    </div>
</div>

<template id="review">
    <div class="mb-3" style="border-bottom: 1px dotted #ccc">
        <dl class="dlist-inline">
            <dt class="mr-5">{{authorName}}</dt>
            <dd>
                <div class="rating-wrap">
                    <ul class="rating-stars">
                        <li class="stars-active" style="width:{{vote}}%">
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

        <p class="text-muted">{{createdAt}}</p>

        <P>{{content}}</P>

    </div>
</template>

<script>
    $(document).ready(function () {
        'use strict';

        const reviewsElement = $('#reviews');
        let order = '';
        let batch = 0;
        let total = 0;
        let count = 0;

        $.ajax({
            url: "/review-api.php",
            dataType: 'json',
            type: 'get',
            data: {
                product_id: <?= $product->getId() ?>,
                ord: this.value,
                batch: batch
            },
            success: appendReviews
        });

        $('#order').change(function () {
            batch = 0;
            order = this.value;
            $.ajax({
                url: "/review-api.php",
                dataType: 'json',
                type: 'get',
                data: {
                    product_id: <?= $product->getId() ?>,
                    ord: order,
                    batch: batch
                },
                success: changeOrder
            });
        });

        $('#load_more').click(function () {
            batch++;
            $.ajax({
                url: "/review-api.php",
                dataType: 'json',
                type: 'get',
                data: {
                    product_id: <?= $product->getId() ?>,
                    ord: order,
                    batch: batch
                },
                success: appendReviews
            });
        });

        function changeOrder(result) {
            count = 0;
            reviewsElement.empty();
            appendReviews(result);
        }

        function appendReviews(result) {
            total = result.count;
            count += result.reviews.length;
            for (let review of result.reviews) {
                reviewsElement.append(
                    $('#review').html()
                        .replace('{{authorName}}', review.author)
                        .replace('{{vote}}', review.vote * 25 + "")
                        .replace('{{createdAt}}', review.created_at)
                        .replace('{{content}}', review.content)
                );
            }
            $('#count').text( "("+count+ " of "+ total+")");
        }
    });
</script>


<?php include_once "common/footer.html.php" ?>
