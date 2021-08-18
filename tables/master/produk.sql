create table produk(
	id number not null,
	nama varchar2(90) not null,
	harga number default 0 not null,
	stok number default 0 not null,
	created_at timestamp not null,
	updated_at timestamp not null,
	primary key (id)
);
