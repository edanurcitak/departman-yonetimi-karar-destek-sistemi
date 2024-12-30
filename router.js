const express = require("express");
const router = express.Router();
const cardController = require("./controller");
const calisanController = require("./controller"); // Controller dosyasını içe aktar
const ciroController = require("./controller");
const departmanController = require('./controller');
const personelAlimiController = require('./controller');


// Dashboard istatistikleri için API
router.get('/dashboard_stats', cardController.getDashboardStats);

// Çalışanlar tablosundaki verileri çekmek için API
router.get("/calisanlar", calisanController.getCalisanlar);

// Proje ciro oranları ve tahminler için API
router.get("/ciro_oranlari", ciroController.getCiroOranlari);

// Departmanlar ve başarı oranları için API endpoint
router.get("/departman", departmanController.getDepartmanlar);

// Personel alımı verileri için API
router.get('/personel_alimi', personelAlimiController.getPersonelAlimi);

module.exports = router;
