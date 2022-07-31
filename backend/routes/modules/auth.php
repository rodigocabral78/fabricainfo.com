<?php

/**
* Module Route Auth
*/

use Illuminate\Support\Facades\Route;

Route::group([
    // 'namespace' => '\App\Http\Controllers',
    'namespace' => '\App\Modules\Api\Authentication\Controllers',
    'middleware' => 'api',
    'prefix' => 'v1/auth'
], function ($router) {
    Route::post('in', 'AuthController@login');
    Route::post('out', 'AuthController@logout');
    Route::post('me', 'AuthController@me');
    Route::post('refresh', 'AuthController@refresh');

    Route::post('login', 'AuthController@login');
    Route::post('logout', 'AuthController@logout');
});
