create or replace procedure select_penjualan_by_kode_pages(
  p_kode in penjualan.kode%type,
  p_page_number in number,
  p_page_size in number,
  c_pagination out sys_refcursor
)
as
begin
  open c_pagination for
  select * from
  (
    select tbl.*, rownum rown
    from
    (
      select * from penjualan where kode = p_kode order by id desc
    ) tbl
    where rownum < ((p_page_number * p_page_size) + 1 )
  )
  where rown >= (((p_page_number-1) * p_page_size) + 1);
end select_penjualan_by_kode_pages;
/
