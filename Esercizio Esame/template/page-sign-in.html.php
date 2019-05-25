<?php include_once "common/header-clean.html.php";
?>


<div class="card">
    <article class="card-body">
        <h4 class="card-title text-center mb-4 mt-1">Sign in</h4>
        <hr>
        <p class="text-danger text-center"><?= isset($error, $error['sign-in']) ? $error['sign-in'] : '' ?></p>
        <form action="/sign-in.php" method="post">
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="email" class="form-control <?= isset($error['email']) ? 'is-invalid' : '' ?>" value="<?= isset($email) ? $email : '' ?>" placeholder="Email" type="email">
                    <div class="invalid-feedback">
                        <?= isset($error, $error['email']) ? $error['email'] : '' ?>
                    </div>
                </div> <!-- input-group.// -->
            </div> <!-- form-group// -->
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                    </div>
                    <input name="password" class="form-control <?= isset($error['password']) ? 'is-invalid' : '' ?>" value="<?= isset($password) ? $password : '' ?>" placeholder="******" type="password">
                    <div class="invalid-feedback">
                        <?= isset($error, $error['password']) ? $error['password'] : '' ?>
                    </div>
                </div> <!-- input-group.// -->
            </div> <!-- form-group// -->
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block"> Login  </button>
            </div> <!-- form-group// -->
            <?php if (isset($redirect_to)): ?>
                <input type="hidden" name="redirect_to" value="<?= $redirect_to ?>">
            <?php endif; ?>
        </form>
    </article>
</div> <!-- card.// -->


<?php include_once "common/footer.html.php" ?>
