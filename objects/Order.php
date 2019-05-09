<?php
/**
 *contains properties and methods for "order" database queries.
 */

class Order
{

    //Db connection and table
    private $conn;
    private $table_name = 'order';

    //Object properties
    public $id;
    public $status;
    public $user_id;
    public $total;
    public $time;
    //detail của người order
    public $name;
    public $email;
    public $phone;
    public $address;

    //mảng : detail order
    public $shoppingCart;


    //Constructor with db conn
    public function __construct($db)
    {
        $this->conn = $db;
    }

    //lấy id của order vừa tạo --> chuẩn bị tạo detail order dựa vào id order
    public function getIdProductRecentlyCreated()
    {
        $query = "SELECT * FROM `order` order by id desc limit 0,1";


        //prepare
        $stmt = $this->conn->prepare($query);

        //bind id of product
        $stmt->bindParam(1, $this->id);

        //execute
        $stmt->execute();

        //fetch row
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row["id"];
    }

    //tạo detail order
    public function createOrderDetail()
    {
        //lấy thông tin id của bill vừa mới được tạo
        $idOrder = $this->getIdProductRecentlyCreated();
        // query to insert record

        $query = "INSERT INTO `orderdetail`
    SET
        order_id=:order_id,product_id=:product_id,number=:number";


        // prepare query
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":order_id", $idOrder);

        // sanitize
        // $this->total=htmlspecialchars(strip_tags($this->total));
        // bind values

        $arrProduct = $this->shoppingCart;
        for ($i = 0; $i < sizeof($arrProduct); $i++) {
            $item = $arrProduct[$i];
            $stmt->bindParam(":product_id", $item->id);
            $stmt->bindParam(":number", $item->quantity);
            // execute query
            
            if ($stmt->execute()) {
                
            }
            else{
                return false;
            }
        }
        return true;
    }
    // create order
    function createOrder()
    {

        // query to insert record
        $query = "INSERT INTO `order`
            SET
                total=:total,status=:status,user_id=:user_id,name=:name,phone=:phone,address=:address,email=:email";


        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        // $this->total=htmlspecialchars(strip_tags($this->total));
        // bind values
        $stmt->bindParam(":total", $this->total);
        $stmt->bindParam(":status", $this->status);
        $stmt->bindParam(":user_id", $this->user_id);
        $stmt->bindParam(":name", $this->name);
        $stmt->bindParam(":email", $this->email);
        $stmt->bindParam(":phone", $this->phone);
        $stmt->bindParam(":address", $this->address);


        // execute query
        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
    //Read order
    function read()
    {

        //select all
        $query = "SELECT * FROM  `order` order by time desc ";

        //prepare
        $stmt = $this->conn->prepare($query);

        //execute
        $stmt->execute();

        return $stmt;
    }
    //Read detail order
    function read_detail()
    {

        //select all
        // $query = "select * from order join orderdetail on order.id=orderdetail.order_id";
        $query = "SELECT * FROM `orderdetail` join `products` on `orderdetail`.product_id= `products`.id where order_id =?";


        //prepare
        $stmt = $this->conn->prepare($query);

        //bind id of product
        $stmt->bindParam(1, $this->id);

        //execute
        $stmt->execute();

        //fetch row
        $arr = array();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            array_push($arr, $row);
        }
        return $arr;
    }

//Read detail order của user đó:personal
    function read_detail_user()
    {

        //select all
        // $query = "select * from order join orderdetail on order.id=orderdetail.order_id";
        $query = "SELECT * FROM `order`  where user_id =?";


        //prepare
        $stmt = $this->conn->prepare($query);

        //bind id of product
        $stmt->bindParam(1, $this->user_id);

        //execute
        $stmt->execute();

        //fetch row
        $arr = array();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $status= "";
            if($row["status"]=="0"){
              $status = "Đang chờ xử lý";
            }  
            if($row["status"]=="1"){
              $status = "Đã xử lý";
            }
            if($row["status"]=="2"){
              $status = "Đã giao";
            }  
          $array = array("status"=>$status);
            array_push($arr, array_replace($row, $array));
        }
        return $arr;
    }

function updateStatusBill()
{
  // UPDATE `order` SET `id`=[value-1],`status`=[value-2] WHERE `id`=
  # code...
          $query = "UPDATE `order` SET  `status`=:status 
          WHERE `id`=:id";

        //prepare
        $stmt = $this->conn->prepare($query);

        //bind id of product
        $stmt->bindParam(":status", $this->status);
        $stmt->bindParam(":id", $this->id);

        //execute
        if($stmt->execute()) 
          return true;
        else
          return false;

}











    //update product
    function update()
    {

        //update query
        $query = "UPDATE
                    " . $this->table_name . "
                    SET
                        name=:name,
                        new_price=:new_price,
                        old_price=:old_price,
                        content=:content,
                        category_id=:category_id
                    WHERE
                        id=:id";

        //prepare
        $stmt = $this->conn->prepare($query);

        //sanitize
        $this->name = htmlspecialchars(strip_tags($this->name));
        $this->new_price = htmlspecialchars(strip_tags($this->new_price));
        $this->old_price = htmlspecialchars(strip_tags($this->old_price));
        $this->content = htmlspecialchars(strip_tags($this->content));
        $this->category_id = htmlspecialchars(strip_tags($this->category_id));
        $this->id = htmlspecialchars(strip_tags($this->id));

        //bind new values
        $stmt->bindParam(':name', $this->name);
        $stmt->bindParam(':new_price', $this->new_price);
        $stmt->bindParam(':old_price', $this->old_price);
        $stmt->bindParam(':content', $this->content);
        $stmt->bindParam(':category_id', $this->category_id);
        $stmt->bindParam(':id', $this->id);

        //execute
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    //delete product
    function delete()
    {

        //delete query
        $query = " DELETE FROM " . $this->table_name . " WHERE id = ?";

        //prepare
        $stmt = $this->conn->prepare($query);

        //sanitize
        $this->id = htmlspecialchars(strip_tags($this->id));

        //bind id
        $stmt->bindParam(1, $this->id);

        //execute
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    //search products
    function search($keywords)
    {

        //select all query
        $query = "SELECT
                    c.name as category_name, p.id, p.name, p.content, p.new_price,p.old_price, p.category_id, p.created
                  FROM " . $this->table_name . " p
                  LEFT JOIN
                    categories c ON p.category_id = c.id
                  WHERE
                    p.name LIKE ? OR p.content LIKE ? OR c.name LIKE ?
                  ORDER BY
                    p.created DESC";

        //prepare
        $stmt = $this->conn->prepare($query);

        //sanitize
        $keywords = htmlspecialchars(strip_tags($keywords));
        $keywords = "%{$keywords}%";

        //bind
        $stmt->bindParam(1, $keywords);
        $stmt->bindParam(2, $keywords);
        $stmt->bindParam(3, $keywords);

        //execute
        $stmt->execute();

        return $stmt;
    }

    //read products with pagination
    public function readPaging($from_record_num, $records_per_page)
    {

        //select
        $query = "SELECT
                    c.name as category_name, p.id, p.name, p.content, p.new_price,p.old_price, p.category_id, p.created
                  FROM " . $this->table_name . " p
                  LEFT JOIN
                    categories c ON p.category_id = c.id
                  ORDER BY p.created DESC
                  LIMIT ?, ?";

        //prepare
        $stmt = $this->conn->prepare($query);

        //bind
        $stmt->bindParam(1, $from_record_num, PDO::PARAM_INT);
        $stmt->bindParam(2, $records_per_page, PDO::PARAM_INT);

        //execute
        $stmt->execute();

        //return values from db
        return $stmt;
    }


    //paging products
    public function count()
    {
        $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name . "";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row['total_rows'];
    }
}
