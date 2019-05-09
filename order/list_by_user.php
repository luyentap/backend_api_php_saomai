<?php

//Req headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset:UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Headers: access");

//Include db and object

include_once '../config/database.php';
include_once '../objects/Order.php';

//New instances

$database = new Database();
$db = $database->getConnection();

$order = new Order($db);

//Set ID of order  
$order->user_id = isset($_GET['user_id']) ? $_GET['user_id']: die;
//Read orders 
$arr=$order->read_detail_user();

print_r(json_encode($arr));
