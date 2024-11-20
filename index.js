// index.js
console.log("Server is running...");
const express = require('express');
const app = express();
const PORT = 8000; // Atau port lain sesuai kebutuhan

app.listen(PORT, '0.0.0.0', () => {
    console.log(`Server is running on http://192.168.1.49:${PORT}`);
  });
  
const uploadRoute = require('./routes/uploadRoute');
  
app.use(express.json()); // Untuk menangani data JSON dari Flutter
app.use('/api', uploadRoute); // Tambahkan route baru untuk upload
  
app.listen(8000, () => {
  console.log('Server running on http://localhost:8000');
});
  