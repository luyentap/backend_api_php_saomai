<?php

//Required headers

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

//Include db and object

include_once '../config/database.php';
include_once '../objects/Order.php';

//New instances

$database = new Database();
$db = $database->getConnection();

$order = new Order($db);

//Query products
$stmt = $order->read();
// $num = $stmt->rowCount();
// var_dump ($stmt);
//Check if more than 0 record found
// if($num > 0){

    //array
    $arr = array();

    //retrieve table content
    // Difference fetch() vs fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){

        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
        if($status==0)
            $status = "đang chờ xử lý";
        if($status==1)
            $status ="đã xử lý";
        if($status==2)
            $status ="đã giao";
         
        $item = array(
            "id"            =>  $id,
            "status"        => $status,
            "user_id"       => $user_id,
            "total"=>$total,
            "time"=>$time,
            "name"=>$name,
            "email"=>$email,
            "address"=>$address,
            "phone"=>$phone       
            
        );

        array_push($arr, $item);
    }

    //array to json
    echo json_encode($arr);
// }else{
//     echo json_encode(
//         array("messege" => "No products found.")
//     );
// }
