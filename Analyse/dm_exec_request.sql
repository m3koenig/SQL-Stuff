
--SQL 2000
--DECLARE @Handle binary(20)
--SELECT @Handle = sql_handle FROM sysprocesses WHERE spid = <spid>
--SELECT * FROM ::fn_get_sql(@Handle) 
--GO

--SQL 2005
DECLARE @Handle varbinary(64);
SELECT @Handle = sql_handle 
FROM sys.dm_exec_requests WHERE session_id = 52 and request_id = 0;
SELECT * FROM ::fn_get_sql(@Handle);
GO

