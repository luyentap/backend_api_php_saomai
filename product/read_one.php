<?php

//Req headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset:UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Headers: access");

//Include db and object

include_once '../config/database.php';
include_once '../objects/Product.php';

//New instances

$database = new Database();
$db = $database->getConnection();

$product = new Product($db);

//Set ID of product to be edited
$product->id = isset($_GET['id']) ? $_GET['id']: die;

//Read details of edited product
$product->readOne();

//Create array
$product_arr = array(
    "id" => $product->id,
    "name" => $product->name,
    "content" => $product->content,
    "new_price" => $product->new_price,
    "old_price" => $product->old_price,
    "category_id" => $product->category_id,
    "category_name" => $product->category_name
);

print_r(json_encode($product_arr));
