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
