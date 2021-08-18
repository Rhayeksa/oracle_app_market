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
