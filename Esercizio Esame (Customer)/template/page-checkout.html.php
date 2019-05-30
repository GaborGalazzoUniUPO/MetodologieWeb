<?php include_once "common/header-default.html.php";
    /**
     * @var $cart                        \Entity\Cart
     * @var $product                     \Entity\CartProduct
     * @var $shippingAddresses           \Entity\ShippingAddress[]
     * @var $paymentMethods              \Entity\PaymentMethod[]
     * @var $user                        \Entity\User
     */
?>


<form action="/checkout.php" method="post">
    <div class="row">

        <main class="col-lg-9 col-sm-12 ">
            <div class="card mb-3">
                <div class="card-header">
                    Order information
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label>Shipping Address </label>
                            <select name="shipping_address"
                                    class="form-control <?= isset($error['shipping_address']) ? 'is-invalid' : '' ?>"
                                    onchange="if(this.value === 'new') $('#add_address').collapse('show'); else $('#add_address').collapse('hide')">
                                <option disabled selected>Choose one</option>
                                <?php foreach ($shippingAddresses as $shippingAddress): ?>
                                    <option value="<?= $shippingAddress->getId() ?>" <?= $shippingAddress->getId(
                                    ) == $user->getDefaultShippingAddress(
                                    ) ? 'selected' : '' ?>><?= $shippingAddress ?></option>
                                <?php endforeach; ?>
                                <option value="new" <?= isset($shipping_address) && $shipping_address == 'new' ? 'selected' : '' ?>>
                                    Create New
                                </option>
                            </select>
                            <div class="invalid-feedback">
                                <?= isset($error, $error['shipping_address']) ? $error['shipping_address'] : '' ?>
                            </div>
                            <div class="collapse <?= isset($shipping_address) && $shipping_address == 'new' ? 'show' : '' ?>"
                                 id="add_address">
                                <div class="card mt-3">
                                    <div class="card-header">New Address</div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label class="col-form-label">Full Name</label>
                                            <input type="text" name="address_full_name"
                                                   class="form-control <?= isset($error['address_full_name']) ? 'is-invalid' : '' ?>"
                                                   value="<?= isset($address_full_name) ? $address_full_name : '' ?>">
                                            <div class="invalid-feedback">
                                                <?= isset($error, $error['address_full_name']) ? $error['address_full_name'] : '' ?>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label class="col-form-label">Street</label>
                                            <input type="text" name="street"
                                                   class="form-control <?= isset($error['street']) ? 'is-invalid' : '' ?>"
                                                   value="<?= isset($street) ? $street : '' ?>">
                                            <div class="invalid-feedback">
                                                <?= isset($error, $error['street']) ? $error['street'] : '' ?>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label class="col-form-label">City</label>
                                            <input type="text" name="city"
                                                   class="form-control <?= isset($error['city']) ? 'is-invalid' : '' ?>"
                                                   value="<?= isset($city) ? $city : '' ?>">
                                            <div class="invalid-feedback">
                                                <?= isset($error, $error['city']) ? $error['city'] : '' ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class=" col-form-label">State/Province/Region</label>
                                            <input type="text" name="region"
                                                   class="form-control <?= isset($error['region']) ? 'is-invalid' : '' ?>"
                                                   value="<?= isset($region) ? $region : '' ?>">
                                            <div class="invalid-feedback">
                                                <?= isset($error, $error['region']) ? $error['region'] : '' ?>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label class="col-form-label">ZIP/Postal Code</label>
                                            <input type="text" name="zip_code"
                                                   class="form-control <?= isset($error['zip_code']) ? 'is-invalid' : '' ?>"
                                                   value="<?= isset($zip_code) ? $zip_code : '' ?>">
                                            <div class="invalid-feedback">
                                                <?= isset($error, $error['zip_code']) ? $error['zip_code'] : '' ?>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label class=" col-form-label">Country</label>
                                            <input type="text" name="country"
                                                   class="form-control <?= isset($error['country']) ? 'is-invalid' : '' ?>"
                                                   value="<?= isset($country) ? $country : '' ?>">
                                            <div class="invalid-feedback">
                                                <?= isset($error, $error['country']) ? $error['country'] : '' ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Payment Method</a></label></label>
                            <select name="payment_method"
                                    class="form-control <?= isset($error['payment_method']) ? 'is-invalid' : '' ?>"
                                    onchange="if(this.value === 'new') $('#add_paymethod').collapse('show'); else $('#add_paymethod').collapse('hide')">
                                <option disabled selected>Choose one</option>
                                <?php foreach ($paymentMethods as $paymentMethod): ?>
                                    <option value="<?= $paymentMethod->getId() ?>" <?= $paymentMethod->getId(
                                    ) == $user->getDefaultPaymentMethod(
                                    ) ? 'selected' : '' ?>><?= $paymentMethod ?></option>
                                <?php endforeach; ?>
                                <option value="new" <?= isset($payment_method) && $payment_method == 'new' ? 'selected' : '' ?>>
                                    Create New
                                </option>
                            </select>
                            <div class="invalid-feedback">
                                <?= isset($error, $error['payment_method']) ? $error['payment_method'] : '' ?>
                            </div>
                            <div class="collapse <?= isset($payment_method) && $payment_method == 'new' ? 'show' : '' ?>"
                                 id="add_paymethod">
                                <div class="card mt-3">
                                    <div class="card-header">New Payment Method</div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label class="col-form-label">Full
                                                Name</label>
                                            <input type="text" name="full_name"
                                                   class="form-control <?= isset($error['full_name']) ? 'is-invalid' : '' ?>"
                                                   value="<?= isset($full_name) ? $full_name : '' ?>">
                                            <div class="invalid-feedback">
                                                <?= isset($error, $error['full_name']) ? $error['full_name'] : '' ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="cardNumber">Card number</label>
                                            <div class="input-group  ">
                                                <input type="text"
                                                       class="form-control <?= isset($error['number']) ? 'is-invalid' : '' ?>"
                                                       name="number" value="<?= isset($number) ? $number : '' ?>">

                                                <div class="input-group-append">
				                                    <span class="input-group-text text-muted">
					                                    <i class="fab fa-cc-visa"></i> &nbsp; <i
                                                                class="fab fa-cc-mastercard"></i>
				                                    </span>
                                                </div>
                                                <div class="invalid-feedback">
                                                    <?= isset($error, $error['number']) ? $error['number'] : '' ?>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="form-group col-3">
                                                <label class="col-form-label">Exp.
                                                    Month</label>
                                                <input type="number" min="1" max="12" name="exp_month"
                                                       class="form-control <?= isset($error['expiry']) ? 'is-invalid' : '' ?>"
                                                       value="<?= isset($exp_month) ? $exp_month : '' ?>">
                                                <div class="invalid-feedback">
                                                    <?= isset($error, $error['expiry']) ? $error['expiry'] : '' ?>
                                                </div>
                                            </div>
                                            <div class="form-group col-3">
                                                <label class="col-form-label">Exp Year</label>
                                                <input type="number" min="2019" max="2050" name="exp_year"
                                                       class="form-control <?= isset($error['expiry']) ? 'is-invalid' : '' ?>"
                                                       value="<?= isset($exp_year) ? $exp_year : '' ?>">
                                            </div>
                                            <div class="form-group col-6">
                                                <label class=" col-form-label">CVC</label>
                                                <input type="text" name="cvc"
                                                       class="form-control <?= isset($error['cvc']) ? 'is-invalid' : '' ?>"
                                                       value="<?= isset($cvc) ? $cvc : '' ?>">
                                                <div class="invalid-feedback">
                                                    <?= isset($error, $error['cvc']) ? $error['cvc'] : '' ?>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
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
                    <?php foreach ($cart->getProducts() as $product): ?>
                        <tr>
                            <td>
                                <figure class="media">
                                    <div class="img-wrap"><img class="img-thumbnail img-sm"
                                                               src="<?= $product->getPhotoUrl() ?>">
                                    </div>
                                    <figcaption class="media-body">
                                        <h6 class="title text-truncate"><a
                                                    href="/product.php?id=<?= $product->getId(
                                                    ) ?>"><?= $product->getName() ?> </a>
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
                <div class="form-group mt-2">
                    <label class="col-form-label">Shipment Type</label>
                    <select name="shipment_type" class="form-control">
                        <option value="0">Postal mail (€10)</option>
                        <option value="1">Courier service (€20)</option>
                    </select>
                </div>
                <button type="submit"
                        class="btn btn-block btn-success mt-4 <?= !$cart->getItemCount() ? 'disabled' : '' ?>"
                >
                    Go to Confirm
                </button>
            </div>

        </aside>

    </div>
</form>

<?php include_once "common/footer.html.php" ?>
