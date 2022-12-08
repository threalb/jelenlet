<?php
require __DIR__ . '/vendor/autoload.php';

use App\Lib\Config;
use App\Lib\Logger;
use App\Lib\App;
use App\Lib\Router;
use App\Lib\Request;
use App\Lib\Response;
use App\publicPage\Controller\HomeController;
use App\adminPage\Controller\DashboardController;
use App\adminPage\Controller\LoginController;
use App\adminPage\Controller\CalendarController;

/******************************************************** */
/********************************************************/
/******************* publicPage endpointok *************/
/******************************************************/
/*************************************************** */
Router::get('/', function () {
    (new HomeController())->indexAction();
});
/*********************************************************/
/********************************************************/
/******************* ADMIN endpointok ******************/
/******************************************************/
/*************************************************** */

/********************************************************/
/***************** Dashboard endpoint ******************/
/******************************************************/
Router::get('/dashboard', function () {
    return ((new DashboardController())->index());
});
/********************************************************/
/******************** Login endpoint *******************/
/******************************************************/

Router::get('/login', function (Request $req, Response $res) {
    return ((new LoginController())->index());
});

Router::post('/login', function (Request $req, Response $res) {
    return ((new LoginController())->validateUserByEmailAndPassword());
});

/********************************************************/
/****************** Calendar endpoint ******************/
/******************************************************/
Router::get('/calendar', function (Request $req, Response $res) {
    return ((new CalendarController())->index());
});

App::run();

