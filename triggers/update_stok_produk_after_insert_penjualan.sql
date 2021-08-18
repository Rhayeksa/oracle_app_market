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
