create or replace procedure insert_pembelian(
  p_kode in pembelian.kode%type,
  p_id_produk in pembelian.id_produk%type,
  p_banyak_produk in pembelian.banyak_produk%type,
  p_harga_produk in pembelian.harga_produk%type,
  p_id_pemasok pembelian.id_pemasok%type
)
as
  v_id pembelian.id%type;
begin
  select max(id) into v_id from pembelian;
  if v_id >= 1 then
    select max(id)+1 into v_id from pembelian;
  else
    v_id := 1;
  end if;
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
    v_id,
    p_kode,
    p_id_produk,
    p_banyak_produk,
    p_harga_produk,
    p_id_pemasok,
    sysdate,
    sysdate
  );
  commit;
end insert_pembelian;
/
