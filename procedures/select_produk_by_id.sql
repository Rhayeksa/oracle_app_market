create or replace procedure select_produk_by_id(
  p_id in produk.id%type,
  o_id out produk.id%type,
  o_nama out produk.nama%type,
  o_harga out produk.harga%type,
  o_stok out produk.stok%type,
  o_created_at out produk.created_at%type,
  o_updated_at out produk.updated_at%type
)
as
begin
  select
    *
  into
    o_id,
    o_nama,
    o_harga,
    o_stok,
    o_created_at,
    o_updated_at
  from
    produk
  where
    id = p_id;
end select_produk_by_id;
/
