-- Nama : Ulung Briansyah Putra
-- NIM 	: 22241007
-- MODUL 3


-- ORDER BY

-- Mengambil Nama produk dan qty urutkan berdasarkan qty
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty;

-- Mengambil nama produk dan qty urutkan berdasarkan qty diikuti dengan nama produk
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty, nama_produk;


-- LATIHAN 1 
SELECT * FROM tr_penjualan_dqlab ORDER BY qty, tgl_transaksi;
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan;
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat;

-- Mengambil nama produk dan qty urutkan berdasarkan qty besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty DESC;

-- Mengambil nama produk dan qty urutkan berdasarkan qty besar ke kecil, nama produk kecil ke besar
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty DESC, nama_produk;


-- Latihan 2
SELECT * FROM tr_penjualan_dqlab ORDER BY tgl_transaksi DESC, qty;
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan DESC;
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat DESC;

-- Menggunakan hasil perhitungan pada ORDER BY

-- Mengambil nama produk, qty, harga dan total harganya urutkan berdasarkan total bayar besar ke kecil 
SELECT nama_produk, qty, harga, qty*harga AS total_bayar FROM tr_penjualan_dqlab ORDER BY total_bayar DESC;


-- LATIHAN 3
SELECT nama_produk, qty, harga, diskon_persen, (diskon_persen/100)*harga AS diskon, qty*(harga - (diskon_persen/100)*harga) AS total_bayar FROM tr_penjualan_dqlab ORDER BY total_bayar DESC;

-- WHERE dan ORDER BY

-- mengambil nama produk dan qty dari produk berawalan F urut berdasarkan qty besar ke kecil
SELECT nama_produk,qty FROM tr_penjualan_dqlab WHERE nama_produk LIKE 'F%' ORDER BY qty DESC;

-- :ATIHAN 4
SELECT * FROM tr_penjualan_dqlab WHERE diskon_persen != 0 ORDER BY harga DESC;
SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab WHERE harga >= 100000 ORDER BY harga DESC;
SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab WHERE harga >= 100000 OR nama_produk LIKE 'T%' ORDER BY diskon_persen DESC;


-- Fungsi Agregasi
-- hitung jumlah nilai qty dari seluruh row di tabel penjualan
SELECT SUM(qty) AS total_qty FROM tr_penjualan_dqlab;

-- hitung jumlah seluruh row data pada tabel penjualan
SELECT COUNT(*) AS jumlah_row FROM tr_penjualan_dqlab;

-- Hitung jumlah nilai qty dan jumlah seluruh row pada tabel penjualan
SELECT SUM(qty) AS total_qty, COUNT(*) AS jumlah_row FROM tr_penjualan_dqlab;

-- hitung rata rata, nilai max, nilai min dari qty pada tabel penjualan
SELECT AVG(qty), MAX(qty), MIN(qty) FROM tr_penjualan_dqlab;

-- hitung jumlah nilai unik dari nama produk di tabel penjualan
SELECT COUNT(DISTINCT nama_produk) FROM tr_penjualan_dqlab;

-- hitung jumlah nilai unik dari nama produk dan seleuruh row dari tabel penjualan
SELECT COUNT(*),  COUNT(DISTINCT nama_produk) FROM tr_penjualan_dqlab;


-- menampilkan field nama produk dan fungsi max qty pada tabel penjualan
SELECT nama_produk, MAX(nama_produk) FROM tr_penjualan_dqlab;

-- GROUP BY
-- Ambil hasil pengelompokan nilai kolom nama produk di tabel penjualan
SELECT nama_produk FROM tr_penjualan_dqlab GROUP BY nama_produk;

-- ambil hasil pengelompokkan dari nama produk dan qty di tabel penjualan
SELECT nama_produk, qty FROM tr_penjualan_dqlab GROUP BY nama_produk, qty;

-- Ambil hasil penjumlahan qty dari pengelompokkan nama produk terhadap semua row di tabel penjualan
SELECT nama_produk, SUM(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk ORDER BY sum(qty) DESC;

-- HAVING
-- Ambil jumlah qty > 2 dari hasil pengelompokkan nama produk dari tabel penjualan
SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab GRoUP BY nama_produk HAVING sum(qty) > 2;

-- LATIHAN 5 
SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab GROUP By nama_produk HAVING SUM(qty) > 4; 
SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab GROUP By nama_produk HAVING SUM(qty) = 9;
SELECT nama_produk, qty*(harga - (diskon_persen/100)*harga) AS total_nilai FROM tr_penjualan_dqlab GROUP BY nama_produk, total_nilai ORDER BY total_nilai DESC;