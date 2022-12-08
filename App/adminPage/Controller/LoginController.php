<?php

namespace App\adminPage\Controller;

use Twig\Loader\FilesystemLoader;
class LoginController
{
    public function index()
    {
        $twig = (new LoginController())->setTwigEnvironment();
        echo $twig->render('login/login.html.twig');
    }

//    public function validateUserByEmailAndPassword(){
//
//        if (LoginDao::validateUserByEmailAndPassword()){
//            header('Location: /users');
//        } else {
//            echo '<script>alert("Hibás felhasználónév/jelszó!!!")</script>';
//            echo '<script>history.go(-1)</script>';
//        }
//    }

    public function setTwigEnvironment(){
        $loader = new FilesystemLoader(__DIR__ . '\..\View');
        $twig = new \Twig\Environment($loader, [
            'debug' => true,
        ]);
        $twig->addExtension(new \Twig\Extension\DebugExtension());
        return $twig;
    }

}