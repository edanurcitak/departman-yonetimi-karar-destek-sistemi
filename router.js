const express = require("express");
const router = express.Router();
const loginController = require('./controller');
const cardController = require("./controller");
const calisanController = require("./controller");
const ciroController = require("./controller");
const departmanController = require('./controller');
const personelAlimiController = require('./controller');
const sirketBasariOranlariController = require('./controller');
const projeController = require("./controller");


router.post('/login', loginController.loginFunction);

// Dashboard istatistikleri için API
router.get('/dashboard_stats', cardController.getDashboardStats);

// Çalışanlar tablosundaki verileri çekmek için API
router.get("/calisanlar", calisanController.getCalisanlar);

router.get("/projeler", projeController.getProjeler);


// Proje ciro oranları ve tahminler için API
router.get("/ciro_oranlari", ciroController.getCiroOranlari);

// Departmanlar ve başarı oranları için API endpoint
router.get("/departman", departmanController.getDepartmanlar);

router.get("/sirket-basari-oranlari", sirketBasariOranlariController.getSirketBasariOranlari);


// Personel alımı verileri için API
router.get('/personel_alimi', personelAlimiController.getPersonelAlimi);

module.exports = router;
