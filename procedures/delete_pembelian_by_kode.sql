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
