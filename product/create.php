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
$db=$database->getConnection();

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

//Create product
if($product->create()){
    echo '{';
        echo '"message": "Product was created."';
    echo '}';
}else{
    echo '{';
        echo '"message": "Unable to create product."';
    echo '}';
}

function create(){

    //query insert
    $query = "INSERT INTO
              ". $this->table_name ."
              SET
                name=:name, price=:price, content=:content, category_id=:category_id, created=:created";

    //Prepare
    $stmt = $this->conn->prepare($query);

   //sanitize
   $this->name=htmlspecialchars(strip_tags($this->name));
   $this->new_price=htmlspecialchars(strip_tags($this->new_price));
   $this->old_price=htmlspecialchars(strip_tags($this->old_price));        
   $this->content=htmlspecialchars(strip_tags($this->content));
   $this->category_id=htmlspecialchars(strip_tags($this->category_id));
   $this->id=htmlspecialchars(strip_tags($this->id));

   //bind new values
   $stmt->bindParam(':name', $this->name);
   $stmt->bindParam(':new_price', $this->new_price);
   $stmt->bindParam(':old_price', $this->old_price);
   $stmt->bindParam(':content', $this->content);
   $stmt->bindParam(':category_id', $this->category_id);
   $stmt->bindParam(':id', $this->id);

    //execute
    if($stmt->execute()){
        return true;
    }
    return false;
}
