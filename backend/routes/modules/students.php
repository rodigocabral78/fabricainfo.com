<?php

/**
* Module Route Student
*/

use Illuminate\Support\Facades\Route;

Route::group([
    'namespace' => '\App\Modules\Api\Student\Controllers',
    'prefix' => 'v1/students',
], function () {
    # Route::apiResource('students', StudentController::class);
    Route::get('', StudentController::class . '@index');
    Route::post('', StudentController::class . '@store');

    # Required Parameters
    Route::get('{id}', StudentController::class . '@show');
    # Route::put('{id}', StudentController::class . '@update');
    Route::patch('{id}', StudentController::class . '@update');
    Route::delete('{id}', StudentController::class . '@destroy');
});
