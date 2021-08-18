create or replace procedure update_produk_by_id(
	p_id in produk.id%type,
	p_nama in produk.nama%type,
	p_harga in produk.harga%type
)
as
begin
  update
    produk
  set
    nama = p_nama,
    harga = p_harga,
    updated_at = sysdate
  where
    id = p_id;
  commit;
end update_produk_by_id;
/
