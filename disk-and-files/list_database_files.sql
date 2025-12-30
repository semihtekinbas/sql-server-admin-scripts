/* 
Amaç:
SQL Server üzerindeki tüm veritabanlarının data ve log dosyalarının
fiziksel konumu, tipi ve boyut bilgilerini listelemek.

Kullanım Senaryoları:
- Disk kullanım analizi
- Data / Log dosyalarının farklı disklerde olup olmadığını kontrol
- Taşıma (file move) öncesi envanter çıkarma
- Backup & DR planlaması

Not:
SQL Server 2012+
*/

SELECT  
    DB_NAME(mf.database_id) AS database_name,
    mf.name AS logical_file_name,
    mf.type_desc AS file_type,
    mf.physical_name,
    CAST(mf.size * 8 / 1024 AS DECIMAL(10,2)) AS size_mb
FROM sys.master_files mf
ORDER BY mf.database_id, mf.type_desc;
