<?php
require_once "../preload.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    extract($_POST);

    $info = "_" . $type;

    $connection = \Functionality\Database::getConnection();
    $query = "insert into products (code, photo_url, description, name, unit_price, type,  small_description,
                      category_info)
values ('$code', '$photo_url', :description, :name, $unit_price, $type, :small_description, :info)";
    $connection->prepare($query)
        ->execute(
                ['info' => serialize($$info),
                    'description' => $description,
                    'small_description' => $small_description,
                    'name' => $name
                    ]
        );
}

?>

<form action="insert-product.php" method="post">
    <div>
        <label>
            Code:
            <input type="text" name="code">
        </label>
    </div>
    <div>
        <label>
            Name:
            <input type="text" name="name">
        </label>
    </div>
    <div>
        <label>
            Photo url:
            <input type="text" name="photo_url">
        </label>
    </div>
    <div>
        <label>
            Description:
            <input type="text" name="description">
        </label>
    </div>
    <div>
        <label>
            Small Description:
            <input type="text" name="small_description">
        </label>
    </div>
    <div>
        <label>
            Unit price:
            <input type="text" name="unit_price">
        </label>
    </div>

    <div>
        <label>
            Type:
            <input type="number" name="type" value="5">
        </label>
    </div>

    <br/>
    <br/>
    Movie INFO:

    <div>
        <label>
            Director:
            <input type="text" name="_5[Director]">
        </label>
    </div>
    <div>
        <label>
            Actors:
            <input type="text" name="_5[Actors]">
        </label>
    </div>
    <div>
        <label>
            Genre:
            <input type="text" name="_5[Genre]" value="">
        </label>
    </div>
    <div>
        <label>
            Pub year:
            <input type="text" name="_5[Publication year]">
        </label>
    </div>

    </br/>
    BOOK INFO:

    <div>
        <label>
            Author:
            <input type="text" name="_1[Author]">
        </label>
    </div>
    <div>
        <label>
            Editor:
            <input type="text" name="_1[Editor]">
        </label>
    </div>
    <div>
        <label>
            ISBN:
            <input type="text" name="_1[ISBN]" value="null">
        </label>
    </div>
    <div>
        <label>
            Page num:
            <input type="text" name="_1[Print length]">
        </label>
    </div>
    <div>
        <label>
            Pub year:
            <input type="text" name="_1[Publication year]">
        </label>
    </div>

    <br/>
    <br/>
    COMIC INFO:

    <div>
        <label>
            Author:
            <input type="text" name="_2[Author]">
        </label>
    </div>
    <div>
        <label>
            Editor:
            <input type="text" name="_2[Editor]">
        </label>
    </div>
    <div>
        <label>
            ISBN:
            <input type="text" name="_2[ISBN]" value="null">
        </label>
    </div>
    <div>
        <label>
            Page num:
            <input type="text" name="_2[Print length]">
        </label>
    </div>
    <div>
        <label>
            Pub year:
            <input type="text" name="_2[Publication year]">
        </label>
    </div>


    <input type="submit" value="submit">
</form>
