<?php
require __DIR__ . '/vendor/autoload.php';

use App\Lib\Config;
use App\Lib\Logger;
use App\Lib\App;
use App\Lib\Router;
use App\Lib\Request;
use App\Lib\Response;
use App\publicPage\Controller\HomeController;

Router::get('/', function () {
    (new HomeController())->indexAction();
});
App::run();

