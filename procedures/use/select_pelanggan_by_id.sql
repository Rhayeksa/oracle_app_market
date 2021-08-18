set serveroutput on;
declare
  p_id number := 1;
  o_id pelanggan.id%type;
  o_nama pelanggan.nama%type;
  o_hp pelanggan.hp%type;
  o_alamat pelanggan.alamat%type;
  o_created_at pelanggan.created_at%type;
  o_updated_at pelanggan.updated_at%type;
begin
    select_pelanggan_by_id(
      p_id, o_id, 
      o_nama, 
      o_hp, 
      o_alamat, 
      o_created_at, 
      o_updated_at
    );
    sys.dbms_output.put_line('ID : '||o_id);
    sys.dbms_output.put_line('Nama : '||o_nama);
    sys.dbms_output.put_line('Hp : '||o_hp);
    sys.dbms_output.put_line('Alamat : '||o_alamat);
    sys.dbms_output.put_line('Created At : '||o_created_at);
    sys.dbms_output.put_line('Updated At : '||o_updated_at);
end;