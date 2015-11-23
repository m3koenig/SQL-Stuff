-- Disk I/O

SELECT 
	num_of_reads, 
	CASE WHEN num_of_reads > 0 THEN io_stall_read_ms/num_of_reads ELSE 0 END avg_ms_read, 
	num_of_writes, 
	CASE WHEN num_of_writes > 0 THEN io_stall_write_ms/num_of_writes ELSE 0 END avg_ms_write,
	df.name, 
	df.physical_name,
	df.size,
	num_of_reads,
	num_of_writes,
	io_stall_read_ms,
	io_stall_write_ms,
	size_on_disk_bytes
--	,fs.* 
--	,df.*
FROM sys.dm_io_virtual_file_stats(DB_ID(), NULL) fs
INNER JOIN sys.database_files df
ON  fs.file_id = df.file_id
GO