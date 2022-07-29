<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

$basePath = base_path('routes/modules');
$filesAdmin = File::allFiles($basePath);
foreach ($filesAdmin as $file) {
    // Route::middleware('api')
    //     ->group(base_path('routes/modules/' . $file->getFilename()));
    Route::group([], $basePath . '/' . $file->getFilename());
}
