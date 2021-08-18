create or replace procedure insert_pemasok(
  p_nama in pemasok.nama%type,
  p_hp in pemasok.hp%type,
  p_alamat in pemasok.alamat%type
)
as
  v_id pemasok.id%type;
begin
  select max(id) into v_id from pemasok;
  if v_id >= 1 then
    select max(id)+1 into v_id from pemasok;
  else
    v_id := 1;
  end if;
  insert into pemasok(
    id,
    nama,
    hp,
    alamat,
    created_at,
    updated_at
  )
  values(
    v_id,
    p_nama,
    p_hp,
    p_alamat,
    sysdate,
    sysdate
  );
  commit;
end insert_pemasok;
/
