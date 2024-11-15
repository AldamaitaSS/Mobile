<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\APIController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\FormUploadController;
use App\Http\Controllers\BidangController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');

Route::post("all_data", [APIController::class, "index"]);
Route::post("create_data", [APIController::class, "store"]);
Route::post("show_data", [APIController::class, "show"]);
Route::post("edit_data", [APIController::class, "edit"]);
Route::post("delete_data", [APIController::class, "destroy"]);

Route::post("all_data", [UserController::class, "index"]);
Route::post("create_data", [UserController::class, "store"]);
Route::post("show_data", [UserController::class, "show"]);
Route::post("edit_data", [UserController::class, "edit"]);
Route::post("delete_data", [UserController::class, "destroy"]);

// Rute untuk FormUploadController (untuk mengelola sertifikat)
Route::post("all_upload", [FormUploadController::class, "index"]); // Mendapatkan semua sertifikat
Route::post("create_upload", [FormUploadController::class, "store"]); // Meng-upload sertifikat baru
Route::post("show_upload", [FormUploadController::class, "show"]); // Mendapatkan detail sertifikat
Route::post("edit_upload", [FormUploadController::class, "update"]); // Meng-update sertifikat
Route::post("delete_upload", [FormUploadController::class, "destroy"]); // Menghapus sertifikat

Route::post("all_bidang", [BidangController::class, "index"]);
Route::post("create_bidang", [BidangController::class, "store"]);
Route::post("show_bidang", [BidangController::class, "show"]);
Route::post("edit_bidang", [BidangController::class, "edit"]);
Route::post("delete_bidang", [BidangController::class, "destroy"]);