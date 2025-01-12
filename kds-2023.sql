-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 30 Ara 2024, 21:14:58
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `kds-2023`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `calisanlar`
--

CREATE TABLE `calisanlar` (
  `calisan_id` int(100) NOT NULL,
  `ad_soyad` varchar(255) NOT NULL,
  `departman_id` int(10) NOT NULL,
  `performans_puani` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `calisanlar`
--

INSERT INTO `calisanlar` (`calisan_id`, `ad_soyad`, `departman_id`, `performans_puani`) VALUES
(1, 'Ahmet Yılmaz', 1, 78),
(2, 'Ali Şahin', 5, 74),
(3, 'Aysun Gül', 6, 79),
(4, 'Ayşe Kaya', 8, 66),
(5, 'Cemil Kara', 1, 67),
(6, 'Cengiz Bozkurt', 8, 70),
(7, 'Derya Bal', 2, 82),
(8, 'Elif Doğan', 3, 95),
(9, 'Esra Tunç', 8, 65),
(10, 'Hatice İnce', 2, 72),
(11, 'Havva Polat', 8, 77),
(12, 'Hüseyin Güneş', 2, 80),
(13, 'Kerem Kurt', 4, 81),
(14, 'Merve Çakır', 3, 89),
(15, 'Mustafa Öz', 7, 92),
(16, 'Nurcan Er', 7, 90),
(17, 'Osman Uçar', 1, 64),
(18, 'Vedat Kaplan', 8, 87),
(19, 'Yasin Duman', 6, 84),
(20, 'Zeynep Demir', 2, 85),
(21, 'Buse Akarsu', 4, 83),
(22, 'Yasin Bal', 7, 90),
(23, 'Esra Aksoy', 6, 66),
(24, 'Selahattin Koçak', 3, 87),
(25, 'Ayla Turhan', 2, 93),
(26, 'Mert Candan', 5, 77),
(27, 'Seda Çolak', 4, 65),
(28, 'Metin Polat', 1, 74),
(29, 'Şeyma Bozkurt', 6, 96),
(30, 'Halime Doğru', 5, 98),
(31, 'Engin Alkan', 3, 68),
(32, 'Bahar Güneş', 2, 80),
(33, 'Sinan Çevik', 7, 94),
(34, 'Rabia Karadağ', 8, 88),
(35, 'Tuğçe Ekinci', 1, 99),
(36, 'Levent Sağlam', 6, 85),
(37, 'Yasemin Doğan', 5, 71),
(38, 'Fatih Altay', 2, 79),
(39, 'Hacer Yılmaz', 8, 93),
(40, 'Furkan Şahin', 7, 91),
(41, 'Serpil Kaplan', 3, 64),
(42, 'Bilal Tekin', 8, 87),
(43, 'Selda Ünal', 6, 84),
(44, 'Hasan Yıldız', 3, 72),
(45, 'Pelin Can', 7, 65),
(46, 'Hakkı Toprak', 1, 94),
(47, 'Fidan Yazıcı', 6, 97),
(48, 'Burhan Çelik', 8, 82),
(49, 'Sevgi Acar', 2, 99),
(50, 'Mehmet Karaman', 7, 70);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `departman`
--

CREATE TABLE `departman` (
  `departman_id` int(10) NOT NULL,
  `departman_adi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `departman`
--

INSERT INTO `departman` (`departman_id`, `departman_adi`) VALUES
(1, 'Web Programlama'),
(2, 'Mobil Programlama'),
(3, 'Back-End Programlama'),
(4, 'Front-End Programlama'),
(5, 'Veritabanı Yönetimi'),
(6, 'Analiz ve Test'),
(7, 'UX&UI Tasarım'),
(8, 'Siber Güvenlik');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personel_alimi`
--

CREATE TABLE `personel_alimi` (
  `yeni_personel_id` int(100) NOT NULL,
  `departman_id` int(10) NOT NULL,
  `performans_durumu` decimal(10,0) NOT NULL,
  `yeterlilik` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `personel_alimi`
--

INSERT INTO `personel_alimi` (`yeni_personel_id`, `departman_id`, `performans_durumu`, `yeterlilik`) VALUES
(1, 1, 81, 'geliştirilebilir'),
(2, 2, 83, 'geliştirilebilir'),
(3, 3, 86, 'yeterli performans'),
(4, 4, 87, 'yeterli performans'),
(5, 5, 85, 'geliştirilebilir'),
(6, 6, 83, 'geliştirilebilir'),
(7, 7, 86, 'yeterli performans'),
(8, 8, 88, 'yeterli performans');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `projeler`
--

CREATE TABLE `projeler` (
  `proje_id` int(10) NOT NULL,
  `proje_adi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `projeler`
--

INSERT INTO `projeler` (`proje_id`, `proje_adi`) VALUES
(1, 'OptikTak'),
(2, 'BİP'),
(3, 'Fizy'),
(4, 'Dergilik'),
(5, 'Paycell Kıbrıs'),
(6, 'TOGG Fizy'),
(7, 'Salla Kazan'),
(8, 'TV+'),
(9, 'Turkcell Pasaj'),
(10, 'Lifebox'),
(11, 'Game+');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `proje_ciro`
--

CREATE TABLE `proje_ciro` (
  `ciro_id` int(10) NOT NULL,
  `proje_id` int(10) NOT NULL,
  `ciro_orani` float(10,0) NOT NULL,
  `alti_ay_onceki_deger` float(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `proje_ciro`
--

INSERT INTO `proje_ciro` (`ciro_id`, `proje_id`, `ciro_orani`, `alti_ay_onceki_deger`) VALUES
(1, 1, 92, 90),
(2, 2, 68, 60),
(3, 3, 72, 70),
(4, 4, 88, 85),
(5, 5, 95, 90),
(6, 6, 93, 88),
(7, 7, 77, 75),
(8, 8, 60, 58),
(9, 9, 85, 80),
(10, 10, 90, 85),
(11, 11, 91, 87);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sirket_basari_oranlari`
--

CREATE TABLE `sirket_basari_oranlari` (
  `basari_id` int(20) NOT NULL,
  `departman_id` int(10) NOT NULL,
  `ocak` varchar(255) DEFAULT NULL,
  `subat` varchar(255) DEFAULT NULL,
  `mart` varchar(255) DEFAULT NULL,
  `nisan` varchar(255) DEFAULT NULL,
  `mayis` varchar(255) DEFAULT NULL,
  `haziran` varchar(255) DEFAULT NULL,
  `temmuz` varchar(255) DEFAULT NULL,
  `agustos` varchar(255) DEFAULT NULL,
  `eylul` varchar(255) DEFAULT NULL,
  `ekim` varchar(255) DEFAULT NULL,
  `kasim` varchar(255) DEFAULT NULL,
  `aralik` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sirket_basari_oranlari`
--

INSERT INTO `sirket_basari_oranlari` (`basari_id`, `departman_id`, `ocak`, `subat`, `mart`, `nisan`, `mayis`, `haziran`, `temmuz`, `agustos`, `eylul`, `ekim`, `kasim`, `aralik`) VALUES
(1, 1, '88', '75', '96', '54', '61', '87', '90', '83', '92', '80', '85', '78'),
(2, 2, '67', '85', '91', '92', '72', '82', '95', '88', '81', '93', '80', '69'),
(3, 3, '80', '83', '90', '91', '85', '88', '76', '92', '89', '84', '87', '91'),
(4, 4, '87', '79', '95', '88', '84', '85', '91', '93', '91', '81', '82', '87'),
(5, 5, '90', '93', '80', '89', '92', '88', '81', '84', '75', '79', '80', '88'),
(6, 6, '77', '80', '83', '78', '81', '89', '92', '85', '86', '84', '75', '91'),
(7, 7, '85', '82', '94', '78', '79', '92', '88', '91', '84', '81', '88', '90'),
(8, 8, '91', '85', '92', '81', '83', '89', '85', '80', '90', '88', '92', '95');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `calisanlar`
--
ALTER TABLE `calisanlar`
  ADD PRIMARY KEY (`calisan_id`),
  ADD KEY `departman_id` (`departman_id`);

--
-- Tablo için indeksler `departman`
--
ALTER TABLE `departman`
  ADD PRIMARY KEY (`departman_id`);

--
-- Tablo için indeksler `personel_alimi`
--
ALTER TABLE `personel_alimi`
  ADD PRIMARY KEY (`yeni_personel_id`),
  ADD KEY `departman_id` (`departman_id`);

--
-- Tablo için indeksler `projeler`
--
ALTER TABLE `projeler`
  ADD PRIMARY KEY (`proje_id`);

--
-- Tablo için indeksler `proje_ciro`
--
ALTER TABLE `proje_ciro`
  ADD PRIMARY KEY (`ciro_id`),
  ADD KEY `proje_id` (`proje_id`);

--
-- Tablo için indeksler `sirket_basari_oranlari`
--
ALTER TABLE `sirket_basari_oranlari`
  ADD PRIMARY KEY (`basari_id`),
  ADD KEY `departman_id` (`departman_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `calisanlar`
--
ALTER TABLE `calisanlar`
  MODIFY `calisan_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Tablo için AUTO_INCREMENT değeri `departman`
--
ALTER TABLE `departman`
  MODIFY `departman_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `personel_alimi`
--
ALTER TABLE `personel_alimi`
  MODIFY `yeni_personel_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `projeler`
--
ALTER TABLE `projeler`
  MODIFY `proje_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `proje_ciro`
--
ALTER TABLE `proje_ciro`
  MODIFY `ciro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `sirket_basari_oranlari`
--
ALTER TABLE `sirket_basari_oranlari`
  MODIFY `basari_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `calisanlar`
--
ALTER TABLE `calisanlar`
  ADD CONSTRAINT `calisanlar_ibfk_1` FOREIGN KEY (`departman_id`) REFERENCES `departman` (`departman_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `personel_alimi`
--
ALTER TABLE `personel_alimi`
  ADD CONSTRAINT `personel_alimi_ibfk_1` FOREIGN KEY (`departman_id`) REFERENCES `departman` (`departman_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `proje_ciro`
--
ALTER TABLE `proje_ciro`
  ADD CONSTRAINT `proje_ciro_ibfk_1` FOREIGN KEY (`proje_id`) REFERENCES `projeler` (`proje_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `sirket_basari_oranlari`
--
ALTER TABLE `sirket_basari_oranlari`
  ADD CONSTRAINT `sirket_basari_oranlari_ibfk_1` FOREIGN KEY (`departman_id`) REFERENCES `departman` (`departman_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
