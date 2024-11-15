<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class bidangModel extends Model
{
    use HasFactory;
    protected $table = 'm_bidang'; // Sesuaikan dengan nama tabel sebenarnya
    protected $primaryKey = 'bidang_id';
    protected $fillable = [
        'bidang_kode',
        'bidang_nama'
    ];
}
