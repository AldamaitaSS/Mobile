<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\api_data;

class APIController extends Controller
{
    public function index()
    {
        $data = api_data::all();
        return $data;
    }

    public function show(Request $request)
    {
        $data = api_data::all()->where('id', $request->id)->first();
        return $data;
    }

    public function store(Request $request)
    {
        $save = new api_data;
        $save->name = $request->name;
        $save->bank = $request->bank;
        $save->alamat = $request->alamat;
        $save->save();

        return "Berhasil Menyimpan Data";
    }

    public function edit(Request $request)
    {
        $data = api_data::all()->where('id', $request->id)->first();
        $data->name = $request->name;
        $data->bank = $request->bank;
        $data->alamat = $request->alamat;
        $data->save();

        return "Berhasil Mengubah Data";
    }

    public function destroy(Request $request)
    {
        $del = api_data::all()->where('id', $request->id)->first();
        $del->delete();

        return "Berhasil Menghapus Data";
    }
}
