<?php include_once "common/header-default.html.php";
    /**
     * @var $order \Entity\Order
     */
?>


<div class="container d-flex flex-column" style="min-height:80vh;">
    
    <div class="row mt-5">
        <div class="col-lg-8 col-sm-12 text-center mx-auto">
            <div class="card text-white bg-success mb-3">
                <div class="card-body">
                    <h5 class="card-title">Success!</h5>
                    <p class="card-text">
                        We have taken charge of your order. Our staff are preparing it for shipment.</p>
                    <p class="card-text mt-3">
                    Order code: <a href="/order.php?order_id=<?=$order->getId()?>"><?= $order->getCode()?></a></p>
                </div>
            </div> <!-- card.// -->
        </div>
    </div>
</div>
<?php include_once "common/footer.html.php" ?>
