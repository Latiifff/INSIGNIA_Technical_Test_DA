# ISIGNIA Technical Test Data Analyst
## Penjelasan Kode SQL

### `WITH customer_info AS ( ... )`
- Query `WITH` adalah **Common Table Expression (CTE)** yang mendefinisikan subquery yang bisa digunakan di query utama. `customer_info` adalah nama CTE yang didefinisikan.

### `SELECT`
- Query ini bertujuan untuk mengambil kolom-kolom dari tabel data untuk dimasukkan ke dalam CTE `customer_info`.

- **`id`**
  - Mengambil kolom `id` pelanggan dari tabel data. 
- **`CONCAT(first_name, ' ', last_name) AS full_name`**
  - Query `CONCAT` berfungsi untuk menggabungkan nilai kolom `first_name` dan `last_name` dengan spasi di antara keduanya untuk menghasilkan nama lengkap. Hasilnya diberi nama alias `full_name`.

- **`age`**
  - Mengambil kolom `age`, yang menunjukkan usia pelanggan.

- **`IF(gender = 'F', 'Female', IF(gender = 'M', 'Male', gender)) AS gender`**
  - Query `IF` berfungsi untuk mengubah nilai dalam kolom `gender` menjadi format yang lebih deskriptif:
    - Jika `gender` bernilai `'F'`, maka hasilnya adalah `'Female'`.
    - Jika `gender` bernilai `'M'`, maka hasilnya adalah `'Male'`.
    - Jika nilai `gender` bukan `'F'` atau `'M'`, maka nilai aslinya dipertahankan.
  - Hasil akhir diberi nama alias `gender`.

- **`state`**
  - Mengambil kolom `state`, yang menunjukkan negara bagian tempat pelanggan tinggal.

- **`street_address`**
  - Mengambil kolom `street_address`, yang menunjukkan alamat pelanggan.

- **`postal_code`**
  - Mengambil kolom `postal_code`, yang menunjukkan kode pos tempat tinggal pelanggan.

### `CASE`
- Query ini **`CASE`** adalah pernyataan kondisional di SQL yang memungkinkan untuk melakukan logika seperti *if-then-else*. Query ini digunakan untuk menangani kondisi dan memodifikasi nilai kolom berdasarkan kondisi tertentu.

### Kondisi `WHEN`

- **`WHEN postal_code = '69980-000' AND (city IS NULL OR city = 'null') THEN 'Cruzeiro do Sul'`**
  - Jika nilai kolom `postal_code` adalah `'69980-000'` dan kolom `city` bernilai `NULL` atau `'null'`, maka kolom `city` akan diisi dengan `'Cruzeiro do Sul'`.

- **`WHEN postal_code = '57360-000' AND (city IS NULL OR city = 'null') THEN 'Girau do Ponciano'`**
  - Jika nilai kolom `postal_code` adalah `'57360-000'` dan kolom `city` bernilai `NULL` atau `'null'`, maka kolom `city` akan diisi dengan `'Girau do Ponciano'`.
......
  
- **`WHEN postal_code IN ('69980-000', '57360-000', '68924-000', ..., '641-920') AND (city IS NULL OR city = 'null') THEN 'Jeju-si'`**
  - Jika nilai kolom `postal_code` adalah salah satu dari daftar kode pos yang diberikan dan kolom `city` bernilai `NULL` atau `'null'`, maka kolom `city` akan diisi dengan `'Jeju-si'`.
  - Daftar kode pos yang diberikan mencakup banyak nilai, memeriksa apakah `postal_code` termasuk dalam daftar tersebut.

### `ELSE city`
- **`ELSE city`**
  - Jika tidak ada kondisi `WHEN` yang terpenuhi, maka nilai kolom `city` akan tetap seperti nilai aslinya.

### `AS city`
- **`AS city`**
  - Query ini memberi alias pada kolom hasil dari pernyataan `CASE`. Nama kolom hasil ini akan tetap `city`, menggantikan nilai asli dari kolom `city` jika kondisi `CASE` terpenuhi.

- **`country`**
  - Mengambil kolom `country`, yang menunjukkan negara pelanggan.

- **`latitude`**
  - Mengambil kolom `latitude`, yang menunjukkan latitude lokasi pelanggan.

- **`longitude`**
  - Mengambil kolom `longitude`, yang menunjukkan longitude lokasi pelanggan.

- **`traffic_source`**
  - Mengambil kolom `traffic_source`, yang menunjukkan sumber atau bagaimana pelanggan menemukan situs web atau aplikasi.

- **`created_at`**
  - Mengambil kolom `created_at`, yang menunjukkan tanggal dan waktu (timestamp) saat entri data dibuat.

- **`EXTRACT(YEAR FROM created_at) AS year`**
  - Query `EXTRACT` berfungsi untuk mengambil tahun dari kolom `created_at`. Hasilnya diberi nama alias `year`.

- **`EXTRACT(MONTH FROM created_at) AS month`**
  - Query `EXTRACT` berfungsi untuk mengambil bulan dari kolom `created_at`. Hasilnya diberi nama alias `month`.

### `FROM`
- Query **`FROM`** adalah klausa SQL yang digunakan untuk menentukan tabel dari mana data akan diambil.

- **`` `bigquery-public-data.thelook_ecommerce.users` ``**
  - Tabel ini adalah sumber data yang digunakan dalam query.
  - **`bigquery-public-data`**: Nama dataset publik di Google BigQuery.
  - **`thelook_ecommerce`**: Nama dataset dalam BigQuery yang berisi data terkait e-commerce untuk The Look.
  - **`users`**: Nama tabel dalam dataset yang berisi informasi pengguna.
 
### CTE Kedua: `report_monthly_orders_product_agg`

CTE ini (Common Table Expression) mendefinisikan `report_monthly_orders_product_agg` untuk menghasilkan ringkasan data berdasarkan bulan dan tahun.

### `SELECT`

- **`year`**
  - Mengambil kolom `year` dari CTE sebelumnya. Ini merupakan tahun ekstraksi dari kolom `created_at`.

- **`month`**
  - Mengambil kolom `month` dari CTE sebelumnya. Ini merupakan bulan ekstraksi dari kolom `created_at`.

- **`state`**
  - Mengambil kolom `state` yang menunjukkan negara bagian pelanggan.

- **`country`**
  - Mengambil kolom `country` yang menunjukkan negara pelanggan.

- **`traffic_source`**
  - Mengambil kolom `traffic_source` yang menunjukkan sumber atau bagaimana pelanggan menemukan situs web atau aplikasi.

- **`COUNT(*) AS total_orders`**
  - Query `COUNT` berfungsi untuk menghitung jumlah total pesanan (baris) untuk setiap grup (tahun, bulan, state, country, traffic_source). Hasilnya diberi nama alias `total_orders`.

- **`COUNT(DISTINCT id) AS new_customers`**
  - Query `COUNT` berfungsi untuk menghitung jumlah pelanggan unik berdasarkan `id` untuk setiap grup. 
  - **`DISTINCT id`** memastikan bahwa hanya nilai unik dari kolom `id` yang dihitung. Artinya, jika ada beberapa baris dengan `id` yang sama, `COUNT(DISTINCT id)` hanya akan menghitung satu kali untuk setiap nilai unik dari `id`.
  - Hasilnya diberi nama alias `new_customers`.

- **`ROUND(AVG(age), 2) AS avg_age`**
  - - **`ROUND`** adalah query SQL yang digunakan untuk membulatkan nilai numerik ke jumlah tempat desimal tertentu.
- Dalam konteks **`ROUND(AVG(age), 2)`**:
  - **`AVG(age)`** menghitung rata-rata usia.
  - **`ROUND(..., 2)`** membulatkan hasil rata-rata usia tersebut hingga dua tempat desimal. Hal ini memastikan bahwa hasil rata-rata usia ditampilkan dengan presisi hingga dua angka di belakang koma, membuatnya lebih mudah dibaca dan konsisten dalam laporan.
  - Hasilnya diberi nama alias `avg_age`.

### `FROM`

- **`customer_info`**
  - Query ini mengambil data dari CTE `customer_info` yang sebelumnya didefinisikan.

### `GROUP BY`
- **`year, month, state, country, traffic_source`**
  - Query ini mengelompokkan hasil berdasarkan kolom `year`, `month`, `state`, `country`, dan `traffic_source`. Ini memastikan bahwa perhitungan seperti `COUNT` dan `AVG` dilakukan dalam konteks grup yang ditentukan.

## Menampilkan Tabel dari CTE
### Query 1: Menampilkan Data dari `customer_info`
```sql
SELECT * FROM customer_info

```
### Query 2: Menampilkan Data dari `report_monthly_orders_product_agg` 
```sql
SELECT * FROM report_monthly_orders_product_agg
ORDER BY
  year DESC, month DESC
```
- Query **`ORDER BY`** adalah klausa SQL yang digunakan untuk mengurutkan hasil query berdasarkan satu atau lebih kolom.
- Klausa ini memungkinkan untuk mengatur data yang ditampilkan dalam urutan tertentu, baik secara menaik (ascending) atau menurun (descending).
