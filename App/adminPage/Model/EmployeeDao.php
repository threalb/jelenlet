<?php

namespace App\adminPage\Model;

use App\Lib\Database;
use App\admin\Model\ICrudDao;

class EmployeeDao implements ICrudDao{

    public static function all(){
        $dbObj = new Database();
        $conn = $dbObj->getConnection();
        $sql = "SELECT e.id, e.first_name, e.last_name, e.email, e.category_id, e.description, e.picture_link, e.status, e.created_at, e.updated_at, e.deleted_at, e.created_by, e.updated_by, e.deleted_by, ec.name FROM employee as e INNER JOIN employee_category as ec ON e.category_id = ec.id WHERE e.deleted= 0 ORDER BY e.id;";
        $statement = $conn->prepare($sql);
        $statement->setFetchMode(\PDO::FETCH_OBJ);
        $statement->execute();
        return $statement->fetchAll();
    }
    public static function getById(int $id){

    }
    public static function save(){

    }
    public static function delete(){

    }
    public static function update(){

    }
}