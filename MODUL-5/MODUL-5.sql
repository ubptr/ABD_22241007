-- Nama : Ulung Briansyah Putra
-- NIM 	: 22241007
-- Modul 5

-- JOIN

-- Tampilkan nama pelanggan dan qty belanjanya
SELECT 
	mp.nama_pelanggan, 
	tp.qty 
FROM 
	tr_penjualan_dqlab AS tp
JOIN 
	ms_pelanggan_dqlab AS mp
ON mp.kode_pelanggan = tp.kode_pelanggan;

-- Join tanpa filtering ON = CROSS JOIN
SELECT 
	mp.nama_pelanggan, 
	tp.qty 
FROM 
	tr_penjualan_dqlab AS tp
JOIN 
	ms_pelanggan_dqlab AS mp
ON true;

-- INNER JOIN
SELECT 
	mp.nama_pelanggan, 
	tp.qty 
FROM 
	tr_penjualan_dqlab AS tp
INNER JOIN 
	ms_pelanggan_dqlab AS mp
ON mp.kode_pelanggan = tp.kode_pelanggan;

-- LEFT OUTER JOIN
SELECT 
	mp.nama_pelanggan, 
	tp.qty 
FROM 
	tr_penjualan_dqlab AS tp
LEFT JOIN 
	ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- RIGHT OUTER JOIN
SELECT 
	mp.nama_pelanggan, 
	tp.qty 
FROM 
	tr_penjualan_dqlab AS tp
RIGHT JOIN 
	ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- JOIN 3 Tabel
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty 
FROM ms_pelanggan_dqlab mp
LEFT OUTER JOIN tr_penjualan_dqlab tp
	ON mp.kode_pelanggan = tp.kode_pelanggan 
LEFT OUTER JOIN ms_produk_dqlab mpd 
	ON mpd.kode_produk = tp.kode_produk;


-- ORDER BY Pada JOIN
-- Urutkan berdasarkan QTY Besar ke kecil
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty 
FROM ms_pelanggan_dqlab mp
LEFT OUTER JOIN tr_penjualan_dqlab tp
	ON mp.kode_pelanggan = tp.kode_pelanggan 
LEFT OUTER JOIN ms_produk_dqlab mpd 
	ON mpd.kode_produk = tp.kode_produk
ORDER BY qty DESC;


-- Grouping dan fungsi agregasi pada JOin
-- Menampilkan Summary dari total produk terjual
SELECT mpd.kategori_produk, mpd.nama_produk, SUM(tp.qty) as jml_produk_terjual
FROM ms_produk_dqlab mpd 
LEFT OUTER JOIN tr_penjualan_dqlab tp 
	on mpd.kode_produk = tp.kode_produk 
GROUP BY mpd.kategori_produk, mpd.nama_produk 
HAVING sum(tp.qty) IS NULL
ORDER BY sum(tp.qty) DESC;

-- UNION

SELECT kode_produk, nama_produk 
	FROM ms_produk_dqlab 
UNION 
SELECT kode_pelanggan, nama_pelanggan 
	FROM ms_pelanggan_dqlab; 


-- LIMIT
SELECT nama_produk 
	FROM ms_produk_dqlab 
UNION ALL
SELECT nama_produk 
	FROM tr_penjualan_dqlab LIMIT 1;



-- LATIHAN MANDIRI #1
SELECT * FROM ms_pelanggan_dqlab mpd 
INNER JOIN tr_penjualan_dqlab tpd 
ON mpd.kode_pelanggan = tpd.kode_pelanggan 
INNER JOIN ms_produk_dqlab mpd2 
ON tpd.kode_produk = mpd2.kode_produk;

-- LATIHAN MANDIRI #2
SELECT * FROM ms_pelanggan_dqlab mpd 
LEFT JOIN tr_penjualan_dqlab tpd 
ON mpd.kode_pelanggan = tpd.kode_pelanggan 
LEFT JOIN ms_produk_dqlab mpd2 
ON tpd.kode_produk = mpd2.kode_produk
WHERE tpd.qty IS NOT NULL;

-- LATIHAN MANDIRI #3
SELECT mpd2.kategori_produk, SUM(tpd.qty) AS total_qty FROM ms_pelanggan_dqlab mpd 
INNER JOIN tr_penjualan_dqlab tpd 
ON mpd.kode_pelanggan = tpd.kode_pelanggan 
INNER JOIN ms_produk_dqlab mpd2 
ON tpd.kode_produk = mpd2.kode_produk
GROUP BY mpd2.kategori_produk;

-- LATIHAN MANDIRI #4
SELECT 
	mp1.kode_produk AS kode_produk_1,
	mp1.no_urut AS no_urut_1,
	mp1.kategori_produk AS kategori_produk_1,
	mp1.nama_produk AS nama_produk_1,
	mp1.harga AS harga_1,
	mp2.kode_produk AS kode_produk_2,
	mp2.no_urut AS no_urut_2,
	mp2.kategori_produk AS kategori_produk_2,
	mp2.nama_produk AS nama_produk_2,
	mp2.harga AS harga_2
FROM ms_produk_dqlab mp1 
JOIN ms_produk_dqlab mp2 
ON mp1.kode_produk = mp2.kode_produk;
