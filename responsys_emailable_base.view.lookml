- view: responsys_emailable_base
  derived_table:
    sql: |
      SELECT b.email_address
      FROM  publications.bauer_list b
      INNER JOIN responsys.responsys_exclusion_list r
      ON r.email_address_ = b.email_address

    sql_trigger_value: SELECT FLOOR(EXTRACT(epoch from GETDATE()) / (4*60*60))
    distkey: email_address
    sortkeys: [email_address]

  fields:

  - dimension: email_address
    hidden: TRUE
    type: string
    sql: ${TABLE}.email_address
  
  - measure: registered_users_count
    label: 'Users Count'
    type: count_distinct
    sql: ${TABLE}.email_address
    html: |
       <font color="green">{{ rendered_value }}</font>

#   - dimension: AGE_IS_NULL
#     label: 'AGE IS NULL'
#     hidden: FALSE
#     type: string
#     sql: |
#      CASE
#       WHEN ${TABLE}.age IS NULL THEN '0'
#       WHEN ${TABLE}.age = '' THEN '0'
#       WHEN ${TABLE}.age = ' ' THEN '0'
#       ELSE '1'
#      END
# 
  - measure: Percent_of_Total
    type: percent_of_total
    sql: ${registered_users_count}
#     html: |
#       {% if value > 30 %}
#       <font color="red">{{ rendered_value }}</font>
#       {% elsif value < 30 %}
#         <font color="darkgreen">{{ rendered_value }}</font>
#       {% else %}
#         <font color="black">{{ rendered_value }}</font>
#       {% endif %}