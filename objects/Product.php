<?php
/**
*contains properties and methods for "product" database queries.
 */

class Product
{

    //Db connection and table
    private $conn;
    private $table_name = 'products';

    //Object properties
    public $id;
    public $name;
    public $img;
    public $content;
    public $new_price ;
    public $old_price ;
    public $category_id;
    public $category_name;
    public $created;
    public $color;
    public $size;
    public $more;


    //Constructor with db conn
    public function __construct($db)
    {
        $this->conn = $db;
    }
// create product
function create(){
 
    // query to insert record
    $query = "INSERT INTO
                " . $this->table_name . "
            SET
                name=:name, new_price=:new_price,old_price=:old_price, content=:content, category_id=:category_id,color=:color,size=:size";
 
    // prepare query
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->name=htmlspecialchars(strip_tags($this->name));
    $this->new_price=htmlspecialchars(strip_tags($this->new_price));
    $this->old_price=htmlspecialchars(strip_tags($this->old_price));
    $this->content=htmlspecialchars(strip_tags($this->content));
    $this->category_id=htmlspecialchars(strip_tags($this->category_id));
 
    // bind values
    $stmt->bindParam(":name", $this->name);
    $stmt->bindParam(":new_price", $this->new_price);
    $stmt->bindParam(":old_price", $this->old_price);
    $stmt->bindParam(":content", $this->content);
    $stmt->bindParam(":category_id", $this->category_id);
        $stmt->bindParam(':size', $this->size);
    $stmt->bindParam(':color', $this->color);

 
    // execute query
    if($stmt->execute()){
        return true;
    }
 
    return false;
     
}

    //Read product
    function read(){

        //select all
        $query = "SELECT
                    c.name AS category_name, p.id,p.color,p.size, p.more,p.name, p.content, p.new_price,p.old_price,p.img, p.category_id, p.created
                  FROM
                  " . $this->table_name . " p
                  LEFT JOIN
                    categories c ON p.category_id = c.id
                  ORDER BY
                    p.created DESC";

        //prepare
        $stmt = $this->conn->prepare($query);

        //execute
        $stmt->execute();

        return $stmt;

    }


    //read single product
    function readOne(){

        //read single record
        $query = "SELECT
                c.name as category_name, p.id, p.name, p.content, p.new_price,p.old_price, p.category_id, p.created
            FROM
                " . $this->table_name . " p
                   LEFT JOIN
                    categories c ON p.category_id = c.id
                   WHERE
                   p.id = ? LIMIT 0,1";

        //prepare
        $stmt = $this->conn->prepare($query);

        //bind id of product
        $stmt->bindParam(1, $this->id);

        //execute
        $stmt->execute();

        //fetch row
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        //set values to update
        $this->name=$row['name'];
        $this->new_price=$row['new_price'];
        $this->old_price=$row['old_price'];
        $this->content=$row['content'];
        $this->category_id=$row['category_id'];
        $this->category_name=$row['category_name'];

    }



    //update product
    function update(){

        //update query
        $query = "UPDATE
                    " . $this->table_name. "
                    SET
                        name=:name,
                        new_price=:new_price,
                        old_price=:old_price,
                        content=:content,
                        color=:color,
                        size=:size,
                        category_id=:category_id
                    WHERE
                        id=:id";

        //prepare
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
        $stmt->bindParam(':size', $this->size);
        $stmt->bindParam(':color', $this->color);
        $stmt->bindParam(':category_id', $this->category_id);
        $stmt->bindParam(':id', $this->id);

        //execute
        if($stmt->execute()){
            return true;
        }

        return false;
    }

    //delete product
    function delete(){

        //delete query
        $query = " DELETE FROM " . $this->table_name . " WHERE id = ?";

        //prepare
        $stmt = $this->conn->prepare($query);

        //sanitize
        $this->id=htmlspecialchars(strip_tags($this->id));

        //bind id
        $stmt->bindParam(1, $this->id);

        //execute
        if($stmt->execute()){
            return true;
        }

        return false;
    }

    //search products
    function search($keywords){

        //select all query
        $query = "SELECT
                    c.name as category_name, p.id, p.name, p.content, p.new_price,p.old_price, p.category_id, p.created
                  FROM " . $this->table_name. " p
                  LEFT JOIN
                    categories c ON p.category_id = c.id
                  WHERE
                    p.name LIKE ? OR p.content LIKE ? OR c.name LIKE ?
                  ORDER BY
                    p.created DESC";

        //prepare
        $stmt =$this->conn->prepare($query);

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
    public function readPaging($from_record_num, $records_per_page){

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
    public function count(){
        $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name . "";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row['total_rows'];

    }
}
