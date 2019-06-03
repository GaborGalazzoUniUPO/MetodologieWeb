<?php include_once "common/header-default.html.php";
    /**
     * @var $order         \Entity\Order
     * @var $product         \Entity\CartProduct
     * @var $shippingAddress             \Entity\ShippingAddress
     * @var $paymentMethod               \Entity\PaymentMethod
     */
?>
<div class="row">
    
    <main class="col-lg-9 col-sm-12 ">
        <div class="card mb-3">
            <div class="card-header">
                Order information
            </div>
            <div class="card-body">
                <dl>
                    <dt>Status:</dt>
                    <dd><?= $order->getStatusString() ?></dd>
    
                </dl>
                <dl>
                    <dt>Shipping Address:</dt>
                    <dd><?= $shippingAddress ?></dd>
                
                </dl>
                <dl>
                    <dt>Payment Method:</dt>
                    <dd><?= $paymentMethod ?></dd>
                
                </dl>
            </div>
        </div>
        
        <div class="card mb-3">
            <div class="card-header">Summary</div>
            <table class="table table-hover shopping-cart-wrap table-responsive-md">
                <thead class="text-muted">
                <tr>
                    <th scope="col">Product</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($order->getProducts() as $product): ?>
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
                                <var class="price">€ <?= number_format(
                                        $product->getUnitPrice() * $product->getQta(),
                                        2
                                    ) ?></var>
                                <small class="text-muted">(€ <?= number_format($product->getUnitPrice(), 2) ?> each)
                                </small>
                            </div> <!-- price-wrap .// -->
                        </td>
                    </tr>
                <?php endforeach; ?>
                <?php if (count($order->getProducts()) < 1): ?>
                
                
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
                <dd class="text-right"><?= $order->getItemCount() ?></dd>
            </dl>
            <dl class="dlist-align mt-2">
                <dt class="w-auto">Shipment Type:</dt>
                <dd class="text-right"><?= $order->getShipmentType() ?  'Courier service (€20)':'Postal mail (€10)' ?></dd>
            </dl>
            <dl class="dlist-align mt-2">
                <dt class="w-auto">Subtotal:</dt>
                <dd class="text-right">€ <?= number_format(
                        $order->getTotal(),
                        2
                    ) ?></dd>
            </dl>
            <dl class="dlist-align h3 mt-4">
                <dt>Total:</dt>
                <dd class="text-right">€ <?= number_format(
                        $order->getTotal() + ($order->getShipmentType() ? 20:10),
                        2
                    ) ?></dd>
            </dl>
        </div>
    
    </aside>

</div>
<?php include_once "common/footer.html.php" ?>
