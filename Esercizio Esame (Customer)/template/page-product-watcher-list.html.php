<?php include_once "common/header-default.html.php";
/**
 * @var $products         \Entity\CartProduct[]
 */
?>
<div class="row">

    <main class="col-lg-12 col-sm-12 ">


        <div class="card mb-3">
            <div class="card-header">Watchers</div>
            <table class="table table-hover shopping-cart-wrap table-responsive-md">
                <thead class="text-muted">
                <tr>
                    <th scope="col">Product</th>
                    <th scope="col">Actions</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($products as $product): ?>
                    <tr>
                        <td>
                            <figure class="media">
                                <div class="img-wrap"><img class="img-thumbnail img-sm"
                                                           src="<?= $product->getPhotoUrl() ?>">
                                </div>
                                <figcaption class="media-body">
                                    <h6 class="title text-truncate"><a
                                                href="/product.php?id=<?= $product->getId() ?>"><?= $product->getName() ?> </a>
                                    </h6>
                                </figcaption>
                            </figure>
                        </td>
                       <td>
                           <form action="/product-watcher.php" method="post">
                               <input type="hidden" value="DELETE" name="action">
                               <input type="hidden" value="<?= $product->getId() ?>" name="product_id">
                               <button class="btn btn-outline-danger" type="submit">x Remove</button>
                           </form>

                       </td>
                    </tr>
                <?php endforeach; ?>
                <?php if (count($products) < 1): ?>
                    <tr>
                        <td colspan="2">
                            You have no products in watching list
                        </td>
                    </tr>
                <?php endif; ?>
                </tbody>
            </table>

        </div> <!-- card.// -->
    </main>

</div>
<?php include_once "common/footer.html.php" ?>
