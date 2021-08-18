create or replace procedure select_pembelian_by_id(
  p_id in pembelian.id%type,
  o_id out pembelian.id%type,
  o_kode out pembelian.kode%type,
  o_id_produk out pembelian.id_produk%type,
  o_banyak_produk out pembelian.banyak_produk%type,
  o_harga_produk out pembelian.harga_produk%type,
  o_id_pemasok out pembelian.id_pemasok%type,
  o_created_at out pembelian.created_at%type,
  o_updated_at out pembelian.updated_at%type
)
as
begin
  select
    *
  into
    o_id,
    o_kode,
    o_id_produk,
    o_banyak_produk,
    o_harga_produk,
    o_id_pemasok,
    o_created_at,
    o_updated_at
  from
    pembelian
  where id = p_id;
end select_pembelian_by_id;
/
