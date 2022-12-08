<?php

namespace App\adminPage\Model;

use App\Lib\Database;

class LoginDao {

    public static function validateUserByEmailAndPassword(){
        $dbObj = new Database();
        $conn = $dbObj->getConnection();

        $email = $_POST['email'];
        $password = sha1($_POST['password']);

        $statement = $conn->prepare("SELECT * FROM user WHERE email =:email AND password=:password;");
        $statement->setFetchMode(\PDO::FETCH_OBJ);
        $statement->execute([
            'email'=>$email,
            'password'=>$password,
        ]);
        if ($statement->fetch()){

            return true;
        } else {
            return false;
        }
    }
}
