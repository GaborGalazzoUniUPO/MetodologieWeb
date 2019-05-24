<?php require_once "common/header-clean.html.php"


?>


    <div class="card">
        <header class="card-header">
            <h4 class="card-title mt-2">Sign up</h4>
        </header>
        <article class="card-body">
            <form action="/sign-up.php" method="post">
                <div class="form-row">
                    <div class="col form-group ">
                        <label>First name</label>
                        <input type="text" class="form-control <?= isset($error['name']) ? 'is-invalid' : '' ?>"
                               placeholder="" value="<?= isset($name) ? $name : '' ?>" name="name">
                        <div class="invalid-feedback">
                            <?= isset($error, $error['name']) ? $error['name'] : '' ?>
                        </div>
                    </div> <!-- form-group end.// -->
                    <div class="col form-group">
                        <label>Last name</label>
                        <input type="text" class="form-control <?= isset($error['surname']) ? 'is-invalid' : '' ?>"
                               placeholder="" value="<?= isset($surname) ? $surname : '' ?>" name="surname">
                        <div class="invalid-feedback">
                            <?= isset($error, $error['surname']) ? $error['surname'] : '' ?>
                        </div>
                    </div> <!-- form-group end.// -->
                </div> <!-- form-row end.// -->
                <div class="form-group">
                    <label>Email address</label>
                    <input type="email" class="form-control <?= isset($error['email']) ? 'is-invalid' : '' ?>"
                           value="<?= isset($email) ? $email : '' ?>" placeholder="" name="email">
                    <div class="invalid-feedback">
                        <?= isset($error, $error['email']) ? $error['email'] : '' ?>
                    </div>
                    <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div> <!-- form-group end.// -->
                <div class="form-group">
                    <label>Create password</label>
                    <input class="form-control <?= isset($error['secret']) ? 'is-invalid' : '' ?>"
                           value="<?= isset($secret) ? $secret : '' ?>" type="password" name="secret">
                    <div class="invalid-feedback">
                        <?= isset($error, $error['secret']) ? $error['secret'] : '' ?>
                    </div>
                </div> <!-- form-group end.// -->
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Register</button>
                </div> <!-- form-group// -->
                <small class="text-muted">By clicking the 'Sign Up' button, you confirm that you accept our <br>
                    Terms of use and Privacy Policy.
                </small>
                <?php if (isset($redirect_to)): ?>
                    <input type="hidden" name="redirect_to" value="<?= $redirect_to ?>">
                <?php endif; ?>
            </form>
        </article> <!-- card-body end .// -->
        <div class="border-top card-body text-center">Have an account? <a href="/sign-in.php">Log In</a></div>
    </div> <!-- card.// -->


<?php include_once "common/footer.html.php" ?>