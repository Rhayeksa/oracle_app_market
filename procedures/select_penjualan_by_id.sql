create or replace procedure select_penjualan_by_id(
  p_id in penjualan.id%type,
  o_id out penjualan.id%type,
  o_kode out penjualan.kode%type,
  o_id_produk out penjualan.id_produk%type,
  o_banyak_produk out penjualan.banyak_produk%type,
  o_harga_produk out penjualan.harga_produk%type,
  o_id_pelanggan out penjualan.id_pelanggan%type,
  o_created_at out penjualan.created_at%type,
  o_updated_at out penjualan.updated_at%type
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
    o_id_pelanggan,
    o_created_at,
    o_updated_at
  from
    penjualan
  where id = p_id;
end select_penjualan_by_id;
/
