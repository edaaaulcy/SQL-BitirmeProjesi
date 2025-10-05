USE master;
GO


ALTER DATABASE [AlýþveriþPlatformuDB] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO


DROP DATABASE [AlýþveriþPlatformuDB];
GO


CREATE DATABASE [AlýþveriþPlatformuDB];
GO

USE [AlýþveriþPlatformuDB];
GO

IF OBJECT_ID('Siparis_Detay', 'U') IS NOT NULL DROP TABLE Siparis_Detay;
IF OBJECT_ID('Siparis', 'U') IS NOT NULL DROP TABLE Siparis;
IF OBJECT_ID('Urun', 'U') IS NOT NULL DROP TABLE Urun;
IF OBJECT_ID('Satici', 'U') IS NOT NULL DROP TABLE Satici;
IF OBJECT_ID('Kategori', 'U') IS NOT NULL DROP TABLE Kategori;
IF OBJECT_ID('Musteri', 'U') IS NOT NULL DROP TABLE Musteri;

CREATE TABLE Musteri (
    id INT IDENTITY PRIMARY KEY,
    ad NVARCHAR(50) NOT NULL,
    soyad NVARCHAR(50) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    sehir NVARCHAR(50),
    kayit_tarihi DATE DEFAULT GETDATE()
);

CREATE TABLE Kategori (
    id INT IDENTITY PRIMARY KEY,
    ad NVARCHAR(50) NOT NULL
);

CREATE TABLE Satici (
    id INT IDENTITY PRIMARY KEY,
    ad NVARCHAR(100) NOT NULL,
    adres NVARCHAR(200)
);

CREATE TABLE Urun (
    id INT IDENTITY PRIMARY KEY,
    ad NVARCHAR(100) NOT NULL,
    fiyat DECIMAL(10,2) NOT NULL,
    stok INT NOT NULL,
    kategori_id INT FOREIGN KEY REFERENCES Kategori(id),
    satici_id INT FOREIGN KEY REFERENCES Satici(id)
);

CREATE TABLE Siparis (
    id INT IDENTITY PRIMARY KEY,
    musteri_id INT FOREIGN KEY REFERENCES Musteri(id),
    tarih DATE DEFAULT GETDATE(),
    toplam_tutar DECIMAL(10,2),
    odeme_turu NVARCHAR(50)
);

CREATE TABLE Siparis_Detay (
    id INT IDENTITY PRIMARY KEY,
    siparis_id INT FOREIGN KEY REFERENCES Siparis(id),
    urun_id INT FOREIGN KEY REFERENCES Urun(id),
    adet INT NOT NULL,
    fiyat DECIMAL(10,2) NOT NULL
);
GO

INSERT INTO Kategori (ad) VALUES ('Elektronik');
INSERT INTO Kategori (ad) VALUES ('Giyim');
INSERT INTO Kategori (ad) VALUES ('Kitap');
INSERT INTO Kategori (ad) VALUES ('Ev');
INSERT INTO Kategori (ad) VALUES ('Oyuncak');

INSERT INTO Satici (ad, adres) VALUES ('TeknoMarket', 'Antalya');
INSERT INTO Satici (ad, adres) VALUES ('ModaDünyasý', 'Ankara');
INSERT INTO Satici (ad, adres) VALUES ('Kitapçý', 'Antalya');
INSERT INTO Satici (ad, adres) VALUES ('EvTrend', 'Bursa');
INSERT INTO Satici (ad, adres) VALUES ('ToyShop', 'Adana');

INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Ayþe', 'Aydýn', 'ayþe1@mail.com', 'Konya');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Murat', 'Yýlmaz', 'murat2@mail.com', 'Ýzmir');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Elif', 'Yýldýz', 'elif3@mail.com', 'Bursa');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Alya', 'Kaplan', 'ayþe4@mail.com', 'Konya');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Hasan', 'Yýlmaz', 'hasan5@mail.com', 'Antalya');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Murat', 'Kaplan', 'murat6@mail.com', 'Ýstanbul');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Hasan', 'Öztürk', 'hasan7@mail.com', 'Bursa');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Aslý', 'Çakýr', 'mehmet8@mail.com', 'Adana');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Hilal', 'Bayrak', 'hasan9@mail.com', 'Ýzmir');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Hasan', 'Demir', 'hasan10@mail.com', 'Ýzmir');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Ezgi', 'Yýldýz', 'mehmet11@mail.com', 'Antalya');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Emine', 'Çelik', 'emine12@mail.com', 'Ýzmir');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Hasan', 'Öztürk', 'hasan13@mail.com', 'Adana');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Mehmet', 'Yýldýz', 'mehmet14@mail.com', 'Adana');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Emine', 'Þahin', 'emine15@mail.com', 'Adana');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Ali', 'Çelik', 'ali16@mail.com', 'Adana');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Hasan', 'Öztürk', 'hasan17@mail.com', 'Bursa');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Ali', 'Yýldýz', 'ali18@mail.com', 'Ýstanbul');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Ali', 'Þahin', 'ali19@mail.com', 'Adana');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Mehmet', 'Demir', 'mehmet20@mail.com', 'Adana');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Fatma', 'Koç', 'fatma21@mail.com', 'Ankara');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Ali', 'Çelik', 'ali22@mail.com', 'Adana');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Ahmet', 'Kaplan', 'ahmet23@mail.com', 'Adana');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Ayþe', 'Kaya', 'ayþe24@mail.com', 'Ýstanbul');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Zeynep', 'Kaya', 'zeynep25@mail.com', 'Bursa');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Mehmet', 'Çelik', 'mehmet26@mail.com', 'Adana');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Zeynep', 'Kaya', 'zeynep27@mail.com', 'Ankara');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Murat', 'Öztürk', 'murat28@mail.com', 'Konya');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Emine', 'Demir', 'emine29@mail.com', 'Ýstanbul');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Murat', 'Yýlmaz', 'murat30@mail.com', 'Ýstanbul');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Ali', 'Çelik', 'ali31@mail.com', 'Adana');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Hasan', 'Yýlmaz', 'hasan32@mail.com', 'Ýstanbul');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Mehmet', 'Aydýn', 'mehmet33@mail.com', 'Bursa');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Ayþe', 'Öztürk', 'ayþe34@mail.com', 'Adana');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Hasan', 'Karakoç', 'hasan35@mail.com', 'Adana');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Emine', 'Þahin', 'emine36@mail.com', 'Bursa');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Ali', 'Aydýn', 'ali37@mail.com', 'Antalya');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Mehmet', 'Yýlmaz', 'mehmet38@mail.com', 'Ýzmir');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Elif', 'Þahin', 'elif39@mail.com', 'Adana');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Ayþe', 'Þahin', 'ayþe40@mail.com', 'Konya');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Mehmet', 'Özçelik', 'mehmet41@mail.com', 'Adana');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Melike', 'Kaya', 'mehmet42@mail.com', 'Ýzmir');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Hasan', 'Öztürk', 'hasan43@mail.com', 'Ankara');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Ayþe', 'Koç', 'ayþe44@mail.com', 'Antalya');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Murat', 'Öztürk', 'murat45@mail.com', 'Ýstanbul');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Merve', 'Þahin', 'mehmet46@mail.com', 'Ýzmir');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Elif', 'Aydýn', 'elif47@mail.com', 'Konya');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Emine', 'Çelik', 'emine48@mail.com', 'Ankara');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Hakan', 'Þahin', 'hasan49@mail.com', 'Antalya');
INSERT INTO Musteri (ad, soyad, email, sehir) VALUES ('Mehmet', 'Koç', 'mehmet50@mail.com', 'Konya');

INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun1', 3773, 17, 4, 1);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun2', 15609, 119, 1, 2);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun3', 1989, 87, 4, 4);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun4', 8973, 84, 3, 1);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun5', 3821, 194, 5, 1);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun6', 784, 16, 1, 4);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun7', 110, 117, 5, 3);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun8', 14644, 160, 5, 3);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun9', 684, 41, 3, 4);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun10', 5561, 104, 1, 5);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun11', 2326, 32, 5, 2);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun12', 15175, 112, 2, 5);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun13', 12323, 154, 4, 1);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun14', 17716, 143, 5, 4);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun15', 10668, 143, 3, 2);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun16', 19444, 125, 2, 2);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun17', 14781, 183, 4, 3);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun18', 15431, 87, 4, 4);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun19', 3837, 154, 2, 4);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun20', 19822, 161, 3, 1);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun21', 10930, 186, 2, 4);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun22', 17684, 67, 1, 3);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun23', 3917, 171, 5, 2);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun24', 14269, 40, 2, 1);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun25', 15500, 51, 1, 3);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun26', 13382, 80, 2, 2);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun27', 19900, 88, 3, 5);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun28', 2882, 145, 3, 1);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun29', 114, 106, 4, 3);
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES ('Urun30', 14909, 74, 3, 5);

INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (12, 1690, 'Kapýda Ödeme');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (10, 1284, 'Havale');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (10, 4580, 'Havale');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (23, 807, 'Kredi Kartý');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (25, 1171, 'Kapýda Ödeme');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (25, 4274, 'Kredi Kartý');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (37, 1265, 'Kredi Kartý');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (16, 3622, 'Kredi Kartý');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (18, 568, 'Kredi Kartý');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (42, 403, 'Kapýda Ödeme');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (10, 2997, 'Kapýda Ödeme');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (35, 1406, 'Havale');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (18, 1488, 'Kapýda Ödeme');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (30, 3819, 'Kredi Kartý');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (41, 2200, 'Kredi Kartý');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (22, 564, 'Kapýda Ödeme');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (19, 2610, 'Kapýda Ödeme');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (29, 2133, 'Havale');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (40, 3317, 'Havale');
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES (10, 601, 'Kapýda Ödeme');

INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (1, 27, 4, 1330);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (1, 8, 1, 543);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (2, 26, 4, 304);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (2, 4, 1, 431);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (2, 17, 2, 1831);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (3, 5, 4, 640);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (3, 16, 2, 1534);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (3, 24, 1, 1901);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (4, 5, 4, 1107);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (5, 8, 5, 393);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (5, 8, 4, 591);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (5, 26, 5, 1945);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (6, 20, 2, 1173);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (6, 18, 4, 963);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (7, 26, 5, 421);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (7, 24, 1, 1190);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (8, 13, 4, 237);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (8, 9, 5, 1188);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (8, 28, 2, 809);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (9, 3, 3, 690);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (9, 23, 2, 456);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (9, 19, 3, 1299);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (10, 19, 2, 1751);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (10, 30, 1, 373);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (10, 23, 2, 808);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (11, 6, 5, 1921);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (11, 26, 5, 1827);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (11, 27, 1, 966);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (12, 25, 4, 1376);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (12, 27, 4, 777);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (13, 17, 2, 283);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (13, 1, 5, 676);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (13, 13, 3, 769);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (14, 6, 5, 1145);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (14, 7, 4, 559);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (14, 18, 5, 1793);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (15, 3, 4, 1143);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (16, 7, 3, 1836);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (16, 27, 1, 371);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (16, 26, 5, 1189);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (17, 14, 5, 1768);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (17, 8, 2, 1907);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (17, 4, 4, 454);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (18, 11, 1, 164);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (18, 1, 1, 1335);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (19, 23, 5, 1400);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (19, 6, 3, 959);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (19, 14, 1, 1236);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (20, 3, 1, 1615);
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES (20, 26, 3, 1919);

GO


SELECT TOP 5 m.ad, m.soyad, COUNT(s.id) AS siparis_sayisi
FROM MUsteri m
JOIN Siparis s ON m.id = s.musteri_id
GROUP BY m.ad, m.soyad
ORDER BY siparis_sayisi DESC;

SELECT u.ad, SUM(sd.adet) AS toplam_adet
FROM Urun u
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY u.ad
ORDER BY toplam_adet DESC;

SELECT s.ad, SUM(sd.fiyat * sd.adet) AS toplam_ciro
FROM Satici s
JOIN Urun u ON s.id = u.satici_id
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY s.ad
ORDER BY toplam_ciro DESC;

SELECT sehir, COUNT(*) AS musteri_sayisi
FROM Musteri
GROUP BY sehir;

SELECT k.ad AS kategori, SUM(sd.fiyat * sd.adet) AS toplam_satis
FROM Kategori k
JOIN Urun u ON k.id = u.kategori_id
JOIN Siparis_Detay sd ON u.id = sd.urun_id
Group BY k.ad;

SELECT 
    FORMAT(tarih, 'yyyy-MM') AS ay,
    COUNT(*) AS siparis_sayisi
FROM Siparis
GROUP BY FORMAT(tarih, 'yyyy-MM')
ORDER BY ay;

SELECT m.ad, m.soyad
FROM Musteri m
LEFT JOIN Siparis s ON m.id = s.musteri_id
WHERE s.id IS NULL;

SELECT u.ad AS urun_adi
FROM Urun u
LEFT JOIN Siparis_Detay sd ON u.id = sd.urun_id
WHERE sd.urun_id IS NULL;

SELECT *
FROM Siparis
WHERE toplam_tutar > (SELECT AVG(toplam_tutar) FROM Siparis);


SELECT TOP 3 k.ad, SUM(sd.fiyat * sd.adet) AS toplam_kazanc
FROM Kategori k
JOIN Urun u ON k.id = u.kategori_id
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY k.ad
ORDER BY toplam_kazanc DESC;

