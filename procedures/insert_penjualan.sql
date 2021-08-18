create or replace procedure insert_penjualan(
  p_kode in penjualan.kode%type,
  p_id_produk in penjualan.id_produk%type,
  p_banyak_produk in penjualan.banyak_produk%type,
  p_harga_produk in penjualan.harga_produk%type,
  p_id_pelanggan penjualan.id_pelanggan%type
)
as
  v_id penjualan.id%type;
begin
  select max(id) into v_id from penjualan;
  if v_id >= 1 then
    select max(id)+1 into v_id from penjualan;
  else
    v_id := 1;
  end if;
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
    v_id,
    p_kode,
    p_id_produk,
    p_banyak_produk,
    p_harga_produk,
    p_id_pelanggan,
    sysdate,
    sysdate
  );
  commit;
end insert_penjualan;
/
