<form action="/product-list.php" class="search-wrap">
    <div class="input-group w-100">
        <select name="category" class="custom-select w-30" onchange="this.form.submit()">
            <option value="0" <?= (isset($category) && $category == 0)?'selected':'' ?>> All category</option>
            <option value="1" <?= (isset($category) && $category == 1)?'selected':'' ?>> Book</option>
            <option value="2" <?= (isset($category) && $category == 2)?'selected':'' ?>> Comic</option>
            <option value="3" <?= (isset($category) && $category == 3)?'selected':'' ?>> Audio CD</option>
            <option value="4" <?= (isset($category) && $category == 4)?'selected':'' ?>> Vinyl</option>
            <option value="5" <?= (isset($category) && $category == 5)?'selected':'' ?>> DVD Movie</option>
            <option value="6" <?= (isset($category) && $category == 6)?'selected':'' ?>> Video Games</option>
        </select>
        <input type="text" name="search_text" class="form-control" style="width:55%;" placeholder="Search" value="<?= (isset($search_text))?$search_text:'' ?>">
        <select class="custom-select" name="type" onchange="this.form.submit()">
            <option value="0" <?= (isset($type) && $type == 0)?'selected':'' ?>>All type</option>
            <option value="1" <?= (isset($type) && $type == 1)?'selected':'' ?>>Only best</option>
            <option value="2" <?= (isset($type) && $type == 2)?'selected':'' ?>>Latest</option>
        </select>
        <input type="hidden" name="order" value="<?= isset($order)?$order:'featured' ?>">
        <div class="input-group-append">
            <button class="btn btn-primary" type="submit">
                <i class="fa fa-search"></i>
            </button>
        </div>
    </div>
</form> <!-- search-wrap .end// -->