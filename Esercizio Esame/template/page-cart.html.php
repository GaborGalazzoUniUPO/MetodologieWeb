<?php include_once "common/header-default.html.php";
/**
 * @var $cart \Entity\Cart
 * @var $product \Entity\CartProduct
 */
?>


<div class="card">
    <table class="table table-hover shopping-cart-wrap">
        <thead class="text-muted">
        <tr>
            <th scope="col">Product</th>
            <th width="120" scope="col">Quantity</th>
            <th width="120" scope="col">Price</th>
            <th width="200" class="text-right" scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($cart->getProducts() as $product): ?>
            <tr>
                <td>
                    <figure class="media">
                        <div class="img-wrap"><img class="img-thumbnail img-sm" src="<?= $product->getPhotoUrl() ?>">
                        </div>
                        <figcaption class="media-body">
                            <h6 class="title text-truncate"><a
                                        href="/product.php?id=<?= $product->getId() ?>"><?= $product->getName() ?> </a>
                            </h6>
                        </figcaption>
                    </figure>
                </td>
                <td>
                    <?= $product->getQta() ?>
                </td>
                <td>
                    <div class="price-wrap">
                        <var class="price">€ <?= $product->getUnitPrice() * $product->getQta() ?></var>
                        <small class="text-muted">(€ <?= $product->getUnitPrice() ?> each)</small>
                    </div> <!-- price-wrap .// -->
                </td>
                <td class="text-right">
                    <form action="/cart.php" method="post">
                        <input type="hidden" name="action" value="DELETE">
                        <input type="hidden" name="product_id" value="<?= $product->getId() ?>">
                        <button class="btn btn-outline-danger" type="submit"> × Remove One</button>
                    </form>
                </td>
            </tr>
        <?php endforeach; ?>
        <?php if (count($cart->getProducts()) < 1): ?>


        <?php endif; ?>
        </tbody>
    </table>
</div> <!-- card.// -->

<?php include_once "common/footer.html.php" ?>
