<?php include_once "common/header-default.html.php";
    /**
     * @var $msgs     \Entity\ReportMessage[]
     * @var $order    \Entity\Order
     */
?>

<div class="w-75 mx-auto">
    <header class="mb-5">
        Report for order n: <a href="/order.php?order_id=<?= $order->getId() ?>"><?= $order->getCode() ?></a>
    </header>

<?php foreach ($msgs as $msg): ?>
        <div class="<?= !$msg->getType()?'text-left':'text-right'?>">
            <article ><p class="alert alert-info" style="display:inline-block; max-width: 60%"><?= $msg->getText() ?></p></article>
        </div>
<?php endforeach; ?>

<div class="mb-5 m-5 p-5">
    <div class="m-5">
    </div>
</div>

<form class="fixed-bottom mb-5 m-5 p-5" action="/report.php" method="post">
    <div class="m-5">
        <input type="hidden" name="order_id" value="<?= $order->getId() ?>">
        <textarea name="text" class="form-control" placeholder="Insert your message here..."></textarea>
        <div class="text-right">
            <button type="submit" class="btn btn-primary mt-2 ">Submit</button>
        </div>
    </div>
</form>

</div>

<?php include_once "common/footer.html.php" ?>
