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
$user->name = $data->name;
$user->email = $data->email;
$user->password = $data->password;
$user->phone = $data->phone;
$user->address = $data->address;
//Read orders of edited order
if($user->register()){
	echo "{'message':'sucess'}";
}else{
	echo "{'message':'failed'}";
}

