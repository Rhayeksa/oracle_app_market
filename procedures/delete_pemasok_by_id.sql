create or replace procedure delete_pemasok_by_id(
  p_id in pemasok.id%type
)
as
begin
  delete
    pemasok
  where
    id = p_id;
  commit;
end delete_pemasok_by_id;
/
