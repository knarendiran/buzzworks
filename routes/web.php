<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});



//$router->group(['prefix' => 'api'], function () use ($router) {
  $router->get('recipes',  ['uses' => 'ReceipeController@List']);

  $router->get('recipes/{id}', ['uses' => 'ReceipeController@getById']);

  $router->post('recipes', ['uses' => 'ReceipeController@create']);

  $router->delete('recipes/{id}', ['uses' => 'ReceipeController@delete']);

  $router->put('recipes/{id}', ['uses' => 'ReceipeController@update']);

  $router->put('recipes/{id}/rating', ['uses' => 'ReceipeController@rating']);

//});
