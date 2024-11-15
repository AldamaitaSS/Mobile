<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\bidangModel;

class BidangController extends Controller
{
    public function index()
    {
        $bidang = bidangModel::all();
        return $bidang;
    }

    public function show(Request $request)
    {
        $bidang = bidangModel::all()->where('id', $request->id)->first();
        return $bidang;
    }

    public function store(Request $request)
    {
        $save = new bidangModel;
        $save->bidang_kode = $request->bidang_kode;
        $save->bidang_nama = $request->bidang_nama;
        $save->save();

        return "Berhasil Menyimpan Data";
    }

    public function edit(Request $request)
    {
        $bidang = bidangModel::all()->where('id', $request->id)->first();
        $bidang->bidang_kode = $request->bidang_kode;
        $bidang->bidang_nama = $request->bidang_nama;
        $bidang->save();

        return "Berhasil Mengubah Data";
    }

    public function destroy(Request $request)
    {
        $del = bidangModel::all()->where('id', $request->id)->first();
        $del->delete();

        return "Berhasil Menghapus Data";
    }
}
