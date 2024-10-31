USE [master];
RESTORE DATABASE [AdventureWorks2022]
FROM DISK = '/AdventureWorks2022.bak'
WITH
    MOVE 'AdventureWorks2022' TO '/var/opt/mssql/data/AdventureWorks2022_Data.mdf',
    MOVE 'AdventureWorks2022_log' TO '/var/opt/mssql/data/AdventureWorks2022_log.ldf',
    FILE = 1,
    NOUNLOAD,
    STATS = 5;

EXEC sys.sp_cdc_enable_db

EXEC sys.sp_cdc_enable_table
    @source_schema = N'Sales',
    @source_name   = N'SalesOrderDetail',
    @role_name     = N'admin',
    @supports_net_changes = 1
