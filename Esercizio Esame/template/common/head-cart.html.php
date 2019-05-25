<div class="widget-header dropdown">
    <a href="#" data-toggle="dropdown" data-offset="20,10" class="widget-header border-left pl-3 ml-3">
        <div class="icontext">
            <div class="icon-wrap icon-sm round border"><i class="fa fa-shopping-cart"></i></div>
        </div>
        <span class="badge badge-pill badge-danger notify"><?= count($_SESSION['cart']->getProducts()) ?></span>
    </a>
</div>