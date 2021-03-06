<?php

//Required headers

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

//Include db and object

include_once '../config/database.php';
include_once '../objects/Product.php';

//New instances

$database = new Database();
$db = $database->getConnection();

$product = new Product($db);

//Query products
$stmt = $product->read();
$num = $stmt->rowCount();
// var_dump ($stmt);
//Check if more than 0 record found
if($num > 0){

    //products array
    $products_arr = array();

    //retrieve table content
    // Difference fetch() vs fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){

        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
        $product_item = array(
            "id"            =>  $id,
            "name"          =>  $name,
            "content"   =>  $content,
            "old_price"         => (int)$old_price,
            "new_price"         => (int) $new_price,
            "img" =>$img,
            "category_id"   =>  $category_id,
            "category_name" =>  $category_name,
            "color"=> explode(' ', $color),
            "size"=> explode(' ', $size),
            "more"=>htmlspecialchars_decode($more, ENT_QUOTES)
            
            
        );

        array_push($products_arr, $product_item);
    }

    //array to json
    echo json_encode($products_arr);
}else{
    echo json_encode(
        array("messege" => "No products found.")
    );
}
