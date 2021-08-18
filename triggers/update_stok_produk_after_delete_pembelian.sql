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
