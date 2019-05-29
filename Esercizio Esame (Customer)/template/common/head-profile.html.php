<div class="widget-header">
    <?php if(!isset($_SESSION['user']) || !$_SESSION['user']): ?>
    <small class="title text-muted">Welcome guest!</small>
    <div><a href="/sign-in.php?redirect_to=<?= $_SERVER['REQUEST_URI'] ?>">Sign in</a> <span
                class="dark-transp"> | </span>
        <a href="/sign-up.php?redirect_to=<?= $_SERVER['REQUEST_URI'] ?>"> Register</a></div>
    <?php else: ?>

        <small class="title text-muted">Welcome <?= $_SESSION['user']->getName() ?></small>
        <div><a href="/profile.php?redirect_to=<?= $_SERVER['REQUEST_URI'] ?>">Profile</a> <span
                    class="dark-transp"> | </span>
            <a href="/sign-out.php?redirect_to=<?= $_SERVER['REQUEST_URI'] ?>">Log-Out</a></div>

    <?php endif; ?>
</div>
