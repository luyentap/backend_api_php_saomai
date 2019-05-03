<?php

//Req headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset:UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Headers: access");

//Include db and object

include_once '../config/database.php';
include_once '../objects/User.php';

//New instances

$database = new Database();
$db = $database->getConnection();

$user = new User($db);


//Read orders of edited order
$arr=$user->list();


print_r(json_encode($arr));
