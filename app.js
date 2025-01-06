// Gerekli modülleri dahil et

const express = require("express");

const cors = require("cors");

const mysql = require("mysql"); // MySQL modülünü dahil et

const app = express();

const router = require("./router"); // Router'ı içe aktar


// Middleware

app.use(cors());

app.use(express.json());

app.use(express.static('public'));


// MySQL veritabanı bağlantısı

const connection = mysql.createConnection({

    host: '',

    user: 'root', // Veritabanı kullanıcı adınızı buraya yazın

    password: '', // Veritabanı şifrenizi buraya yazın

    database: 'kds-2023' // Veritabanı adınızı buraya yazın

});


// Veritabanı bağlantısını kontrol et

connection.connect((err) => {

    if (err) throw err;

    console.log('Veritabanına bağlndı!');

});



// API router'ı kullan

app.use("/api", router); // Tüm route'ları "/api" ile başlat

app.get('/api/sirket_basari_oranlari', (req, res) => {
    db.query('SELECT * monthly_data', (err, results) => {
        if (err) {
            return res.status(500).json({ error: err });
        }
        res.json(results);
    });
});

// Sunucuyu başlat

app.listen(3000, () => {

    console.log("Server çalışıyor: http://localhost:3000");

});