-- http://blogs.msdn.com/b/deepakbi/archive/2010/03/02/issues-with-updatable-subscriptions-for-transactional-replication.aspx
SELECT 'ALTER TABLE '+ s.name+ '.['+ OBJECT_NAME(o.parent_object_id) + ']    DROP CONSTRAINT ' + o.name
FROM sys.objects o
INNER JOIN sys.schemas s ON o.schema_id = s.schema_id
WHERE o.name LIKE '%MSrepl_tran_version_default%'


SELECT 'ALTER TABLE '+TABLE_SCHEMA+'.['+TABLE_NAME + '] DROP COLUMN msrepl_tran_version'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME ='msrepl_tran_version'

