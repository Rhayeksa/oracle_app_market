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
