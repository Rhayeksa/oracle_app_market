create or replace procedure select_pelanggan_by_id(
  p_id in pelanggan.id%type,
  o_id out pelanggan.id%type,
  o_nama out pelanggan.nama%type,
  o_hp out pelanggan.hp%type,
  o_alamat out pelanggan.alamat%type,
  o_created_at out pelanggan.created_at%type,
  o_updated_at out pelanggan.updated_at%type
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
    pelanggan
  where
    id = p_id;
end select_pelanggan_by_id;
/
