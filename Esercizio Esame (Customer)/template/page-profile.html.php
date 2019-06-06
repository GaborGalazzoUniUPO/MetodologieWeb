<?php include_once "common/header-default.html.php";
    /**
     * @var $user               \Entity\User
     * @var $paymentMethods     \Entity\PaymentMethod[]
     * @var $shippingAddresses  \Entity\ShippingAddress[]
     * @var $orders  \Entity\Order[]
     */
?>


    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <dl class="dlist-align">
                        <dt>First Name:</dt>
                        <dd><?= $user->getName() ?></dd>
                    </dl>
                    <dl class="dlist-align">
                        <dt>Last Name:</dt>
                        <dd><?= $user->getSurname() ?></dd>
                    </dl>
                    <dl class="dlist-align">
                        <dt>Email:</dt>
                        <dd><?= $user->getEmail() ?></dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>

    <div class="row p-0">
        <div class="col-6 mt-3">
            <div class="card">
                <header class="card-header">
                    Orders
                </header>
                <article class="card-body">
                    <ul class="list-group list-group-flush">
                        <?php foreach ($orders as $order): ?>
                            <li
                                class="list-group-item">
                                <dl class="dlist-align">
                                    <dt>Order #: </dt>
                                    <dd ><a href="/order.php?order_id=<?= $order->getId()?>" ><?= $order->getCode() ?></a></dd>
                                </dl>
                                <dl class="dlist-align">
                                    <dt>Order date: </dt>
                                    <dd><?= $order->getCreatedAt() ?></dd>
                                </dl>
                                <dl class="dlist-align">
                                    <dt>Item #: </dt>
                                    <dd><?= $order->getItemCount() ?></dd>
                                </dl>
                                <dl class="dlist-align">
                                    <dt>Total: </dt>
                                    <dd>€ <?= number_format($order->getTotal(),2) ?></dd>
                                </dl>
                                <dl class="dlist-align">
                                    <dt>Status: </dt>
                                    <dd><?= $order->getStatusString() ?></dd>
                                </dl>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                </article>
            </div>
        </div>
        <div class="col-6 p-0 mt-3">
            <div class="col-12 mb-3">
                <a href="/product-watcher.php" class="btn btn-outline-primary btn-block">Go to Watcher List</a>
            </div>
            <div class="col-12 mb-3">
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">
                            <a href="#" data-toggle="collapse" data-target="#collapse_pm">
                                <i class="icon-action fa fa-chevron-down"></i>
                                Payment methods
                            </a>
                        </div>
                    </div>
                    <div class="collapse" id="collapse_pm">
                        <div class="card-body">
                            <ul class="list-group list-group-flush">
                                <?php foreach ($paymentMethods as $paymentMethod): ?>
                                    <li id="pm_<?= $paymentMethod->getId() ?>"
                                        class="list-group-item"><?= $paymentMethod ?>
                                        <button onclick="removePaymentMethod(<?= $paymentMethod->getId() ?>)"
                                                class="btn btn-outline-danger float-right">x Remove
                                        </button>
                                    </li>
                                <?php endforeach; ?>
                                <li class="list-group-item"><span class="text-muted">You can add new payment methods whe you checkout an order</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 mb-3">
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">
                            <a href="#" data-toggle="collapse" data-target="#collapse_sa">
                                <i class="icon-action fa fa-chevron-down"></i>

                                Shipping addresses
                            </a>
                        </div>
                    </div>
                    <div class="collapse" id="collapse_sa">
                        <div class="card-body">
                            <ul class="list-group list-group-flush">
                                <?php foreach ($shippingAddresses as $shippingAddress): ?>
                                    <li id="sa_<?= $shippingAddress->getId() ?>"
                                        class="list-group-item"><?= $shippingAddress ?>
                                        <button onclick="removeShippingAddress(<?= $shippingAddress->getId() ?>)"
                                                class="btn btn-outline-danger float-right">x Remove
                                        </button>
                                    </li>
                                <?php endforeach; ?>
                                <li class="list-group-item"><span class="text-muted">You can add new shipping addresses whe you checkout an order</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script>
        function removeShippingAddress(id) {
            $.ajax({
                url: "/profile-api.php",
                dataType: 'json',
                type: 'post',
                data: {
                    shipping_address: id,
                    action: 'DELETE'
                },
                success: () => $('#sa_' + id).remove()
            });

        }

        function removePaymentMethod(id) {
            $.ajax({
                url: "/profile-api.php",
                dataType: 'json',
                type: 'post',
                data: {
                    payment_method: id,
                    action: 'DELETE'
                },
                success: () => $('#pm_' + id).remove()
            });
        }
    </script>

<?php include_once "common/footer.html.php" ?>