-- transaksi
drop table pembelian;
drop table penjualan;
-- master
drop table pelanggan;
drop table pemasok;
drop table produk;
create table pelanggan(
	id number not null,
	nama varchar2(45) not null,
	hp varchar2(15) not null,
	alamat varchar2(255) not null,
	created_at timestamp not null,
	updated_at timestamp not null,
	primary key (id)
);
create table pemasok(
	id number not null,
	nama varchar2(45) not null,
	hp varchar2(15) not null,
	alamat varchar2(255) not null,
	created_at timestamp not null,
	updated_at timestamp not null,
	primary key (id)
);
create table produk(
	id number not null,
	nama varchar2(90) not null,
	harga number default 0 not null,
	stok number default 0 not null,
	created_at timestamp not null,
	updated_at timestamp not null,
	primary key (id)
);
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
create or replace procedure delete_pelanggan_by_id(
  p_id in pelanggan.id%type
)
as
begin
  delete
    pelanggan
  where
    id = p_id;
  commit;
end delete_pelanggan_by_id;
/
create or replace procedure delete_pemasok_by_id(
  p_id in pemasok.id%type
)
as
begin
  delete
    pemasok
  where
    id = p_id;
  commit;
end delete_pemasok_by_id;
/
create or replace procedure delete_pembelian_by_id(
  p_id in pembelian.id%type
)
as
begin
  delete
    pembelian
  where
    id = p_id;
  commit;
end delete_pembelian_by_id;
/
create or replace procedure delete_pembelian_by_kode(
  p_kode in pembelian.kode%type
)
as
begin
  delete
    pembelian
  where
    kode = p_kode;
  commit;
end delete_pembelian_by_kode;
/
create or replace procedure delete_penjualan_by_id(
  p_id in penjualan.id%type
)
as
begin
  delete
    penjualan
  where
    id = p_id;
  commit;
end delete_penjualan_by_id;
/
create or replace procedure delete_penjualan_by_kode(
  p_kode in penjualan.kode%type
)
as
begin
  delete
    penjualan
  where
    kode = p_kode;
  commit;
end delete_penjualan_by_kode;
/
create or replace procedure delete_produk_by_id(
  p_id in produk.id%type
)
as
begin
  delete
    produk
  where
    id = p_id;
  commit;
end delete_produk_by_id;
/
create or replace procedure insert_pelanggan(
  p_id in pelanggan.id%type,
  p_nama in pelanggan.nama%type,
  p_hp in pelanggan.hp%type,
  p_alamat in pelanggan.alamat%type
)
as
begin
  insert into pelanggan(
    id,
    nama,
    hp,
    alamat,
    created_at,
    updated_at
  )
  values(
    p_id,
    p_nama,
    p_hp,
    p_alamat,
    sysdate,
    sysdate
  );
  commit;
end insert_pelanggan;
/
create or replace procedure insert_pemasok(
  p_id in pemasok.id%type,
  p_nama in pemasok.nama%type,
  p_hp in pemasok.hp%type,
  p_alamat in pemasok.alamat%type
)
is
begin
  insert into pemasok(
    id,
    nama,
    hp,
    alamat,
    created_at,
    updated_at
  )
  values(
    p_id,
    p_nama,
    p_hp,
    p_alamat,
    sysdate,
    sysdate
  );
  commit;
end insert_pemasok;
/
create or replace procedure insert_pembelian(
  p_id in pembelian.id%type,
  p_kode in pembelian.kode%type,
  p_id_produk in pembelian.id_produk%type,
  p_banyak_produk in pembelian.banyak_produk%type,
  p_harga_produk in pembelian.harga_produk%type,
  p_id_pemasok pembelian.id_pemasok%type
)
as
begin
  insert into pembelian(
    id,
    kode,
    id_produk,
    banyak_produk,
    harga_produk,
    id_pemasok,
    created_at,
    updated_at
  )
  values(
    p_id,
    p_kode,
    p_id_produk,
    p_banyak_produk,
    p_harga_produk,
    p_id_pemasok,
    sysdate,
    sysdate
  );
  commit;
end insert_pembelian;
/
create or replace procedure insert_penjualan(
  p_id in penjualan.id%type,
  p_kode in penjualan.kode%type,
  p_id_produk in penjualan.id_produk%type,
  p_banyak_produk in penjualan.banyak_produk%type,
  p_id_pelanggan penjualan.id_pelanggan%type
)
as
begin
  insert into penjualan(
    id,
    kode,
    id_produk,
    banyak_produk,
    harga_produk,
    id_pelanggan,
    created_at,
    updated_at
  )
  values(
    p_id,
    p_kode,
    p_id_produk,
    p_banyak_produk,
    (select harga from produk where id = p_id_produk),
    p_id_pelanggan,
    sysdate,
    sysdate
  );
  commit;
end insert_penjualan;
/
create or replace procedure insert_produk(
  p_id in produk.id%type,
  p_nama in produk.nama%type
)
as
begin
  insert into produk(
    id,
    nama,
    created_at,
    updated_at
  )
  values(
    p_id,
    p_nama,
    sysdate,
    sysdate
  );
  commit;
end insert_produk;
/
create or replace procedure select_pelanggan_by_id(
  p_id in pelanggan.id%type,
  o_id out pelanggan.id%type,
  o_nama out pelanggan.nama%type,
  o_hp out pelanggan.hp%type,
  o_alamat out pelanggan.alamat%type,
  o_created_at out pelanggan.created_at%type,
  o_updated_at out pelanggan.updated_at%type
)
as
begin
  select
    *
  into
    o_id,
    o_nama,
    o_hp,
    o_alamat,
    o_created_at,
    o_updated_at
  from
    pelanggan
  where
    id = p_id;
end select_pelanggan_by_id;
/
create or replace procedure select_pelanggan_pagination(
  p_page_number in number,
  p_page_size in number,
  c_pagination out sys_refcursor
)
as
begin
  open c_pagination for
  select * from
  (
    select tbl.*, rownum rown
    from
    (
      select * from pelanggan order by id desc
    ) tbl
    where rownum < ((p_page_number * p_page_size) + 1 )
  )
  where rown >= (((p_page_number-1) * p_page_size) + 1);
end select_pelanggan_pagination;
/
create or replace procedure select_pemasok_by_id(
  p_id in pemasok.id%type,
  o_id out pemasok.id%type,
  o_nama out pemasok.nama%type,
  o_hp out pemasok.hp%type,
  o_alamat out pemasok.alamat%type,
  o_created_at out pemasok.created_at%type,
  o_updated_at out pemasok.updated_at%type
)
as
begin
  select
    *
  into
    o_id,
    o_nama,
    o_hp,
    o_alamat,
    o_created_at,
    o_updated_at
  from
    pemasok
  where
    id = p_id;
end select_pemasok_by_id;
/
create or replace procedure select_pemasok_pagination(
  p_page_number in number,
  p_page_size in number,
  c_pagination out sys_refcursor
)
as
begin
  open c_pagination for
  select * from
  (
    select tbl.*, rownum rown
    from
    (
      select * from pemasok order by id desc
    ) tbl
    where rownum < ((p_page_number * p_page_size) + 1 )
  )
  where rown >= (((p_page_number-1) * p_page_size) + 1);
end select_pemasok_pagination;
/
create or replace procedure select_pembelian_by_id(
  p_id in pembelian.id%type,
  o_id out pembelian.id%type,
  o_kode out pembelian.kode%type,
  o_id_produk out pembelian.id_produk%type,
  o_banyak_produk out pembelian.banyak_produk%type,
  o_harga_produk out pembelian.harga_produk%type,
  o_id_pemasok out pembelian.id_pemasok%type,
  o_created_at out pembelian.created_at%type,
  o_updated_at out pembelian.updated_at%type
)
as
begin
  select
    *
  into
    o_id,
    o_kode,
    o_id_produk,
    o_banyak_produk,
    o_harga_produk,
    o_id_pemasok,
    o_created_at,
    o_updated_at
  from
    pembelian
  where id = p_id;
end select_pembelian_by_id;
/
create or replace procedure select_pembelian_by_kode_pagination(
  p_kode in pembelian.kode%type,
  p_page_number in number,
  p_page_size in number,
  c_pagination out sys_refcursor
)
as
begin
  open c_pagination for
  select * from
  (
    select tbl.*, rownum rown
    from
    (
      select * from pembelian where kode = p_kode order by id desc
    ) tbl
    where rownum < ((p_page_number * p_page_size) + 1 )
  )
  where rown >= (((p_page_number-1) * p_page_size) + 1);
end select_pembelian_by_kode_pagination;
/
create or replace procedure select_pembelian_pagination(
  p_page_number in number,
  p_page_size in number,
  c_pagination out sys_refcursor
)
as
begin
  open c_pagination for
  select * from
  (
    select tbl.*, rownum rown
    from
    (
      select * from pembelian order by id desc
    ) tbl
    where rownum < ((p_page_number * p_page_size) + 1 )
  )
  where rown >= (((p_page_number-1) * p_page_size) + 1);
end select_pembelian_pagination;
/
create or replace procedure select_penjualan_by_id(
  p_id in penjualan.id%type,
  o_id out penjualan.id%type,
  o_kode out penjualan.kode%type,
  o_id_produk out penjualan.id_produk%type,
  o_banyak_produk out penjualan.banyak_produk%type,
  o_harga_produk out penjualan.harga_produk%type,
  o_id_pelanggan out penjualan.id_pelanggan%type,
  o_created_at out penjualan.created_at%type,
  o_updated_at out penjualan.updated_at%type
)
as
begin
  select
    *
  into
    o_id,
    o_kode,
    o_id_produk,
    o_banyak_produk,
    o_harga_produk,
    o_id_pelanggan,
    o_created_at,
    o_updated_at
  from
    penjualan
  where id = p_id;
end select_penjualan_by_id;
/
create or replace procedure select_penjualan_by_kode_pagination(
  p_kode in penjualan.kode%type,
  p_page_number in number,
  p_page_size in number,
  c_pagination out sys_refcursor
)
as
begin
  open c_pagination for
  select * from
  (
    select tbl.*, rownum rown
    from
    (
      select * from penjualan where kode = p_kode order by id desc
    ) tbl
    where rownum < ((p_page_number * p_page_size) + 1 )
  )
  where rown >= (((p_page_number-1) * p_page_size) + 1);
end select_penjualan_by_kode_pagination;
/
create or replace procedure select_penjualan_pagination(
  p_page_number in number,
  p_page_size in number,
  c_pagination out sys_refcursor
)
as
begin
  open c_pagination for
  select * from
  (
    select tbl.*, rownum rown
    from
    (
      select * from penjualan order by id desc
    ) tbl
    where rownum < ((p_page_number * p_page_size) + 1 )
  )
  where rown >= (((p_page_number-1) * p_page_size) + 1);
end select_penjualan_pagination;
/
create or replace procedure select_produk_by_id(
  p_id in produk.id%type,
  o_id out produk.id%type,
  o_nama out produk.nama%type,
  o_harga out produk.harga%type,
  o_stok out produk.stok%type,
  o_created_at out produk.created_at%type,
  o_updated_at out produk.updated_at%type
)
as
begin
  select
    *
  into
    o_id,
    o_nama,
    o_harga,
    o_stok,
    o_created_at,
    o_updated_at
  from
    produk
  where
    id = p_id;
end select_produk_by_id;
/
create or replace procedure select_produk_pagination(
  p_page_number in number,
  p_page_size in number,
  c_pagination out sys_refcursor
)
as
begin
  open c_pagination for
  select * from
  (
    select tbl.*, rownum rown
    from
    (
      select * from produk order by id desc
    ) tbl
    where rownum < ((p_page_number * p_page_size) + 1 )
  )
  where rown >= (((p_page_number-1) * p_page_size) + 1);
end select_produk_pagination;
/
create or replace procedure select_produk_where_stok_0_pagination(
  p_page_number in number,
  p_page_size in number,
  c_pagination out sys_refcursor
)
as
begin
  open c_pagination for
  select * from
  (
    select tbl.*, rownum rown
    from
    (
      select * from produk where stok = 0 order by id desc
    ) tbl
    where rownum < ((p_page_number * p_page_size) + 1 )
  )
  where rown >= (((p_page_number-1) * p_page_size) + 1);
end select_produk_where_stok_0_pagination;
/
create or replace procedure update_pelanggan_by_id(
	p_id in pelanggan.id%type,
	p_nama in pelanggan.nama%type,
	p_hp in pelanggan.hp%type,
	p_alamat in pelanggan.alamat%type
)
as
begin
  update
    pelanggan
  set
    nama = p_nama,
    hp = p_hp,
    alamat = p_alamat,
    updated_at = sysdate
  where
    id = p_id;
  commit;
end update_pelanggan_by_id;
/
create or replace procedure update_pemasok_by_id(
	p_id in pemasok.id%type,
	p_nama in pemasok.nama%type,
	p_hp in pemasok.hp%type,
	p_alamat in pemasok.alamat%type
)
as
begin
  update
    pemasok
  set
    nama = p_nama,
    hp = p_hp,
    alamat = p_alamat,
    updated_at = sysdate
  where
    id = p_id;
  commit;
end update_pemasok_by_id;
/
create or replace procedure update_pembelian_by_id(
  p_id in pembelian.id%type,
  p_id_produk in pembelian.id_produk%type,
  p_banyak_produk in pembelian.banyak_produk%type,
  p_harga_produk in pembelian.harga_produk%type,
  p_id_pemasok pembelian.id_pemasok%type
)
as
  v_kode pembelian.kode%type;
  v_created_at pembelian.created_at%type;
begin
  select
    kode,
    created_at
  into
    v_kode,
    v_created_at
  from
    pembelian
  where
    id = p_id;
  delete
    pembelian
  where
    id = p_id;
  insert into pembelian(
    id,
    kode,
    id_produk,
    banyak_produk,
    harga_produk,
    id_pemasok,
    created_at,
    updated_at
  )
  values(
    p_id,
    v_kode,
    p_id_produk,
    p_banyak_produk,
    p_harga_produk,
    p_id_pemasok,
    to_timestamp(v_created_at, 'dd-mon-yyyy hh.mi.ss.FF AM'),
    sysdate
  );
  commit;
end update_pembelian_by_id;
/
create or replace procedure update_penjualan_by_id(
  p_id in penjualan.id%type,
  p_id_produk in penjualan.id_produk%type,
  p_banyak_produk in penjualan.banyak_produk%type,
  p_id_pelanggan penjualan.id_pelanggan%type
)
as
  v_kode penjualan.kode%type;
  v_harga_produk penjualan.harga_produk%type;
  v_created_at penjualan.created_at%type;
begin
  select
    kode,
    harga_produk,
    created_at
  into
    v_kode,
    v_harga_produk,
    v_created_at
  from
    penjualan
  where
    id = p_id;
  delete
    penjualan
  where
    id = p_id;
  insert into penjualan(
    id,
    kode,
    id_produk,
    banyak_produk,
    harga_produk,
    id_pelanggan,
    created_at,
    updated_at
  )
  values(
    p_id,
    v_kode,
    p_id_produk,
    p_banyak_produk,
    v_harga_produk,
    p_id_pelanggan,
    to_timestamp(v_created_at, 'dd-mon-yyyy hh.mi.ss.FF AM'),
    sysdate
  );
  commit;
end update_penjualan_by_id;
/
create or replace procedure update_produk_by_id(
	p_id in produk.id%type,
	p_nama in produk.nama%type,
	p_harga in produk.harga%type
)
as
begin
  update
    produk
  set
    nama = p_nama,
    harga = p_harga,
    updated_at = sysdate
  where
    id = p_id;
  commit;
end update_produk_by_id;
/
create or replace trigger updt_stok_aftr_del_pembelian
after delete on pembelian
for each row
begin
  update
    produk
  set
    stok = stok - :old.banyak_produk
  where
    id = :old.id_produk;
end;
/
create or replace trigger updt_stok_aftr_del_penjualan
after delete on penjualan
for each row
begin
  update
    produk
  set
    stok = stok + :old.banyak_produk
  where
    id = :old.id_produk;
end;
/
create or replace trigger updt_stok_aftr_insrt_pembelian
after insert on pembelian
for each row
begin
  update
    produk
  set
    stok = stok + :new.banyak_produk
  where id = :new.id_produk;
end;
/
create or replace trigger updt_stok_aftr_insrt_penjualan
after insert on penjualan
for each row
begin
  update
    produk
  set
    stok = stok - :new.banyak_produk
  where 
    id = :new.id_produk;
end;
/
