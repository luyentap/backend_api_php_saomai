<?php

//Req headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset:UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

//Req includes
include_once '../config/database.php';
include_once '../objects/User.php';
//New instances
$database = new Database();
$db = $database->getConnection();

$user = new User($db);

//Get post data
$data = json_decode(file_get_contents("php://input"));

//Set ID of order   to be edited
$user->email = $data->email;
$user->password = $data->password;
//Read orders of edited order
$arr=$user->login();


print_r(json_encode($arr));
