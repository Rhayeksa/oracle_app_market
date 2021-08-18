create or replace procedure update_pelanggan_by_id(
	p_id in pelanggan.id%type,
	p_nama in pelanggan.nama%type,
	p_hp in pelanggan.hp%type,
	p_alamat in pelanggan.alamat%type
)
as
begin
  update
    pelanggan
  set
    nama = p_nama,
    hp = p_hp,
    alamat = p_alamat,
    updated_at = sysdate
  where
    id = p_id;
  commit;
end update_pelanggan_by_id;
/
