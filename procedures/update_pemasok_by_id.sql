create or replace procedure update_pemasok_by_id(
	p_id in pemasok.id%type,
	p_nama in pemasok.nama%type,
	p_hp in pemasok.hp%type,
	p_alamat in pemasok.alamat%type
)
as
begin
  update
    pemasok
  set
    nama = p_nama,
    hp = p_hp,
    alamat = p_alamat,
    updated_at = sysdate
  where
    id = p_id;
  commit;
end update_pemasok_by_id;
/
