-- Abfragestatistiken

	SELECT TOP 1000 --st.text,
		REPLACE(REPLACE(REPLACE(SUBSTRING(st.text, (qs.statement_start_offset/2) + 1,
		((CASE statement_end_offset 
			WHEN -1 THEN DATALENGTH(st.text)
			ELSE qs.statement_end_offset END 
				- qs.statement_start_offset)/2) + 1),CHAR(13),' '),CHAR(10),' '),CHAR(9),' ') as statement_text,
		execution_count,
		  case  
			when execution_count = 0 then null
			else total_logical_reads/execution_count 
		  end as avg_logical_reads, 
		  min_logical_reads,
		  max_logical_reads,
		  max_elapsed_time / 1000 as max_elapsed_time,
		  case  
			when execution_count = 0 then null
			else total_elapsed_time/execution_count / 1000
		  end as avg_elapsed_time, 
		  case 
			when min_logical_reads = 0 then null
			else max_logical_reads / min_logical_reads 
		  end as diff_quota,
		creation_time,
		last_execution_time,
		total_physical_reads,
		total_logical_reads,
		last_logical_writes,
		total_elapsed_time / 1000 as total_elapsed_time
	FROM sys.dm_exec_query_stats as qs
	OUTER APPLY sys.dm_exec_sql_text(qs.sql_handle) as st
	--WHERE st.text like '%TreeControl%'

    -- Abfragen mit dem höchsten Zeitverbrauch
	--ORDER BY total_elapsed_time desc

	-- Abfragen mit den meisten Aufrufen
	order by execution_count desc

