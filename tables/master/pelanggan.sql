create table pelanggan(
	id number not null,
	nama varchar2(45) not null,
	hp varchar2(15) not null,
	alamat varchar2(255) not null,
	created_at timestamp not null,
	updated_at timestamp not null,
	primary key (id)
);
