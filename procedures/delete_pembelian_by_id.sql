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
