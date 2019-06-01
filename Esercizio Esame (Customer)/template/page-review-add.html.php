<?php require_once "common/header-default.html.php"
    /**
     * @var $product  \Entity\Product
     */
?>

    <div class="card  p-2">
        <div class="row no-gutters">
            <aside class="border-right">
                <figure class="media">
                    <div class="img-wrap"><img class="img-thumbnail img-sm"
                                               src="<?= $product->getPhotoUrl() ?>"></div>

                </figure>
            </aside>
            <article class="align-self-center pl-2 p-2">
                <h5 class="title  p-2">
                    Write a review for <a href="/product.php?id=<?= $product->getId() ?>"><?= $product->getName() ?></a>
                </h5>

            </article> <!-- col.// -->
        </div> <!-- row.// -->
    </div> <!-- card.// -->

    <div class="card mt-3">
        <div class="card-body">
            <form action="/review.php" method="post">
                <div class="form-group">
                    <label>Rate</label>
                    <div class="form-control <?= isset($error) && isset($error['vote'])?'is-invalid':''?>">
                        <ul class="rating-stars">
                            <li class="stars-active" id="stars-active" style="width: <?= (isset($vote)?intval($vote):0) * 25 ?>%">
                                <i star="1" class="fa fa-star"></i> <i star="2" class="fa fa-star"></i>
                                <i star="3"  class="fa fa-star"></i> <i star="4" class="fa fa-star"></i>
                            </li>
                            <li>
                                <i star="1" class="fa fa-star"></i> <i star="2" class="fa fa-star"></i>
                                <i star="3"  class="fa fa-star"></i> <i star="4" class="fa fa-star"></i>
                            </li>
                           
                        </ul>
                    </div>
                    <div class="invalid-feedback">
                        <?= isset($error, $error['vote']) ? $error['vote'] : '' ?>
                    </div>
                </div>
                <div class="form-group">
                    <label>Content</label>
                    <textarea class="form-control <?= isset($error) && isset($error['content'])?'is-invalid':''?>" name="content"><?= isset($content)?$content:'' ?></textarea>
                    <div class="invalid-feedback">
                        <?= isset($error, $error['content']) ? $error['content'] : '' ?>
                    </div>
                    <small class="form-text text-muted">
                        The content must be between 80 and 512 characters long
                    </small>
                </div>
                <input type="hidden" id="vote" name="vote" value="<?= isset($vote)?$vote:0 ?>">
                <input type="hidden" name="product_id" value="<?= $product->getId()?>">
                <button type="submit" class="btn btn-primary">Submit</button>

            </form>
        </div>

    </div>
    
    <script>
        $(document).ready(function () {
            console.log("ciao");
            $('.fa-star').click(function () {
                $('#stars-active').width((this.getAttribute("star")*25)+"%");
                $('#vote').val(this.getAttribute("star"));
            });
        });
    </script>


<?php include_once "common/footer.html.php" ?>