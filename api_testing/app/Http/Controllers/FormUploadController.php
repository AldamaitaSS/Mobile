<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\formUploadModel;
use Illuminate\Support\Facades\Storage;

class FormUploadController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Mengambil semua data sertifikat yang di-upload
        $uploads = formUploadModel::all();
        return response()->json($uploads, 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // Validasi input dan upload file sudah disesuaikan
        $request->validate([
            // Data yang dibutuhkan sesuai validasi
            'user_id' => 'required|integer',
            'no_sertif' => 'required|string|max:100',
            'nama_sertif' => 'required|string|max:100', 
            'tanggal_pelaksanaan' => 'required|date',
            'tanggal_berlaku' => 'required|date',
            'bidang_id' => 'required|integer',
            'nama_vendor' => 'required|string|max:100',
            'image' => 'required|file|mimes:jpg,jpeg,png,pdf|max:5120',
        ]);

        // Proses upload file
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $fileName = time() . '_' . $file->getClientOriginalName();
            $filePath = $file->storeAs('uploads', $fileName, 'public');
        } else {
            return response()->json(['error' => 'File image is required'], 400);
        }

        // Menyimpan data ke dalam tabel
        $save = new formUploadModel();
        $save->user_id = $request->user_id;
        $save->no_sertif = $request->no_sertif;
        $save->nama_sertif = $request->nama_sertif;
        $save->tanggal_pelaksanaan = $request->tanggal_pelaksanaan;
        $save->tanggal_berlaku = $request->tanggal_berlaku;
        $save->bidang_id = $request->bidang_id;
        $save->nama_vendor = $request->nama_vendor;
        $save->image = $filePath; // Menyimpan path file
        $save->save();

        return response()->json(['message' => 'Data berhasil disimpan', 'data' => $save], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        // Menampilkan data upload sertifikat berdasarkan ID
        $upload = formUploadModel::find($id);
        
        if (!$upload) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }

        return response()->json($upload, 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function edit(Request $request, $id)
    {
        // Validasi input
        $request->validate([
            'no_sertif' => 'sometimes|string|max:100',
            'nama_sertif' => 'sometimes|string|max:100',
            'tanggal_pelaksanaan' => 'sometimes|date',
            'tanggal_berlaku' => 'sometimes|date',
            'bidang_id' => 'sometimes|integer',
            'nama_vendor' => 'sometimes|string|max:100',
            'image' => 'sometimes|file|mimes:jpg,jpeg,png,pdf|max:2048',
        ]);

        $upload = formUploadModel::find($id);

        if (!$upload) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }

        // Update data
        $upload->user_id = $request->user_id ?? $upload->user_id;
        $upload->no_sertif = $request->no_sertif ?? $upload->no_sertif;
        $upload->nama_sertif = $request->nama_sertif ?? $upload->nama_sertif;
        $upload->tanggal_pelaksanaan = $request->tanggal_pelaksanaan ?? $upload->tanggal_pelaksanaan;
        $upload->tanggal_berlaku = $request->tanggal_berlaku ?? $upload->tanggal_berlaku;
        $upload->bidang_id = $request->bidang_id ?? $upload->bidang_id;
        $upload->nama_vendor = $request->nama_vendor ?? $upload->nama_vendor;

        // Update file jika ada
        if ($request->hasFile('image')) {
            // Hapus file lama
            if ($upload->image && Storage::disk('public')->exists($upload->image)) {
                Storage::disk('public')->delete($upload->image);
            }

            // Upload file baru
            $file = $request->file('image');
            $fileName = time() . '_' . $file->getClientOriginalName();
            $filePath = $file->storeAs('uploads', $fileName, 'public');
            $upload->image = $filePath;
        }

        $upload->save();

        return response()->json(['message' => 'Berhasil Mengubah Data'], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $upload = formUploadModel::find($id);

        if (!$upload) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }

        // Hapus file dari storage jika ada
        if ($upload->image && Storage::disk('public')->exists($upload->image)) {
            Storage::disk('public')->delete($upload->image);
        }

        $upload->delete();

        return response()->json(['message' => 'Berhasil Menghapus Data'], 200);
    }
}
