# - view: trump
#   derived_table:
#     sql: |
#       SELECT
#         customer_id,
#         email_address,
#         email_permission_status,
#         city,
#         postal_code,
#         ,
#         ,
#         
#       FROM bauer_list
#       LEFT JOIN ${sessions_geo.SQL_TABLE_NAME} AS g
#         ON  b.domain_userid = g.domain_userid
#         AND b.domain_sessionidx = g.domain_sessionidx
#       LEFT JOIN ${sessions_landing_page.SQL_TABLE_NAME} AS l
#         ON  b.domain_userid = l.domain_userid
#         AND b.domain_sessionidx = l.domain_sessionidx
#       LEFT JOIN ${sessions_exit_page.SQL_TABLE_NAME} AS e
#         ON  b.domain_userid = e.domain_userid
#         AND b.domain_sessionidx = e.domain_sessionidx
#       LEFT JOIN ${sessions_source.SQL_TABLE_NAME} AS s
#         ON  b.domain_userid = s.domain_userid
#         AND b.domain_sessionidx = s.domain_sessionidx
#       LEFT JOIN ${sessions_technology.SQL_TABLE_NAME} AS t
#         ON  b.domain_userid = t.domain_userid
#         AND b.domain_sessionidx = t.domain_sessionidx
# 
