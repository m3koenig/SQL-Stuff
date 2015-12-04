SELECT 'GRANT EXECUTE ON [dbo].[' + name + '] TO [public]'
FROM sys.objects
WHERE type='P' or type='FN'
