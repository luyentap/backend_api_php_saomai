<?php

//Req headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset:UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

//Req includes
include_once '../config/database.php';
include_once '../objects/Product.php';

//Db conn and instances
$database = new Database();
$db = $database->getConnection();

$product = new Product($db);

//Get post data
$data = json_decode(file_get_contents("php://input"));

//set product values
$product->name          = $data->name;
$product->new_price = $data->new_price;
$product->old_price         = $data->old_price;
$product->content   = $data->content;
$product->category_id   = $data->category_id;
$product->created       = date('Y-m-d H:i:s');
$product->size = $data ->size;
$product->color=$data->color;


//Create product
if ($product->create()) {
    echo '{';
    echo '"message": "Product was created."';
    echo '}';
} else {
    echo '{';
    echo '"message": "Unable to create product."';
    echo '}';
}


