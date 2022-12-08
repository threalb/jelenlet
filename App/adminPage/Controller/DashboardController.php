<?php

namespace App\adminPage\Controller;

use Twig\Loader\FilesystemLoader;

class DashboardController {
    public function index(){
        $twig = (new DashboardController())->setTwigEnvironment();
        echo $twig->render('dashboard.html.twig',[]);
    }

    public function setTwigEnvironment(){
        $loader = new FilesystemLoader(__DIR__ . '\..\View');
        $twig = new \Twig\Environment($loader, [
            'debug' => true,
        ]);
        $twig->addExtension(new \Twig\Extension\DebugExtension());
        return $twig;
    }
}