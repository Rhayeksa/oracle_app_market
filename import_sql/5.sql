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