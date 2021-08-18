insert into pembelian(id, kode, id_produk, banyak_produk, harga_produk, id_pemasok, created_at, updated_at) values(1, 'PB1', 1, 10, 90, 1, sysdate, sysdate);
insert into pembelian(id, kode, id_produk, banyak_produk, harga_produk, id_pemasok, created_at, updated_at) values(2, 'PB1', 2, 20, 190, 1, sysdate, sysdate);
insert into pembelian(id, kode, id_produk, banyak_produk, harga_produk, id_pemasok, created_at, updated_at) values(3, 'PB1', 3, 30, 290, 1, sysdate, sysdate);
commit;
insert into penjualan(id, kode, id_produk, banyak_produk, harga_produk, id_pelanggan, created_at, updated_at) values(1, 'PJ1', 1, 5, (select harga from produk where id = 1), 1, sysdate, sysdate);
insert into penjualan(id, kode, id_produk, banyak_produk, harga_produk, id_pelanggan, created_at, updated_at) values(2, 'PJ1', 2, 10, (select harga from produk where id = 2), 1, sysdate, sysdate);
insert into penjualan(id, kode, id_produk, banyak_produk, harga_produk, id_pelanggan, created_at, updated_at) values(3, 'PJ1', 3, 15, (select harga from produk where id = 3), 1, sysdate, sysdate);
commit;
