const db = require("./db_connect"); // Veritabanı bağlantısını içe aktar

// AHP katsayıları
const ahpKatsayilari = {
    OptikTak: 1.1,
    BİP: 0.8,
    Fizy: 0.9,
    Dergilik: 1.05,
    Paycell_Kibris: 1.2,
    TOGG_Fizy: 1.15,
    Salla_Kazan: 0.85,
    TV_plus: 0.7,
    Turkcell_Pasaj: 1.0,
    Lifebox: 1.1,
    Game_Plus: 1.05
};

exports.loginFunction = (req, res) => {
    const { username, password } = req.body;  // Formdan gelen kullanıcı adı ve şifre

    // Sabit kullanıcı adı ve şifre (örneğin admin/admin)
    const validUsername = 'edanurcitak';
    const validPassword = 'edanur1234';

    console.log('Gelen Kullanıcı Adı:', username);
    console.log('Gelen Şifre:', password);

    // Kullanıcı adı ve şifreyi kontrol ediyoruz
    if (username === validUsername && password === validPassword) {
        console.log('Başarılı Giriş!');
        res.json({ success: true });
    } else {
        console.log('Başarısız Giriş!');
        res.status(401).json({ message: 'Kullanıcı adı veya şifre yanlış.' });
    }
};



// Dashboard istatistiklerini almak için fonksiyon
exports.getDashboardStats = (req, res) => {
    const query = `
        SELECT 
            (SELECT COUNT(*) FROM calisanlar) AS toplam_calisan,
            (SELECT COUNT(*) FROM departman) AS toplam_departman;
    `;

    db.query(query, (err, results) => {
        if (err) {
            console.error("Veritabanı hatası:", err);
            res.status(500).send("Veritabanı hatası");
        } else {
            res.json(results[0]); // Sonuçları JSON olarak döndürüyoruz
        }
    });
};

// Çalışanlar tablosundaki verileri çekmek için fonksiyon
exports.getCalisanlar = (req, res) => {
    const query = `
        SELECT 
            c.ad_soyad AS adSoyad, 
            d.departman_adi AS departman, 
            c.performans_puani AS performansPuani
        FROM calisanlar c
        JOIN departman d ON c.departman_id = d.departman_id
    `;

    db.query(query, (err, results) => {
        if (err) {
            console.error("Veritabanı hatası:", err);
            res.status(500).send("Veritabanı hatası");
        } else {
            res.json(results); // Sonuçları JSON formatında döndür
        }
    });

    console.log("GET /api/calisanlar endpoint çağrıldı");
};

exports.getSirketBasariOranlari = (req, res) => {
    const query = `
        SELECT 
           p.ocak,
           p.subat,
           p.mart,
           p.nisan,
           p.mayis,
           p.haziran,
           p.temmuz,
           p.agustos,
           p.eylul,
           p.ekim,
           p.kasim,
           p.aralik
        FROM sirket_basari_oranlari p
        `;
    db.query(query, (err, results) => {
        if (err) {
            console.error("Veritabanı hatası:", err);
            res.status(500).send("Veritabanı hatası");
        }else {
            res.json(results);
        }
    })
}

exports.getProjeler = (req, res) => {
    const query = `
        SELECT 
           p.proje_id,
           p.proje_adi
        FROM projeler p
        `;
    db.query(query, (err, results) => {
        if (err) {
            console.error("Veritabanı hatası:", err);
            res.status(500).send("Veritabanı hatası");
        }else {
            res.json(results);
        }
    })
}



// Projelerle ilgili verileri almak ve sonraki tahminleri hesaplamak için fonksiyon
exports.getCiroOranlari = (req, res) => {
    const query = `
        SELECT 
            p.proje_id, 
            p.proje_adi, 
            c.ciro_orani, 
            c.alti_ay_onceki_deger
        FROM projeler p
        JOIN proje_ciro c ON p.proje_id = c.proje_id
    `;

    db.query(query, (err, results) => {
        if (err) {
            console.error("Veritabanı hatası:", err);
            res.status(500).send("Veritabanı hatası");
        } else {
            // 6 ay sonraki tahminleri hesapla
            const ciroOranlari = results.map((row) => {
                const projeAdi = row.proje_adi;
                const ciroOrani = row.ciro_orani;
                const altiAyOncekiDeger = row.alti_ay_onceki_deger;

                // AHP katsayısını al
                const katsayi = ahpKatsayilari[projeAdi] || 1;

                // 6 ay sonraki tahmin hesaplama
                const tahmin = ciroOrani * katsayi;

                return {
                    proje_id: row.proje_id,
                    proje_adi: row.proje_adi,
                    ciro_orani: ciroOrani,
                    alti_ay_onceki_deger: altiAyOncekiDeger,
                    tahmin_6_ay_sonra: tahmin.toFixed(2) // 6 ay sonraki tahmini iki ondalıklı sayıya yuvarla
                };
            });

            res.json(ciroOranlari); // Sonuçları JSON formatında döndür
        }
    });

    console.log("GET /api/ciro_oranlari endpoint çağrıldı");
};

// Departmanlar ve başarı oranlarını almak için fonksiyon
exports.getDepartmanlar = (req, res) => {
    const query = `
        SELECT 
            d.departman_adi, 
            p.performans_durumu AS basari_orani
        FROM departman d
        LEFT JOIN personel_alimi p ON d.departman_id = p.departman_id
    `;

    db.query(query, (err, results) => {
        if (err) {
            console.error("Veritabanı hatası:", err);
            res.status(500).send("Veritabanı hatası");
        } else {
            // Verileri JSON formatında frontend'e gönderiyoruz
            res.json(results); 
        }
    });

    console.log("GET /api/departman endpoint çağrıldı");
};

exports.getPersonelAlimi = (req, res) => {
    const query = `
        SELECT 
            d.departman_adi, 
            COUNT(c.calisan_id) AS mevcut_personel_sayisi, 
            p.performans_durumu, 
            p.yeterlilik
        FROM departman d
        LEFT JOIN personel_alimi p ON d.departman_id = p.departman_id
        LEFT JOIN calisanlar c ON d.departman_id = c.departman_id
        GROUP BY d.departman_adi, p.performans_durumu, p.yeterlilik
        ORDER BY d.departman_adi;
    `;

    db.query(query, (err, results) => {
        if (err) {
            console.error("Veritabanı hatası:", err);
            res.status(500).send("Veritabanı hatası");
        } else {
            res.json(results); // Verileri JSON formatında gönderiyoruz
        }
    });

    console.log("GET /api/personel_alimi endpoint çağırıldı.");
};
