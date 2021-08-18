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
