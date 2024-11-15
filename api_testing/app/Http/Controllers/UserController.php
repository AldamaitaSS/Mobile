<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\userModel;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $users = userModel::all();
        return $users;
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $save = new userModel;
        $save->level_id = $request->level_id;
        $save->nip = $request->nip;
        $save->nama = $request->nama;
        $save->username = $request->username;
        $save->email = $request->email;
        $save->password = Hash::make($request->password);
        $save->save();

        return "Berhasil Menyimpan Data";
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request)
    {
        $users = userModel::all()->where('id', $request->id)->first();
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request)
    {
        $users = userModel::all()->where('id', $request->id)->first();
        $users->level_id = $request->level_id;
        $users->nip = $request->nip;
        $users->nama = $request->nama;
        $users->username = $request->username;
        $users->email = $request->email;
        $users->password = Hash::make($request->password);
        $users->save();

        return "Berhasil Mengubah Data";
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {
        $del = userModel::all()->where('id', $request->id)->first();
        $del->delete();
        return "Berhasil Menghapus Data";
    }
}
