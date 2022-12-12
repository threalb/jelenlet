<?php

namespace App\adminPage\Controller;

use Twig\Loader\FilesystemLoader;
use App\adminPage\Model\CalendarDao;

class CalendarController {
    public function index() {
        $feastDays=CalendarDao::getAllFeastDays();
        $presenceTypes=CalendarDao::getAllPresenceType();
        $twig = (new CalendarController())->setTwigEnvironment();
        echo $twig->render('calendar/calendar.html.twig',[
            'feastDays'=>$feastDays,
            'presenceTypes'=>$presenceTypes,
        ]);
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