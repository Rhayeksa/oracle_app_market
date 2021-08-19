# Oracle App Market

## Deskripsi

Aplikasi Oracle App Market adalah Aplikasi base DBMS, dan DBMS yang digunakaan adalah Oracle 11g. Untuk cara penggunaannya adalah base Procedure(sudah disediakan procedure untuk penggunaan).
Role yang tersedia diantaranya adalah Kasir(Admin), Pelanggan dan Owner.

## Setup Aplikasi

### Download Project

#### Git Clone

- Buka terminal(CMD)
- Pindah ke path yang diinginkan
  ```
  cd {path}\
  ```
- cloning project
  ```
  git clone https://github.com/Rhayeksa/oracle_app_market.git
  ```

#### Download Zip

![1](documentation/download%20project%20zip.png)

---

ON Going

- cara penggunaan procedure bagi setiap role

### import sql

```import sql
if exist import_sql\ rmdir /s /q import_sql\
mkdir import_sql
cd import_sql\
copy ..\tables\*.sql 1.sql
copy ..\tables\master\*.sql 2.sql
copy ..\tables\transaksi\*.sql 3.sql
copy ..\procedures\*.sql 4.sql
copy ..\triggers\*.sql 5.sql
copy *.sql run.sql
sqlplus root/12345 @run.sql
exit
cd ..\
rmdir /s /q import_sql\
```

### dummy data sql

```dummy data
if exist dummy_data\run\ rmdir /s /q dummy_data\run\
cd dummy_data\
mkdir run\
cd run\
copy ..\master\*.sql 1.sql
copy ..\transaksi\*.sql 2.sql
copy *.sql run.sql
sqlplus root/12345 @run.sql
exit
cd ..\..\
rmdir /s /q dummy_data\run
```
