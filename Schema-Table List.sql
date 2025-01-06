


select s.name SCHEMA_NAME, t.name TABLE_NAME
from sys.tables t
join sys.schemas s 
	on s.schema_id = t.schema_id
