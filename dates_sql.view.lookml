- view: numbers_sql
  derived_table: 
    persist_for: 500 hours
    indexes: [number]
    sql: |
      SELECT 
        p0.n 
        + p1.n*2 
        + p2.n * POWER(2,2) 
        + p3.n * POWER(2,3)
        + p4.n * POWER(2,4)
        + p5.n * POWER(2,5)
        + p6.n * POWER(2,6)
        + p7.n * POWER(2,7)
        + p8.n * POWER(2,8)
        + p9.n * POWER(2,9)
        + p10.n * POWER(2,10)
        + p11.n * POWER(2,11)
        + p12.n * POWER(2,12)
        + p13.n * POWER(2,13)
        as number
      FROM 
        (SELECT 0 as n UNION SELECT 1) p0,
        (SELECT 0 as n UNION SELECT 1) p1,
        (SELECT 0 as n UNION SELECT 1) p2,
        (SELECT 0 as n UNION SELECT 1) p3,
        (SELECT 0 as n UNION SELECT 1) p4,
        (SELECT 0 as n UNION SELECT 1) p5,
        (SELECT 0 as n UNION SELECT 1) p6,
        (SELECT 0 as n UNION SELECT 1) p7,
        (SELECT 0 as n UNION SELECT 1) p8,
        (SELECT 0 as n UNION SELECT 1) p9,
        (SELECT 0 as n UNION SELECT 1) p10,
        (SELECT 0 as n UNION SELECT 1) p11,
        (SELECT 0 as n UNION SELECT 1) p12,
        (SELECT 0 as n UNION SELECT 1) p13
  fields:
  - dimension: number
    primary_key: true
    type: number

- view: dates_sql
  derived_table:
    persist_for: 5 hours
    indexes: [series_date]
    sql: |
      SELECT
          DATE_ADD('2001-01-01', INTERVAL numbers.number DAY) 
        as series_date
      FROM ${numbers_mysql.SQL_TABLE_NAME} AS numbers 
  fields:
  - dimension: series_date
    type: date