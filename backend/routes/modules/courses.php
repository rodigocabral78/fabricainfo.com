<?php

/**
* Module Route Course
*/

use Illuminate\Support\Facades\Route;

Route::group([
    'namespace' => '\App\Modules\Api\Course\Controllers',
    'prefix' => 'v1/courses',
], function () {
    # Route::apiResource('courses', CourseController::class);
    Route::get('', CourseController::class . '@index');
    Route::post('', CourseController::class . '@store');

    # Required Parameters
    Route::get('{id}', CourseController::class . '@show');
    # Route::put('{id}', CourseController::class . '@update');
    Route::patch('{id}', CourseController::class . '@update');
    Route::delete('{id}', CourseController::class . '@destroy');
});
