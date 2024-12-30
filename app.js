// Gerekli modülleri dahil et
const express = require("express");
const cors = require("cors");
const app = express();
const router = require("./router"); // Router'ı içe aktar

// Middleware
app.use(cors());
app.use(express.json());

// API router'ı kullan
app.use("/api", router); // Tüm route'ları "/api" ile başlat

// Sunucuyu başlat
app.listen(3000, () => {
    console.log("Server çalışıyor: http://localhost:3000");
});


