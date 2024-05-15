-- Nama : Ulung Briansyah Putra
-- NIM 	: 22241007
-- MODUL 2

-- NILAI LITERAL 

-- Menggunakan SELECT Statement untuk nilai literal untuk angka
SELECT 77 AS nomor_punggung;

-- Menampilkan nilai literal beberapa tipe data
SELECT 77 AS angka, true AS nilai_logika, 'DQLab' AS teks;

-- NULL

-- Menampilkan NULL
SELECT NULL as kosong;

-- OPERATOR MATEMATIKA

-- Kalkulasi Ekspresi Matematika
SELECT 5%2 AS sisa_bagi, 5/2 AS hasil_bagi_1, 5 DIV 2 AS hasil_bagi_2;

-- LATIHAN MANDIRI
SELECT 4*2 AS hasil_bagi_1, (4*8)%7 AS hasil_bagi_2, (4*8) MOD 7 AS hasil_bagi_3, (4*8) / 7 AS sisa_bagi_4;



SELECT * FROM tr_penjualan_dqlab;

-- EKSPRESI MATEMATIKA
-- Menampilkan Hasil Beli dari kolom qty dan harga
SELECT qty*harga AS total_beli FROM tr_penjualan_dqlab;


-- OPERATOR PERBANDINGAN
-- Menampilkan hasil Perbandingan nilai literal
SELECT 5=5, 5<>5, 5<>4, 5!=5, 5!=4, 5>4;

-- Latihan Mandiri 2
SELECT 1=true, 1=false, 5>=5, 5.2 = 5.20000, NULL=1,NULL=NULL;

SELECT nama_produk, qty<=3 FROM tr_penjualan_dqlab;

-- FUNGSI
SELECT POW(3,2), ROUND(3.14), ROUND(3.54), ROUND(3.155 , 1), ROUND(3.155, 2), FLOOR(4.28), FLOOR(4.78), CEILING(4.39), CEILING(4.55);

-- FUNGSI TANGGAL
SELECT NOW(), YEAR(NOW()), MONTH(NOW()), DATEDIFF(NOW(), '2003-04-08'), DAY('2003-04-08');

-- LATIHAN MANDIRI 3
SELECT DATEDIFF('2022-07-23', NOW()), YEAR('2022-07-23'), MONTH('2022-07-23'), DAY('2022-07-23'), YEAR(NOW());

-- Menampilkan Selisih Transaksi terakhir dengan tanggal hari ini
SELECT DATEDIFF(NOW(), tgl_transaksi) AS selisih_hari FROM tr_penjualan_dqlab;

-- FILTERING WITH WHERE
-- WHERE STATEMENT
-- Mengambil Nama produk dan quantity yang quantitynya lebih dari 3
SELECT nama_produk, qty FROM tr_penjualan_dqlab WHERE qty>3;

-- Mengambil nama produk, qty, yang qty > 3 dan transaksinya bulan 6
SELECT nama_produk, qty FROM tr_penjualan_dqlab WHERE qty>3 AND MONTH(tgl_transaksi)=6;

-- Menambil nama produk, qty dengan nama ternetu 
SELECT nama_produk, qty FROM tr_penjualan_dqlab WHERE nama_produk = 'Flashdisk DQLab 32 GB';

-- OPERATOR PERBANDINGAN LIKE
-- Mengambil nama produk yang berawalan huruf F
SELECT nama_produk FROM tr_penjualan_dqlab WHERE nama_produk LIKE 'f%';


-- Latihan Mandiri 4
SELECT nama_produk FROM tr_penjualan_dqlab WHERE nama_produk LIKE '_a%';
SELECT kategori_produk FROM ms_produk_dqlab WHERE kategori_produk LIKE '%t%';
SELECT kategori_produk FROM ms_produk_dqlab WHERE kategori_produk LIKE '%un%';


-- OPERATOR LOGIKA
SELECT nama_produk FROM tr_penjualan_dqlab WHERE nama_produk LIKE 'f%' AND qty > 2;
SELECT nama_produk FROM tr_penjualan_dqlab WHERE nama_produk LIKE 'f%' OR qty > 2;


