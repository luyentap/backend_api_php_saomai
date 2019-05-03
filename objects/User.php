<?php
/**
 *contains properties and methods for "order" database queries.
 */

class User
{

    //Db connection and table
    private $conn;
    private $table_name = 'user';

    //Object properties
    public $id;
    public $username;
    public $email;
    public $password;
    public $phone;
    public $address;
    public $token;

    //Constructor with db conn
    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function login()
    {

        $query = "SELECT * FROM `user` WHERE email=:email and password=:password";


        // prepare query
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":email", $this->email);
        $stmt->bindParam(":password", $this->password);


       //execute
        $stmt->execute();

        //fetch row
        $arr = array();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            array_push($arr, $row);
        }
        return $arr;
    }
    // create order
    function register()
    {

        // query to insert record
        $query = "INSERT INTO `user`
            SET
                name=:name,email=:email,password=:password,phone=:phone,address=:address";


        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        // $this->total=htmlspecialchars(strip_tags($this->total));
        // bind values
        $stmt->bindParam(":name", $this->name);
        $stmt->bindParam(":email", $this->email);
        $stmt->bindParam(":password", $this->password);
        $stmt->bindParam(":address", $this->address);
        $stmt->bindParam(":phone", $this->phone);


        // execute query
        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
    //Read order
    function list()
    {

        //select all
        $query = "SELECT * FROM  `user` where role=0 ";

        //prepare
        $stmt = $this->conn->prepare($query);

        //execute
        $stmt->execute();

        //fetch row
        $arr = array();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            array_push($arr, $row);
        }
        return $arr;
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
