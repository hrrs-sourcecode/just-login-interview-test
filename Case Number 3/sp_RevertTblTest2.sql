create procedure sp_RevertTblTest2 @id int, @column char(1)
as 
 
begin
 if (object_id('tempdb..##tblInitialValues') is not null) drop table ##tblInitialValues

 declare @sqlQueryCreateTempTable varchar(1000), @sqlQueryRevertToInitialValuesByIdAndColumnName varchar(1000)
 set @sqlQueryCreateTempTable = 'CREATE TABLE ##tblInitialValues ([Id] INT, [A] BIT, [B] BIT, [C] BIT, [D] BIT, [E] BIT);'
 set @sqlQueryCreateTempTable += 'INSERT INTO ##tblInitialValues ([Id], [A], [C], [E]) VALUES (1, ''true'', ''false'', ''true'');'
 set @sqlQueryCreateTempTable += 'INSERT INTO ##tblInitialValues ([Id], [A], [B], [C]) VALUES (2, ''true'', ''true'', ''true'');'
 set @sqlQueryCreateTempTable += 'INSERT INTO ##tblInitialValues ([Id], [C], [D], [E]) VALUES (1, ''false'', ''false'', ''true'');'
 set @sqlQueryRevertToInitialValuesByIdAndColumnName = 'update #TEST2 set ' + @column + ' = (select top 1 ' + @column + ' from ##tblInitialValues where id = ' +  CONVERT(varchar(10), @id) + ' and ' + @column + ' is not null)' +  ' where id = ' + CONVERT(varchar(10), @id) + ' and ' + @column +' is not null'
 exec (@sqlQueryCreateTempTable)
 --print ( @sqlQueryRevertToInitialValuesByIdAndColumnName)
 exec (@sqlQueryRevertToInitialValuesByIdAndColumnName)
 drop table ##tblInitialValues
end

go