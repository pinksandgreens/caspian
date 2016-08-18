- view: responsys_emailable_base
  derived_table:
    sql: |
      SELECT
        c.concat_id
        c.email_address
      FROM (
        SELECT
          
        FROM snowplow.events AS a
        INNER JOIN ${sessions_basic.SQL_TABLE_NAME} AS b
          ON  a.domain_userid = b.domain_userid
          AND a.domain_sessionidx = b.domain_sessionidx
          AND a.dvce_created_tstamp = b.dvce_min_tstamp
        GROUP BY 1,2,3,4,5 -- Aggregate identital rows (that happen to have the same dvce_tstamp)
      ) AS c
      WHERE c.rank = 1 -- If there are different rows with the same dvce_tstamp, rank and pick the first row
    
    sql_trigger_value: SELECT FLOOR(EXTRACT(epoch from GETDATE()) / (4*60*60))
    distkey: domain_userid
    sortkeys: [domain_userid, domain_sessionidx]