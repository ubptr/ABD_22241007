-- Nama : Ulung Briansyah Putra
-- NIM 	: 22241007
-- REFRESH


-- CASE 1
SELECT nama_pelanggan, alamat FROM ms_pelanggan_dqlab;

-- CASE 2
SELECT nama_produk, harga FROM ms_produk_dqlab;

-- CASE 3
SELECT * FROM ms_produk_dqlab WHERE harga >= 15000 AND nama_produk = 'Flashdisk DQLab 32 GB';

-- CASE 4
SELECT * FROM ms_produk_dqlab WHERE kode_produk IN ('prod-08', 'prod-07', 'Flashdisk DQLab 84 GB');

-- CASE 5
SELECT * FROM ms_produk_dqlab WHERE harga <= 50000;

-- CASE 6
SELECT kode_pelanggan, nama_produk, qty, harga, qty*harga AS total FROM tr_penjualan_dqlab HAVING total >= 200000 ORDER BY total DESC;

-- CASE 7
SELECT kode_pelanggan, SUM(qty) AS total_qty, SUM(harga) AS total_harga, SUM(qty)%3 AS sisa FROM tr_penjualan_dqlab GROUP BY kode_pelanggan;

-- CASE 8
SELECT kode_transaksi, tgl_transaksi, no_urut, nama_produk, CONCAT(kode_produk , " ", nama_produk) AS s FROM tr_penjualan_dqlab WHERE qty = 5;

-- CASE 9
SELECT nama_pelanggan, TRIM(BOTH ', S.H.' FROM nama_pelanggan) AS nama_tanpa_gelar, substr(nama_pelanggan, 1, 4) AS nama_panggilan FROM ms_pelanggan_dqlab WHERE kode_pelanggan = 'dqlabcust01';

-- CASE 10
SELECT nama_pelanggan, SUBSTR(nama_pelanggan, 2,3) AS initial FROM ms_pelanggan_dqlab;

-- CASE 11
SELECT nama_pelanggan, SUBSTR(nama_pelanggan, 2,3) AS initial, LENGTH(nama_pelanggan) AS total_char FROM ms_pelanggan_dqlab;

-- CASE 12
SELECT nama_pelanggan, REPLACE(nama_pelanggan, 'Pelanggan Non Member', 'Not Member') AS new_revisi_pelanggan, SUBSTR(nama_pelanggan, 2,3) AS initial, LENGTH(nama_pelanggan) AS total_char FROM ms_pelanggan_dqlab;

-- CASE 13
SELECT 
	nama_pelanggan, 
	UPPER(nama_pelanggan) AS UPPER_NAMA_PELANGGAN, 
	LOWER(nama_pelanggan) as lower_nama_pelanggan,  
	REPLACE(nama_pelanggan, 'Pelanggan Non Member', 'Not Member') AS new_revisi_pelanggan, 
	SUBSTR(nama_pelanggan, 2,3) AS initial, 
	LENGTH(nama_pelanggan) AS total_char 
FROM ms_pelanggan_dqlab;

SELECT 
    p.kode_pelanggan,
    COUNT(DISTINCT t.kode_transaksi) AS total_order,
    SUM(t.qty) AS jumlah_kuantitas,
    SUM(t.harga * t.qty) AS revenue
FROM 
    ms_pelanggan_dqlab p
JOIN 
    tr_penjualan_dqlab t ON p.kode_pelanggan = t.kode_pelanggan
GROUP BY 
    p.kode_pelanggan, p.nama_pelanggan;


-- CASE 14
SELECT kode_pelanggan, 
	COUNT(kode_transaksi) AS total_order, 
	ANY_VALUE(qty),
	SUM(qty * harga) AS total_revenue 
FROM 
	tr_penjualan_dqlab 
GROUP BY
	kode_pelanggan, kode_transaksi;


-- CASE 15
SELECT kode_pelanggan, 
	COUNT(kode_transaksi) AS Total_order, 
	SUM(qty),
	SUM(qty * harga) AS total_revenue,
	CASE
	WHEN SUM(qty * harga) >= 900000 THEN 'Target Achieved'
	WHEN SUM(qty * harga) <= 850000 THEN 'Less performed'
	ELSE 'Follow Up'
END AS remark
FROM 
	tr_penjualan_dqlab 
GROUP BY
	kode_pelanggan;

-- CASE 16
SELECT 
	kode_transaksi, 
	kode_pelanggan,
	kode_produk, 
	nama_produk, 
	harga, 
	qty, 
	(qty*harga) AS Total 
FROM 
	tr_penjualan_dqlab 
ORDER BY  
	nama_produk,
	harga 
DESC;

-- CASE 17
SELECT nama_produk, no_urut FROM tr_penjualan_dqlab;

-- CASE 18
SELECT * FROM tr_penjualan_dqlab;

-- cASE 19
SELECT c.kode_pelanggan, o.nama_pelanggan, o.alamat, c.nama_produk
FROM
	ms_pelanggan_dqlab o
JOIN
	tr_penjualan_dqlab c
ON 
	o.kode_pelanggan = c.kode_pelanggan
Where 
	c.nama_produk = 'Kotak Pensil DQLab' OR 
	c.nama_produk = 'Flashdisk DQLab 32 GB' OR 
	c.nama_produk = 'Sticky Notes DQLab 500 sheets';

-- CASE 20
SELECT nama_produk, tgl_transaksi, DATEDIFF(NOW(), tgl_transaksi) AS days_aging FROM tr_penjualan_dqlab;

-- CASE 21
SELECT 
	nama_produk, 
	tgl_transaksi, 
	MONTH(tgl_transaksi) AS month_date, 
	YEAR(tgl_transaksi) As year_date, 
	DAY(tgl_transaksi) AS day_date,
	DATEDIFF(NOW(), tgl_transaksi) AS days_aging 
FROM 
tr_penjualan_dqlab;

-- CASE 22
SELECT 
	nama_produk, 
	tgl_transaksi, 
	CASE
		WHEN MONTH(tgl_transaksi) = '5' THEN 'May'
		WHEN MONTH(tgl_transaksi) = '6' THEN 'June'
		ELSE 'MATI'
	END AS month_datea,
	YEAR(tgl_transaksi) As year_date, 
	DAY(tgl_transaksi) AS day_date,
	DATEDIFF(NOW(), tgl_transaksi) AS days_aging 
FROM 
tr_penjualan_dqlab;
