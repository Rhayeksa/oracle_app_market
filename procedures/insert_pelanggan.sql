create or replace procedure insert_pelanggan(
  p_nama in pelanggan.nama%type,
  p_hp in pelanggan.hp%type,
  p_alamat in pelanggan.alamat%type
)
as
  v_id pelanggan.id%type;
begin
  select max(id) into v_id from pelanggan;
  if v_id >= 1 then
    select max(id)+1 into v_id from pelanggan;
  else
    v_id := 1;
  end if;
  insert into pelanggan(
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
end insert_pelanggan;
/
