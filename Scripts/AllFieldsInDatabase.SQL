select *
from information_schema.columns
WHERE COLUMN_NAME = 'msrepl_tran_version'
order by table_name, ordinal_position
