--tworzenie nowej bazy danych:
CREATE DATABASE db_glazura_Gniezno;

--aktywowanie bazy:
USE db_glazura_Gniezno;

--tworzenie tabeli tbl_klienci:
CREATE TABLE tbl_klienci
(	id_klienta INT IDENTITY (1,1) CONSTRAINT pkKlienci PRIMARY KEY,
	imie VARCHAR(30),
	nazwisko VARCHAR(40),
	nazwa_firmy VARCHAR(50),
	NIP CHAR(10),
	ulica VARCHAR(50) NOT NULL,
	kod_pocztowy CHAR(6)NOT NULL,
	miasto VARCHAR(30) NOT NULL,
	telefon VARCHAR(15) NOT NULL
);
	
--tworzenie tabeli tbl_faktury:
CREATE TABLE tbl_faktury
(
	id_faktury INT IDENTITY (1,1) CONSTRAINT pkFaktury PRIMARY KEY,
	numer_faktury VARCHAR(10) NOT NULL,
	data_wystawienia SMALLDATETIME NOT NULL,
	data_platnosci SMALLDATETIME NOT NULL,
	klient_id INT CONSTRAINT fkFakturyKlienci FOREIGN KEY REFERENCES tbl_klienci,
	forma_platnosci VARCHAR(10)
);

--tworzenie tabeli tbl_producent:
CREATE TABLE tbl_producent
(
	id_producenta INT IDENTITY (1,1) CONSTRAINT pkProducenci PRIMARY KEY,
	nazwa_producenta VARCHAR(20) NOT NULL,
	kraj VARCHAR(20) NOT NULL DEFAULT 'Polska'
);

--tworzenie tabeli tbl_plytki:
CREATE TABLE tbl_plytki
(
	id_plytki INT IDENTITY (1,1) CONSTRAINT pkPlytki PRIMARY KEY,
	nazwa_plytki VARCHAR(50) NOT NULL,
	gatunek VARCHAR(10) NOT NULL,
	producent_id INT CONSTRAINT fkPlytkiProducent FOREIGN KEY REFERENCES tbl_producent, 
	cena_jednostkowa_netto DECIMAL(5,2)
);

--tworzenie tabeli tbl_pozycje_faktur:
CREATE TABLE tbl_pozycje_faktur
(
	id_pozycji_faktury INT IDENTITY (1,1) CONSTRAINT pkPozycjeFaktur PRIMARY KEY,
	faktura_id INT CONSTRAINT fkPozycjeFakturFaktury FOREIGN KEY REFERENCES tbl_faktury,
	plytka_id INT CONSTRAINT fkPozycjeFakturPlytka FOREIGN KEY REFERENCES tbl_plytki,
	ilosc DECIMAL (6,3)
);

--dodawanie danych osób prywatnych do tabeli tbl_klienci:
INSERT INTO tbl_klienci(imie, nazwisko, ulica, kod_pocztowy, miasto, telefon)
VALUES 
		('Kalina', 'Bednarska', 'Chabrowa 5', '31-855', 'Chorzów', '600849725'),
		('Wilhelm', 'Kozak', 'Rzemieniewicka 13/1', '81-696', 'Bia³ystok', '608978145'),
		('Maciej', 'Sowa', '¯ytnia 24', '92-966', 'Wroc³aw', '775744810'),
		('Zbigniew', 'Borkowski', 'Akacjowa 99', '07-110', 'Suwa³ki', '617441710'),
		('Izabella', 'Filipek', 'Poznañska 124', '62-200', 'Gniezno', '530599825'),
		('Brygida', 'Wrona', 'Mod³owa 68', '80-353', 'Toruñ', '857481059'),
		('Hanna', 'Krupa', 'Kiliñskiego 33', '77-616', 'Elbl¹g', '694772452'), 
		('Viktor', 'Jankowski', 'Szkolna 56/8', '80-353', 'Toruñ', '645717254'), 
		('Felicja', 'Czarnecka', 'Strzelecka 1', '86-360', 'Leszno', '952300127');


--dodawanie danych firm do tabeli tbl_klienci:
INSERT INTO tbl_klienci(nazwa_firmy, NIP, ulica, kod_pocztowy, miasto, telefon)
VALUES
		('K-3 Wnêtrza', '8249711730', 'Grunwaldzka 1', '41-562', 'Kielce', '838278465'),
		('Sklep Wielobran¿owy MODA', '2250680037', 'Kasztanowa 104', '37-563', 'Gdañsk', '893196721'),
		('K-Domek Jan Wielki', '2289335275', 'Przedmiejska 1B', '74-811', 'Ostro³êka', '735477842'),
		('GERTAS Jaworzono Sp. z o.o.', '6359260019', 'Hebanowa 265', '75-410', 'Jaworzno', '556880364'),
		('Gospodarstwo Rolne WITEX', '8794625800', 'Zimowa 11', '72-680', 'Gdañsk', '715135376'),
		('Wspólnota Mieszkaniowa Nieruchomoœci', '3711590003', 'Weso³a 96', '62-200', 'Gniezno', '712908694'),
		('Zak³ad Ogólnobudowlany MIREK', '4454973670', 'Ludowa 2', '87-129', 'Gorzów Wielkopolski', '674561720'),
		('PHU BHP Marek Sek', '6425400620', 'Cytrynowa 12', '61-602', 'Poznañ', '812924164'),
		('STUDY HOME Sp. z o.o.', '2625374166', 'Wrzosowa 18', '62-240', 'Trzemeszno', '690965651'),
		('Remonty.pl', '5585957761', 'Wrzesiñska 25/3', '62-200', 'Gniezno', '771825433'),
		('BUD-EX', '4457804896', 'Obórka 9', '62-200', 'Gniezno', '495570828'),
		('Werner Budowy Sp. z o.o.', '8432736396', 'Kasztanowa 5C', '61-602', 'Poznañ', '599024002'),
		('Usu³gi remontowe Szalek', '9842681381', 'Sienkiewicza 7', '62-300', 'Wrzeœnia', '573823781'),
		('AUTO-HANDEL Kowalski', '1180247670', 'Modliszewsko 30/1', '62-200', 'Gniezno', '698155242'),
		('Archi-Remo', '8857690990', 'Ogrodowa 47', '62-230', 'Witkowo', '710825290'),
		('MAR-GNI Us³ugi remontowe', '1619501033', 'Wawrzyñca 10/2A', '62-200', 'Gniezno', '692217255'),
		('Nieruchomoœci Gniezno', '711405717', 'Budowlanych 11B/2', '62-200', 'Gniezno', '919186275'),
		('Remonty24h', '2497975605', 'Klasztorna 31', '62-018', 'Swarzêdz', '612425378'),
		('Dach-Budex', '9119983560', 'Podmiejska 3C', '62-200', 'Gniezno', '739150931'),
		('Domex', '5823955497', 'M³ynarska 100', '62-300', 'Wrzeœnia', '775523396'),
		('PEP-BUD', '3016239350', 'Lipowa 10', '38-232', '£ódŸ', '929947689');

--wyœwietlenie wszystkich danych w tabeli tbl_klienci:
SELECT * FROM tbl_klienci;

--dodawanie danych do tabeli tbl_faktury: 
INSERT INTO tbl_faktury(numer_faktury, data_wystawienia, data_platnosci, klient_id, forma_platnosci)
VALUES
		('FS 1/2023', '2023-01-07', '2023-01-07', '10', 'gotówka'),
		('FS 2/2023', '2023-01-08', '2023-01-08', '20', 'gotówka'),
		('FS 3/2023', '2023-01-09', '2023-01-09', '19', 'gotówka'),
		('FS 4/2023', '2023-01-10', '2023-01-10', '26', 'gotówka'),
		('FS 5/2023', '2023-01-11', '2023-01-11', '19', 'gotówka'),
		('FS 6/2023', '2023-01-12', '2023-01-12', '27', 'gotówka'),
		('FS 7/2023', '2023-01-13', '2023-01-15', '26' , 'przelew'),
		('FS 8/2023', '2023-01-14', '2023-01-24', '17', 'przelew'),
		('FS 9/2023', '2023-01-15', '2023-01-15', '29', 'gotówka'),
		('FS 10/2023', '2023-01-16', '2023-01-26', '10', 'przelew'),
		('FS 11/2023', '2023-01-17', '2023-01-17', '12', 'gotówka'),
		('FS 12/2023', '2023-01-18', '2023-01-18', '19', 'gotówka'),
		('FS 13/2023', '2023-01-19', '2023-01-19', '23', 'gotówka'),
		('FS 14/2023', '2023-01-20', '2023-01-20', '11', 'gotówka'),
		('FS 15/2023', '2023-01-21', '2023-01-21', '16', 'gotówka'),
		('FS 16/2023', '2023-01-22', '2023-01-22', '16', 'gotówka'),
		('FS 17/2023', '2023-01-23', '2023-01-23', '19', 'gotówka'),
		('FS 18/2023', '2023-01-24', '2023-01-27', '26', 'przelew'),
		('FS 19/2023', '2023-01-25', '2023-01-25', '10', 'gotówka'),
		('FS 20/2023', '2023-01-26', '2023-01-26', '15', 'gotówka'),
		('FS 21/2023', '2023-01-27', '2023-01-27', '21', 'gotówka'),
		('FS 22/2023', '2023-01-28', '2023-01-31', '19', 'przelew'),
		('FS 23/2023', '2023-01-29', '2023-01-29', '26', 'karta'),
		('FS 24/2023', '2023-01-30', '2023-01-30', '27', 'gotówka'),
		('FS 25/2023', '2023-01-31', '2023-01-31', '2', 'karta'),
		('FS 26/2023', '2023-02-01', '2023-02-01', '4', 'gotówka'),
		('FS 27/2023', '2023-02-02', '2023-02-02', '9', 'gotówka'),
		('FS 28/2023', '2023-02-03', '2023-02-03', '14', 'gotówka'),
		('FS 29/2023', '2023-02-04', '2023-02-16', '3', 'przelew'),
		('FS 30/2023', '2023-02-05', '2023-02-05', '21', 'przelew'),
		('FS 31/2023', '2023-02-06', '2023-02-06', '10', 'gotówka'),
		('FS 32/2023', '2023-02-07', '2023-02-07', '16', 'gotówka'),
		('FS 33/2023', '2023-02-08', '2023-02-08', '24', 'gotówka'),
		('FS 34/2023', '2023-02-09', '2023-02-20', '7', 'przelew'),
		('FS 35/2023', '2023-02-10', '2023-02-10', '13', 'gotówka'),
		('FS 36/2023', '2023-02-11', '2023-02-12', '27', 'przelew'),
		('FS 37/2023', '2023-02-12', '2023-02-12', '26', 'gotówka'),
		('FS 38/2023', '2023-02-13', '2023-02-18', '19', 'przelew'),
		('FS 39/2023', '2023-02-14', '2023-02-14', '19', 'gotówka'),
		('FS 40/2023', '2023-02-15', '2023-02-15', '30', 'gotówka'),
		('FS 41/2023', '2023-02-16', '2023-02-18', '27', 'przelew'),
		('FS 42/2023', '2023-02-17', '2023-02-17', '10', 'gotówka'),
		('FS 43/2023', '2023-02-18', '2023-02-18', '19', 'gotówka'),
		('FS 44/2023', '2023-02-19', '2023-02-19', '29', 'gotówka'),
		('FS 45/2023', '2023-02-20', '2023-02-20', '25', 'gotówka'),
		('FS 46/2023', '2023-02-21', '2023-02-23', '18', 'przelew'),
		('FS 47/2023', '2023-02-22', '2023-02-22', '1', 'gotówka'),
		('FS 48/2023', '2023-02-23', '2023-02-27', '10', 'przelew'),
		('FS 49/2023', '2023-02-24', '2023-02-24', '7', 'gotówka'),
		('FS 50/2023', '2023-02-25', '2023-02-25', '26', 'karta'),
		('FS 51/2023', '2023-02-26', '2023-02-28', '15', 'przelew'),
		('FS 52/2023', '2023-02-27', '2023-02-27', '27', 'gotówka'),
		('FS 53/2023', '2023-02-28', '2023-02-28', '21', 'karta'),
		('FS 54/2023', '2023-03-01', '2023-03-14', '18', 'przelew'),
		('FS 55/2023', '2023-03-02', '2023-03-02', '17', 'gotówka'),
		('FS 56/2023', '2023-03-03', '2023-03-03', '16', 'karta'),
		('FS 57/2023', '2023-03-04', '2023-03-04', '15', 'gotówka'),
		('FS 58/2023', '2023-03-05', '2023-03-05', '13', 'gotówka'),
		('FS 59/2023', '2023-03-06', '2023-03-20', '10', 'przelew'),
		('FS 60/2023', '2023-03-07', '2023-03-07', '28', 'gotówka'),
		('FS 61/2023', '2023-03-08', '2023-03-08', '26', 'gotówka'),
		('FS 62/2023', '2023-03-09', '2023-03-09', '15', 'karta'),
		('FS 63/2023', '2023-03-10', '2023-03-10', '14', 'gotówka'),
		('FS 64/2023', '2023-03-11', '2023-03-11', '16', 'gotówka'),
		('FS 65/2023', '2023-03-12', '2023-03-12', '15', 'karta'),
		('FS 66/2023', '2023-03-13', '2023-03-13', '23', 'gotówka'),
		('FS 67/2023', '2023-03-14', '2023-03-14', '14', 'gotówka'),
		('FS 68/2023', '2023-03-15', '2023-03-15', '16', 'gotówka'),
		('FS 69/2023', '2023-03-16', '2023-03-16', '21', 'gotówka'),
		('FS 70/2023', '2023-03-17', '2023-03-17', '20', 'karta'),
		('FS 71/2023', '2023-03-18', '2023-03-28', '22', 'przelew'),
		('FS 72/2023', '2023-03-19', '2023-03-19', '16', 'gotówka'),
		('FS 73/2023', '2023-03-20', '2023-03-20', '5', 'gotówka'),
		('FS 74/2023', '2023-03-21', '2023-03-31', '15', 'przelew'),
		('FS 75/2023', '2023-03-22', '2023-03-25', '26', 'przelew'),
		('FS 76/2023', '2023-03-23', '2023-03-26', '27', 'przelew'),
		('FS 77/2023', '2023-03-24', '2023-03-24', '23', 'gotówka'),
		('FS 78/2023', '2023-03-25', '2023-03-25', '29', 'gotówka'),
		('FS 79/2023', '2023-03-26', '2023-03-26', '19', 'gotówka'),
		('FS 80/2023', '2023-03-27', '2023-03-27', '2', 'karta'),
		('FS 81/2023', '2023-03-28', '2023-03-31', '8', 'przelew');

--wyœwietlenie wszystkich danych w tabeli tbl_faktury:
SELECT * FROM tbl_faktury;

--dodawanie danych do tabeli tbl_producent:
INSERT INTO tbl_producent(nazwa_producenta, kraj)
VALUES
		('Cersanit', 'Polska'),
		('Ceramika Color', 'Polska'),
		('CERRAD/Nowa Gala', 'Polska'),
		('Stargres', 'Polska'),
		('Ceramika Parady¿', 'Polska'),
		('Ceramika NETTO', 'Polska'),
		('Golden Tile', 'Ukraina'),
		('Opoczno', 'Polska'),
		('Ceramstic', 'Polska'),
		('Ceramix', 'Polska'),
		('Tub¹dzin', 'Polska'),
		('Ceramica Bianca', 'Polska'),
		('Equipe', 'Hiszpania'), 
		('Mykonos', 'Hiszpania'),
		('Vives', 'Hiszpania');

--wyœwietlenie wszystkich danych w tabeli tbl_producent:
SELECT * FROM tbl_producent;

--dodawanie danych do tabeli tbl_plytki:
INSERT INTO tbl_plytki(nazwa_plytki, gatunek, producent_id, cena_jednostkowa_netto)
VALUES
		('Calacatta gres szkliwiony', 'pj', '1', 52.85),
		('Village Colour', '2', '2', 31.30),
		('Taserro gris lappato', '2', '3', 48.37),
		('Downtown grey gres szkliwiony', '2', '4', 47.56),
		('Skandynawia beige gres szkliwiony', '1', '4', 51.22),
		('Porcelano Bianco', '1', '5', 58.37),
		('SD Silver gres', '1', '4', 39.02),
		('Brightwood gres szkliwiony', '1', '1', 44.72),
		('Dekan be¿ gres szkliwiony', '1', '4', 44.72),
		('Tigua grys gres szkliwiony', '1', '5', 54.88),
		('Oslo brown gres', '1', '4', 51.22),
		('Kandell Neutro', '1', '3', 38.62),
		('Sund San crema gres', '1', '5', 93.50),
		('White Satin Venus', '1', '6', 56.50),
		('Kronewald ciemny be¿', '1', '7', 85.37),
		('Sextans grafit gres szkliwiony', '2', '5', 50.41),
		('Flower gres', '1', '8', 69.11),
		('Gamma mat œciana', '1', '5', 34.15),
		('Tanie beige glazura', '1', '1', 43.66),
		('Arkesia grafit poler', 'pj', '5', 32.11),
		('Makalu Bianco', '1', '6', 81.30),
		('Alchemy dark grey gres polerowany', '1', '9', 47.97),
		('Magic Black MG14 gres szkliwiony', '2', '3', 44.72),
		('Horizon Gold gres szkliwiony', 'pj', '5', 69.11),
		('Infinita br¹z', '2', '8', 16.18),
		('Cement Glossy', '1', '9', 47.56),
		('Signum SG12 gres szkliwiony', '1', '3', 42.68),
		('Calacatta Sparkle Gold', 'pj', '5', 58.85),
		('Marquinia Red Gold', '1', '3', 84.83),
		('Moondust beige gres naturalny', '2', '8', 32.52),
		('Wolk grey gres szkliwiony', '2', '4', 39.43),
		('Suomi Brown', '1', '4', 51.22),
		('Calacatta gold gres szkliwiony', '2', '4', 44.31),
		('Pocelano glazura dekor', '2', '5', 31.30),
		('Centro bianco glazura', '2', '5', 32.44),
		('Nero gres szkliwiony', 'pj', '5', 39.43),
		('Punto white glazura', '2', '2', 21.54),
		('Tango white gres', '1', '11', 31.30),
		('Quadra white str', '2', '11', 29.67),
		('Harmony bianco glazura', 'pj', '5', 21.54),
		('Equador grafit glazura', '1', '2', 26.42),
		('Granitos Brown', '2', '5', 39.43),
		('Venezia nero poler', '1', '6', 117.89),
		('Prestige white axis', '2', '12', 31.30),
		('Metalic grafit gres szkliwiony', '1', '8', 60.98),
		('Azteca gres szkliwiony', '2', '4', 44.31),
		('Skandinavia grafit gres', '2', '4', 51.22),
		('Sidorno gold gres szkliwiony', '1', '10', 105.69),
		('Pietra Serena grey', '1', '4', 134.15),
		('Carrara gres szkliwiony', '1', '8', 85.37),
		('Cement Paris', '1' , '6', 86.63),
		('White Glossy', '1' , '5', 48.37),
		('Neutro NU12 gres', '1', '3', 54.47),
		('Algo bianco gres szkliwiony', '2', '5' , 19.92),
		('Laterizo grys glazura', 'pj' , '5', 29.67),
		('Hanoi Caramel', '1' , '13', 134.15),
		('Lancer Baku Roble', '1' , '14', 83.90),
		('Mugat Negro', '1', '15', 68.00),
		('Tacoma White Rect', '2', '3' , 32.90),
		('Keystone Grey', '1', '4', 42.00);

--wyœwietlenie wszystkich danych w tabeli tbl_plytki:
SELECT * FROM tbl_plytki;

--dodawanie danych do tabeli tbl_pozycje_faktur
INSERT INTO tbl_pozycje_faktur(faktura_id, plytka_id, ilosc)
VALUES
		('1', '55', 14.4),
		('2', '18', 2.88),
		('3', '54', 3.24),
		('4', '53', 2.88),
		('5', '3', 17.78),
		('5', '5', 4.6),
		('6', '52', 21),
		('6', '38', 12.96),
		('7', '52', 108),
		('8', '11', 10.4),
		('9', '51', 1.44),
		('10', '30', 8.28),
		('11', '50', 2.88),
		('12', '49', 41.78),
		('13', '48', 0.72),
		('14', '47', 7.7),
		('15', '41', 3),
		('16', '41', 9.5),
		('17', '31', 13.86),
		('18', '1', 35.45),
		('19', '11', 4.6),
		('20', '28', 30.24),
		('21', '36', 1.55),
		('22', '41', 34.5),
		('23', '26', 30.6),
		('23', '46', 11.52),
		('24', '44', 10.5),
		('24', '45', 21.6),
		('25', '13', 5.6),
		('26', '32', 10.58),
		('26', '37', 5.4),
		('27', '42', 2.16),
		('27', '5', 7.65),
		('28', '43', 31.68),
		('29', '28', 30.24),
		('30', '12', 12.58),
		('31', '42', 4.32),
		('32', '40', 3.06),
		('32', '41', 8),
		('33', '17', 1.04),
		('33', '39', 4.5),
		('34', '22', 11.7),
		('35', '37', 1.89),
		('35', '38', 2.025),
		('36', '36', 11.6),
		('37', '20', 2.14),
		('37', '34', 2.16),
		('37', '35', 3.75),
		('38', '4', 86.4),
		('39', '33', 53.64),
		('40', '4', 20.15),
		('40', '18', 15.84),
		('41', '31', 22.68),
		('41', '32', 2.3),
		('42', '52', 3.6),
		('43', '2', 70.5),
		('44', '52', 1.5),
		('45', '30', 5.76),
		('46', '28', 1.44),
		('46', '29', 0.72),
		('47', '24', 0.72),
		('48', '25', 3.04),
		('48', '26', 13.43),
		('48', '27', 6.48),
		('49', '52', 3.6),
		('50', '24', 17.28),
		('51', '52', 57.6),
		('51', '23', 20.16),
		('52', '4', 5.04),
		('52', '59', 19.08),
		('53', '20', 11.24),
		('53', '21', 7.2),
		('53', '22', 8.28),
		('54', '19', 69),
		('54', '4', 10.85),
		('55', '17', 11.44),
		('55', '18', 17.16),
		('56', '52', 19.8),
		('57', '16', 20.8),
		('58', '4', 15.5),
		('59', '7', 150.12),
		('60', '9', 5.36),
		('61', '4', 17.05),
		('62', '2', 7.5),
		('63', '9', 1.08),
		('64', '15', 19.95),
		('65', '14', 28.8),
		('65', '4', 25.2),
		('66', '13', 15.84),
		('67', '3', 6.04),
		('68', '12', 14.3),
		('69', '9', 3.42),
		('70', '11', 22.11),
		('71', '10', 11.78),
		('72', '25', 9.8),
		('72', '19', 11.26),
		('73', '7', 8.34),
		('74', '1', 16.52),
		('74', '8', 3.15),
		('74', '9', 5.76),
		('75', '7', 150.12),
		('75', '22', 60),
		('76', '5', 100.44),
		('76', '6', 45),
		('77', '4', 15.84),
		('78', '3', 5.33),
		('79', '2', 37.5),
		('80', '9', 5.88),
		('81', '1', 10.6);

--wyœwietlenie wszystkich danych w tabeli tbl_pozycje_faktur:
SELECT * FROM tbl_pozycje_faktur;

-----------------------------------------------------------------------------------------------------------------------------------------------
--wyszukaj firmy z Gniezna:
SELECT 
	nazwa_firmy AS 'Firmy z Gniezna', 
	NIP, 
	telefon 
FROM tbl_klienci
WHERE miasto = 'Gniezno' AND NIP IS NOT NULL;

--wyszukaj p³ytki, które zaczynaj¹ siê na literê a lub c. Uporz¹kuj wed³ug ceny netto malej¹co:
SELECT 
	nazwa_plytki, 
	cena_jednostkowa_netto 
FROM tbl_plytki
WHERE nazwa_plytki LIKE '[ac]%'
ORDER BY cena_jednostkowa_netto DESC;

--policz ilu klientów to osoby prywatne, a ile to firmy:
SELECT 
	COUNT (nazwisko) AS 'liczba osób prywatnych',
	COUNT (nazwa_firmy) AS 'liczba firm'
FROM tbl_klienci;

--wyszukaj p³ytek wraz z producentem i cen¹ netto, których cena mieœci siê w przedziale 50-70 PLN w pierwszym gatunku.
--uporz¹dkuj wed³ug ceny rosn¹co:
SELECT 
	nazwa_plytki,
	nazwa_producenta,
	gatunek,
	cena_jednostkowa_netto
FROM tbl_plytki
INNER JOIN tbl_producent
ON tbl_plytki.producent_id = tbl_producent.id_producenta
WHERE cena_jednostkowa_netto BETWEEN 50 AND 70
AND gatunek = '1'
ORDER BY 3;

--przypisz klienta do numerów faktur. Najpierw wyszczególnij firmy, a potem osoby prywatne:
SELECT 
	numer_faktury,
	nazwa_firmy,
	imie,
	nazwisko
FROM tbl_klienci
INNER JOIN tbl_faktury
ON tbl_faktury.klient_id = tbl_klienci.id_klienta
WHERE nazwa_firmy IS NOT NULL
UNION ALL
SELECT 
	numer_faktury,
	nazwa_firmy,
	imie,
	nazwisko
FROM tbl_klienci
INNER JOIN tbl_faktury
ON tbl_faktury.klient_id = tbl_klienci.id_klienta
WHERE nazwisko IS NOT NULL;

--oblicz œredni¹ cenê brutto p³ytki przy zaokr¹gleniu do liczb ca³kowitych:
SELECT 
	AVG(CAST(cena_jednostkowa_netto*1.23 AS int)) AS œrednia_cena_brutto
FROM tbl_plytki;

--dla ka¿dej faktury przypisz iloœæ zakupionych p³ytek:
SELECT
	numer_faktury,
	SUM(ilosc) AS 'suma_m2'
FROM tbl_faktury
INNER JOIN tbl_pozycje_faktur
ON tbl_faktury.id_faktury = tbl_pozycje_faktur.faktura_id
GROUP BY numer_faktury
ORDER BY 2 DESC;

--wyœwietl malej¹co liczbê p³atnoœci gotówk¹, przelewem i kart¹:
SELECT 
	forma_platnosci,
	COUNT(*) AS liczba_platnosci
FROM tbl_faktury
GROUP BY forma_platnosci
ORDER BY 2 DESC;

--wyœwietl klientów, którzy nie z³o¿yli zamówienia ani razu: 
SELECT 
	imie,
	nazwisko,
	nazwa_firmy,
	numer_faktury
FROM tbl_klienci
LEFT JOIN tbl_faktury
ON tbl_klienci.id_klienta = tbl_faktury.klient_id
WHERE numer_faktury IS NULL;

--wyœwietl p³ytki, które nigdy nie zosta³y zakupione:
SELECT * 
FROM tbl_plytki
WHERE id_plytki NOT IN(SELECT 
						plytka_id 
						FROM tbl_pozycje_faktur 
						WHERE plytka_id IS NOT NULL);

--wyœwietl ³¹czne wartoœci brutto faktur:
SELECT
	numer_faktury,
	CAST(ROUND(ilosc*(cena_jednostkowa_netto*1.23),2) AS DECIMAL(6,2)) AS 'wartoœæ brutto'
FROM 
	(tbl_faktury
	INNER JOIN tbl_pozycje_faktur
	ON tbl_faktury.id_faktury = tbl_pozycje_faktur.faktura_id)
	INNER JOIN tbl_plytki
	ON tbl_pozycje_faktur.plytka_id = tbl_plytki.id_plytki;

--wyœwietl najdro¿sze p³ytki:
SELECT * FROM tbl_plytki
WHERE cena_jednostkowa_netto = (SELECT
									MAX(cena_jednostkowa_netto)
									FROM tbl_plytki);

--=====

SELECT TOP 1 WITH TIES * FROM tbl_plytki
ORDER BY cena_jednostkowa_netto DESC;

--wyœwietl p³ytki, które s¹ dro¿sze ni¿ wszystkie p³ytki z gatunku 1:
SELECT * FROM tbl_plytki
WHERE cena_jednostkowa_netto > ALL(SELECT cena_jednostkowa_netto FROM tbl_plytki
									WHERE gatunek = '1');

--wyœwietl informacje o p³ytkach producenta Ceraminka Parady¿ wraz ze œredni¹ cen¹ p³ytek tego producenta:
SELECT 
	nazwa_plytki,
	gatunek,
	cena_jednostkowa_netto,
	(SELECT CAST(AVG(cena_jednostkowa_netto) AS DECIMAL(4,2))
			FROM tbl_plytki
			WHERE producent_id = '5') AS 'œrednia cena'
FROM tbl_plytki
WHERE producent_id = '5';

--wyœwietl sumê faktur, w ramach których klient zakupi³ wiêcej ni¿ jeden towar
SELECT
	COUNT(*) AS 'Ile faktur'
FROM
	(SELECT
		faktura_id
	FROM tbl_pozycje_faktur
	GROUP BY faktura_id
	HAVING COUNT(faktura_id) >= 2) podzapytanie;

--wyœwietl informacje o kliencie z najwiêksz¹ iloœci¹ faktur:
SELECT
	imie,
	nazwisko,
	nazwa_firmy,
	COUNT(klient_id) AS ile_faktur
FROM tbl_klienci
	INNER JOIN tbl_faktury ON tbl_klienci.id_klienta = tbl_faktury.klient_id
GROUP BY imie, nazwisko, nazwa_firmy
HAVING COUNT(klient_id) = (SELECT TOP 1
				COUNT(klient_id) AS 'maks'
			  FROM tbl_klienci
				INNER JOIN tbl_faktury
				ON tbl_klienci.id_klienta = tbl_faktury.klient_id
		      GROUP BY klient_id
			  ORDER BY maks DESC);

--porównaj daty wystawienia faktury i daty p³atnoœci oraz dodaj kolumnê czy zap³acono od razu czy w póŸniejszym terminie: 
SELECT 
	numer_faktury,
	data_wystawienia,
	data_platnosci,
	forma_platnosci,
	CASE
		WHEN data_platnosci = data_wystawienia THEN 'p³atnoœæ od razu'
		ELSE 'p³atnoœæ w póŸniejszym terminie'
	END AS 'Kiedy zap³acono'
FROM tbl_faktury;

--przypisz gatunkowi p³ytek odpowiedni opis (1 = wzorcowy produkt, 2 = niewielkie wady, pj = poza jakoœci¹):
SELECT 
	nazwa_plytki,
	gatunek,
	IIF(gatunek = '1', 'wzorcowy produkt', 
		IIF(gatunek = '2', 'niewielkie wady', 'poza jakoœci¹')) AS opis_gatunku
FROM tbl_plytki;

------------------------------------------------------------------------------------------------------------------------------------------

--popraw dane firmy, je¿eli zostaw b³êdnie wpisany numer NIP:
SELECT * FROM tbl_klienci
WHERE LEN(NIP) != 10;

UPDATE tbl_klienci
	SET NIP = '7114057177' WHERE id_klienta = 26;

ALTER TABLE tbl_klienci
	ADD CONSTRAINT chkNIPZnaki10 CHECK(LEN(NIP) = 10);

--dodaj kolumnê z ocen¹ producenta do tabeli tbl_producent: 
ALTER TABLE tbl_producent
	ADD ocena_producenta DECIMAL (2,1);

--wprowadŸ dane do kolumny ocena_producenta: 
UPDATE tbl_producent
	SET ocena_producenta = 7.9 WHERE id_producenta = 2;

--usuñ kolumnê ocena_producenta z tabeli tbl_producent:
ALTER TABLE tbl_producent
	DROP COLUMN ocena_producenta;

--wprowadŸ celowo b³êdne dane, nastêpnie je usuñ i wprowadŸ prawid³owo: 
begin transaction; 

UPDATE tbl_klienci
SET ulica = 'Kaktusowa 11';

SELECT * FROM tbl_klienci;

rollback transaction;

UPDATE tbl_klienci
SET ulica = 'Kaktusowa 11'
WHERE id_klienta = 5;

--stwórz widok asortymentu sklepu (nazwa p³ytki, gatunek, cena, producent):
CREATE VIEW v_asortyment AS
SELECT 
	nazwa_plytki,
	gatunek,
	cena_jednostkowa_netto,
	nazwa_producenta
FROM tbl_plytki
INNER JOIN tbl_producent
ON tbl_plytki.producent_id = tbl_producent.id_producenta;

SELECT * FROM v_asortyment;

--usuwanie bazy:
DROP DATABASE db_glazura_Gniezno;