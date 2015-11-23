-- Missing Index Statistiken

select 
 a.user_seeks, 
 a.avg_total_user_cost, 
 a.avg_user_impact [Perc Improvement],
 c.statement,
 c.equality_columns,
 c.inequality_columns,
 c.included_columns,
 user_seeks * avg_total_user_cost as TotalCost
from 
 sys.dm_db_missing_index_group_stats as a 
	join  sys.dm_db_missing_index_groups as b on a.group_handle = b.index_group_handle
	join sys.dm_db_missing_index_details as c on b.index_handle = c.index_handle
--WHERE c.statement like '_NAV2013R2_%'
order by 
 TotalCost desc
 

 