BACKUP DATABASE [NAV2009R2] 
TO DISK = N'D:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\Backup\Echt2Entwicklung.bak'
with INIT, FORMAT 
GO
RESTORE FILELISTONLY 
   FROM DISK = N'D:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\Backup\Echt2Entwicklung.bak' 
GO
RESTORE DATABASE [NAV2009R2-Entwicklung] 
   FROM DISK = N'D:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\Backup\Echt2Entwicklung.bak' 
   WITH MOVE 'NAV2009R2_Data' TO 'D:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\NAV2009R2-Entwicklung_Data.mdf',
   MOVE 'NAV2009R2_1_Data' TO 'D:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\NAV2009R2-Entwicklung_1_Data.mdf',
   MOVE 'NAV2009R2_Log' TO 'D:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\NAV2009R2-Entwicklung_Log.ldf', 
   REPLACE
GO