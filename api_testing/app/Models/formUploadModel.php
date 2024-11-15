<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class formUploadModel extends Model
{
    use HasFactory;
    protected $table = 'upload_sertifikat'; // Sesuaikan dengan nama tabel sebenarnya
    protected $primaryKey = 'sertif_id';
    protected $fillable = [
        'user_id',
        'no_sertif',
        'nama_sertif',
        'tanggal_pelaksanaan',
        'tanggal_berlaku',
        'bidang_id',
        'nama_vendor',
        'image'
    ];

    public function bidang()
    {
        return $this->belongsTo(bidangModel::class, 'bidang_id', 'bidang_id');
    }

}
