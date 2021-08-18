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
