<?php include_once "common/header-default.html.php";
    /**
     * @var $cart    \Entity\Cart
     * @var $product \Entity\CartProduct
     */
?>


<div class="row">
    <main class="col-lg-9 col-sm-12 ">
        <div class="card mb-3">
            <table class="table table-hover shopping-cart-wrap table-responsive-md">
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
                                <div class="img-wrap"><img class="img-thumbnail img-sm"
                                                           src="<?= $product->getPhotoUrl() ?>">
                                </div>
                                <figcaption class="media-body">
                                    <h6 class="title text-truncate"><a
                                                href="/product.php?id=<?= $product->getId() ?>"><?= $product->getName(
                                            ) ?> </a>
                                    </h6>
                                </figcaption>
                            </figure>
                        </td>
                        <td>
                            <?= $product->getQta() ?>
                        </td>
                        <td>
                            <div class="price-wrap">
                                <var class="price">€ <?= number_format($product->getUnitPrice() * $product->getQta(),2) ?></var>
                                <small class="text-muted">(€ <?= number_format($product->getUnitPrice(),2) ?> each)</small>
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
    </main>
    <aside class="col-lg-3 col-sm-12">
        
        <div class="box">
            Summary:
            <dl class="dlist-align mt-2">
                <dt>Num Items:</dt>
                <dd class="text-right"><?= $cart->getItemCount() ?></dd>
            </dl>
            <dl class="dlist-align h5">
                <dt>Subtotal:</dt>
                <dd class="text-right">€ <?= number_format(
                        $cart->getTotal(),
                        2
                    ) ?></dd>
            </dl>
            <button class="btn btn-block btn-outline-success mt-5 <?= !$cart->getItemCount()?'disabled':'' ?>">Proceede to checkout</button>
        </div>
       
    </aside>
</div>

<?php include_once "common/footer.html.php" ?>
