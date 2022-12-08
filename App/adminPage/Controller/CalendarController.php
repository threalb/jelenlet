<?php

namespace App\adminPage\Controller;

use Twig\Loader\FilesystemLoader;

class CalendarController {
    public function index() {
        $twig = (new CalendarController())->setTwigEnvironment();
        echo $twig->render('calendar/calendar.html.twig');
    }

    public function setTwigEnvironment() {
        $loader = new FilesystemLoader(__DIR__ . '\..\View');
        $twig = new \Twig\Environment($loader, [
            'debug' => true,
        ]);
        $twig->addExtension(new \Twig\Extension\DebugExtension());
        return $twig;
    }
}