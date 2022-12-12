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
/******************* Dolgozók endpointok ************/
/******************************************************/

Router::get('/employees', function (Request $req, Response $res) {
    return ((new EmployeeController())->list());
});

Router::get('/employeeAdd', function (Request $req, Response $res) {
    (new EmployeeController())->add();
});

Router::post('/employeeAdd', function (Request $req, Response $res) {
    (new EmployeeController())->save();
});

Router::get('/employeeEdit/([0-9]*)', function (Request $req, Response $res) {
    (new EmployeeController())->editById($req->params[0]);
});

Router::post('/employeeEdit', function (Request $req, Response $res) {
    (new EmployeeController())->update();
});

Router::get('/employeeDelete/([0-9]*)', function (Request $req, Response $res) {
    (new EmployeeController())->deleteById($req->params[0]);
});

Router::post('/employeeDelete', function (Request $req, Response $res) {
    (new EmployeeController())->delete();
});

/********************************************************/
/************ Dolgozó kategóriák - endpointok **********/
/******************************************************/

Router::get('/employeeCategories', function (Request $req, Response $res) {
    return ((new EmployeeCategoryController())->list());
});

Router::get('/employeeCategoryAdd', function (Request $req, Response $res) {
    (new EmployeeCategoryController())->add();
});

Router::post('/employeeCategoryAdd', function (Request $req, Response $res) {
    (new EmployeeCategoryController())->save();
});

Router::get('/employeeCategoryEdit/([0-9]*)', function (Request $req, Response $res) {
    (new EmployeeCategoryController())->editById($req->params[0]);
});

Router::post('/employeeCategoryEdit', function (Request $req, Response $res) {
    (new EmployeeCategoryController())->update();
});

Router::get('/employeeCategoryDelete/([0-9]*)', function (Request $req, Response $res) {
    (new EmployeeCategoryController())->deleteById($req->params[0]);
});

Router::post('/employeeCategoryDelete', function (Request $req, Response $res) {
    (new EmployeeCategoryController())->delete();
});
/********************************************************/
/****************** Calendar endpoint ******************/
/******************************************************/
Router::get('/calendar', function (Request $req, Response $res) {
    return ((new CalendarController())->index());
});

App::run();

