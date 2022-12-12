<?php

namespace App\adminPage\Model;

use App\Lib\Database;

class CalendarDao {
    public static function getAllFeastDays() {
        $dbObj = new Database();
        $conn = $dbObj->getConnection();
        $sql= "SELECT * FROM feastdays WHERE FeastD_IsActive = 1 ORDER BY FeastD_ID;";
        $statement =$conn->prepare($sql);
        $statement -> setFetchMode(\PDO::FETCH_OBJ);
        $statement->execute();
        return $statement->fetchAll();

    }
    public static function getAllPresenceType() {
        $dbObj = new Database();
        $conn = $dbObj->getConnection();
        $sql= "SELECT * FROM presencetype  ORDER BY PT_ID;";
        $statement =$conn->prepare($sql);
        $statement -> setFetchMode(\PDO::FETCH_OBJ);
        $statement->execute();
        return $statement->fetchAll();
    }
}