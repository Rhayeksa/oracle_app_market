create or replace procedure select_pemasok_by_id(
  p_id in pemasok.id%type,
  o_id out pemasok.id%type,
  o_nama out pemasok.nama%type,
  o_hp out pemasok.hp%type,
  o_alamat out pemasok.alamat%type,
  o_created_at out pemasok.created_at%type,
  o_updated_at out pemasok.updated_at%type
)
as
begin
  select
    *
  into
    o_id,
    o_nama,
    o_hp,
    o_alamat,
    o_created_at,
    o_updated_at
  from
    pemasok
  where
    id = p_id;
end select_pemasok_by_id;
/
