<?php

//Req headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset:UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

//Req includes
include_once '../config/database.php';
include_once '../objects/Order.php';

//Db conn and instances
$database = new Database();
$db = $database->getConnection();

$order = new Order($db);

//Get post data
$data = json_decode(file_get_contents("php://input"));

//set order values

$order->id = $data->id;
$order->status = $data->status;


//Create order
if ($order->updateStatusBill()) {
    echo '{';
    echo '"message": "order was updated."';
    echo '}';
} else {
    echo '{';
    echo '"message": "Unable to update order."';
    echo '}';
}

