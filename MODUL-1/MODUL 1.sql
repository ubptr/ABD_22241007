-- Nama: Ulung Briansyah Putra
-- NIM: 22241007
-- Modul 1

-- Select
SELECT nama_produk FROM ms_produk_dqlab;

-- SELECT: Mengambil dari 1 kolom
SELECT nama_produk, harga FROM ms_produk_dqlab;

-- SELECT: Mengambil Seluruh Kolom Table
SELECT * FROM ms_produk_dqlab;


-- LATIHAN 
-- Mengambil Kolom kode_produk, nama_produk dari table ms_produk_dqlab
SELECT kode_produk, nama_produk FROM ms_produk_dqlab;

-- Mengambil Seluruh kolom dari table tr_penjualan_dqlab
SELECT * FROM tr_penjualan_dqlab;

-- PREFIX DAN ALIAS
-- PREFIX

-- Ambil nama produk dengan Prefix table
SELECT ms_produk_dqlab.nama_produk FROM ms_produk_dqlab;

-- Ambil nama produk dengan prefixnya database - Table
SELECT mart_undikma.ms_produk_dqlab.nama_produk FROM ms_produk_dqlab;

-- ALIAS
-- mengalias Pada Kolom dengan AS
SELECT nama_produk as np FROM ms_produk_dqlab;

-- Mengalias pada kolom tanpa AS
SELECT nama_produk np FROM ms_produk_dqlab;

-- Mengalias pada nama Table dengan AS
SELECT nama_produk FROM ms_produk_dqlab as mpd;

-- Mengalias pada nama table tanpa as
SELECT nama_produk FROM ms_produk_dqlab mpd;

-- Alias DAN PREFIX
-- Penggunaan Alias dan Prefix
SELECT mpd.nama_produk np FROM ms_produk_dqlab as mpd;


-- CASE 1
SELECT nama_pelanggan, alamat FROM ms_pelanggan_dqlab;

-- CASE 2
SELECT nama_produk, harga FROM tr_penjualan_dqlab;

