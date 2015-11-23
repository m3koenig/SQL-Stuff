--CREATE VIEW IndexUsageProt as
select s.*,
       o.name Tabelle, 
       i.name 'Index', 
       CAST(user_seeks as Int) user_seeks,
       CAST(user_scans as INT) user_scans,
       CAST(user_lookups as INT) user_lookups,
       CAST(user_updates as INT) user_updates,
       COnvert(Varchar(20),last_user_seek,20) last_user_seek,
       COnvert(Varchar(20),last_user_scan,20) last_user_scan,
       COnvert(Varchar(20),last_user_lookup,20) last_user_lookup,
       COnvert(Varchar(20),last_user_update,20) last_user_update,
       CAST(system_seeks as Int) system_seeks,
       CAST(system_scans as INT) system_scans,
       CAST(system_lookups as INT) system_lookups,
       CAST(system_updates as INT) system_updates,   
       COnvert(Varchar(20),last_system_seek,20) last_system_seek,
       COnvert(Varchar(20),last_system_scan,20) last_system_scan,
       COnvert(Varchar(20),last_system_lookup,20) last_system_lookup,
       COnvert(Varchar(20),last_system_update,20) last_system_update,
       d.name Datenbank,
       s.database_id database_id,
       s.object_id object_id,
       s.index_id index_id
from sys.dm_db_index_usage_stats s,
     sys.sysobjects o,
     sys.sysindexes i,
     sys.sysdatabases d
where o.id = s.object_id 
  and i.id = s.object_id
  and i.indid = s.index_id
  and d.dbid = s.database_id
  and s.database_id = DB_ID()
--  and o.name like '%VSIFT%'
