<?php include_once 'common/header-default.html.php';
    /**
     * @var $products      \Entity\Product[]
     * @var $index
     * @var $category
     * @var $product       \Entity\Product
     * @var $product_count integer
     * @var $page          integer
     */
?>


<div class="card mb-4">
    <div class="card-body">
        <div class="row">
            <div class="col-9">
                <?= ($page * 18) + 1 ?>-<?= min(($page * 18) + 18, $product_count) ?> of <?= $product_count ?> results
                <?php if (isset($search_text) && !empty(trim($search_text))) : ?>
                    for "<?= $search_text ?>"
                <?php endif; ?>
                <?php if (isset($category) && $category) : ?>
                    in "<?php
                    switch ($category) {
                        case 1:
                            echo "Book";
                            break;
                        case 2:
                            echo "Comic";
                            break;
                        case 3:
                            echo "Audio CD";
                            break;
                        case 4:
                            echo "Vinyl";
                            break;
                        case 5:
                            echo "DVD Movie";
                            break;
                        case 6:
                            echo "Video Games";
                            break;
                    }
                    ?>"
                <?php endif; ?>
            </div>
            <div class="text-right col-3">
                <form action="/product-list.php" method="get">
                    <input type="hidden" name="category" value="<?= isset($category) ? $category : '' ?>">
                    <input type="hidden" name="search_text" value="<?= isset($search_text) ? $search_text : '' ?>">
                    <input type="hidden" name="type" value="<?= isset($type) ? $type : '' ?>">
                    <dl class="dlist-inline">
                        <dt>Sort by:</dt>
                        <dd>
                            <select onchange="this.form.submit()" name="order" class="form-control">
                                <option value="featured">Featured</option>

                                <option value="price_asc" <?= (isset($order) && $order == 'price_asc') ? 'selected' : '' ?>>
                                    Price: Low to High
                                </option>
                                <option value="price_desc" <?= (isset($order) && $order == 'price_desc') ? 'selected' : '' ?>>
                                    Price: High to Low
                                </option>
                                <option value="name_asc" <?= (isset($order) && $order == 'name_asc') ? 'selected' : '' ?>>
                                    Name: Low to High
                                </option>
                                <option value="name_desc" <?= (isset($order) && $order == 'name_desc') ? 'selected' : '' ?>>
                                    Name: High to Low
                                </option>
                            </select>
                        </dd>
                    </dl>
                </form>


            </div>
        </div>
    </div> <!-- card-body .// -->
</div>
<?php foreach ($products as $index => $product): ?>
    
    <?php if ($index % 3 == 0): ?>
        <div class="row">
    <?php endif; ?>
    <div class="col-md-4">
        <figure class="card card-product">
            <div class="img-wrap">
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
<?php if ($index % 3 != 2): ?>
    </div> <!-- row.// -->
<?php endif; ?>
<?php
    
    $page = isset($page) ? $page : 0;
?>
<form action="/product-list.php" method="get">
    <input type="hidden" name="order" value="<?= isset($order) ? $order : 'featured' ?>">
    <input type="hidden" name="type" value="<?= isset($type) ? $type : 0 ?>">
    <input type="hidden" name="category" value="<?= isset($category) ? $category : 0 ?>">
    <input type="hidden" name="search_text" value="<?= isset($search_text) ? $search_text : '' ?>">
    <ul class="pagination justify-content-center">
        <li class="page-item <?= ($page == 0) ? 'disabled' : '' ?>">
            <button class="page-link" name="page" value="<?= $page - 1 ?>" tabindex="-1">Previous</button>
        </li>
        <?php for ($i = 0; $i < ($product_count / 18); $i++) : ?>
            <li class="page-item <?= ($i == $page) ? 'active' : '' ?>"><button name="page" value="<?= $page ?>" class="page-link" href="#"><?= $i + 1 ?></button>
            </li>
        <?php endfor; ?>
        <li class="page-item <?= ($page + 1 >= ($product_count / 18)) ? 'disabled' : '' ?>">
            <button class="page-link" name="page" value="<?= $page + 1 ?>">Next</button>
        </li>
    </ul>
</form>

<?php include_once 'common/footer.html.php' ?>
