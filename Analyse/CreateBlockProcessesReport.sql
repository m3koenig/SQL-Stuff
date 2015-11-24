CREATE EVENT SESSION [My Blocked Process Report] ON SERVER 
ADD EVENT sqlserver.blocked_process_report 
ADD TARGET package0.event_file(SET filename=N'E:\NAV-LOG\My Blocked Process Report.xel')
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)
GO

exec sp_configure 'show advanced options',1;
go 
reconfigure
go
exec sp_configure 'blocked process threshold',5;
go
reconfigure
go

