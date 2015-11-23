CREATE TABLE PKTest ( ID INT PRIMARY KEY ) ;

DECLARE @SQL VARCHAR(4000)
SET @SQL = 'ALTER TABLE PKTEST DROP CONSTRAINT |ConstraintName| '

SET @SQL = REPLACE(@SQL, '|ConstraintName|', ( SELECT   name
                                               FROM     sysobjects
                                               WHERE    xtype = 'PK'
                                                        AND parent_obj = OBJECT_ID('PKTest')
                                             ))

EXEC (@SQL)

DROP TABLE PKTest