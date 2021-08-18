create table pembelian(
	id number not null,
	kode varchar2(45) not null,
	id_produk number not null,
	banyak_produk number not null,
	harga_produk number not null,
	id_pemasok number not null,
	created_at timestamp not null,
	updated_at timestamp not null,
	primary key (id),
	foreign key (id_produk) references produk(id),
	foreign key (id_pemasok) references pemasok(id)
);
create table penjualan(
	id number not null,
	kode varchar2(45) not null,
	id_produk number not null,
	banyak_produk number not null,
	harga_produk number not null,
	id_pelanggan number not null,
	created_at timestamp not null,
	updated_at timestamp not null,
	primary key (id),
	foreign key (id_produk) references produk(id),
	foreign key (id_pelanggan) references pelanggan(id)
);
