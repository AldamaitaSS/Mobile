<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class userModel extends Authenticatable
{
    use HasFactory;
    use HasApiTokens, Notifiable;
    protected $table = 'm_user'; // Sesuaikan dengan nama tabel sebenarnya
    protected $primaryKey = 'user_id';
    protected $fillable = [
        'level_id',
        'nip',
        'nama',
        'username',
        'email',
        'password',
    ];
}
