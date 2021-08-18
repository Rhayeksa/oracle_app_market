create or replace procedure update_pembelian_by_id(
  p_id in pembelian.id%type,
  p_id_produk in pembelian.id_produk%type,
  p_banyak_produk in pembelian.banyak_produk%type,
  p_harga_produk in pembelian.harga_produk%type,
  p_id_pemasok pembelian.id_pemasok%type
)
as
  v_kode pembelian.kode%type;
  v_created_at pembelian.created_at%type;
begin
  select
    kode,
    created_at
  into
    v_kode,
    v_created_at
  from
    pembelian
  where
    id = p_id;
  delete
    pembelian
  where
    id = p_id;
  insert into pembelian(
    id,
    kode,
    id_produk,
    banyak_produk,
    harga_produk,
    id_pemasok,
    created_at,
    updated_at
  )
  values(
    p_id,
    v_kode,
    p_id_produk,
    p_banyak_produk,
    p_harga_produk,
    p_id_pemasok,
    to_timestamp(v_created_at, 'dd-mon-yyyy hh.mi.ss.FF AM'),
    sysdate
  );
  commit;
end update_pembelian_by_id;
/
