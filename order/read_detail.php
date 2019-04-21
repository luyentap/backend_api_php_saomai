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

$order = new order($db);

//Set ID of order   to be edited
$order->id = isset($_GET['id']) ? $_GET['id']: die;

//Read orders of edited order
$arr=$order->read_detail();


print_r(json_encode($arr));
