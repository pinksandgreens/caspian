- view: date_table
  sql_table_name: |
      (SELECT
        @basedate = '2016/01/01',
        @offset = 1
        WHILE (@offset < 365)
        BEGIN
          INSERT INTO SQL_TABLE_NAME SELECT DATEADD(MONTH, @offset, date) FROM SQL_TABLE_NAME
          SELECT @offset = @offset + @offset
        END)

      