create or replace procedure insert_produk(
  p_nama in produk.nama%type
)
as
  v_id produk.id%type;
begin
  select max(id) into v_id from produk;
  if v_id >= 1 then
    select max(id)+1 into v_id from produk;
  else
    v_id := 1;
  end if;
  insert into produk(
    id,
    nama,
    created_at,
    updated_at
  )
  values(
    v_id,
    p_nama,
    sysdate,
    sysdate
  );
  commit;
end insert_produk;
/
