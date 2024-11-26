<?php
$servername = "localhost"; // Ganti dengan hostname database
$username = "root"; // Ganti dengan username database
$password = ""; // Ganti dengan password database
$dbname = "db_projek"; // Ganti dengan nama database yang digunakan

// Membuat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}
?>
