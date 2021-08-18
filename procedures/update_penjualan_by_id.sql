create or replace procedure update_penjualan_by_id(
  p_id in penjualan.id%type,
  p_id_produk in penjualan.id_produk%type,
  p_banyak_produk in penjualan.banyak_produk%type,
  p_id_pelanggan penjualan.id_pelanggan%type
)
as
  v_kode penjualan.kode%type;
  v_harga_produk penjualan.harga_produk%type;
  v_created_at penjualan.created_at%type;
begin
  select
    kode,
    harga_produk,
    created_at
  into
    v_kode,
    v_harga_produk,
    v_created_at
  from
    penjualan
  where
    id = p_id;
  delete
    penjualan
  where
    id = p_id;
  insert into penjualan(
    id,
    kode,
    id_produk,
    banyak_produk,
    harga_produk,
    id_pelanggan,
    created_at,
    updated_at
  )
  values(
    p_id,
    v_kode,
    p_id_produk,
    p_banyak_produk,
    v_harga_produk,
    p_id_pelanggan,
    to_timestamp(v_created_at, 'dd-mon-yyyy hh.mi.ss.FF AM'),
    sysdate
  );
  commit;
end update_penjualan_by_id;
/
