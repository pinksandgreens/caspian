- view: social_spike
  sql_table_name: publications.social_spike
  fields:

  - dimension: title
    type: string
    sql: ${TABLE}.title

  - dimension: link
    type: string
    sql: ${TABLE}.link
  
  - dimension: type
    type: string
    sql: ${TABLE}.category
    
  - measure: facebook_interactions
    type: sum
    sql: ${TABLE}.facebook_interactions
    
  - measure: twitter_retweets
    type: sum
    sql: ${TABLE}.twitter_retweets
    
  - measure: current_velocity
    type: sum
    value_format: '0.00#'  
    sql: ${TABLE}.current_velocity

  - measure: highest_velocity
    type: sum
    value_format: '0.00#'  
    sql: ${TABLE}.highest_velocity
    
#   - measure: velocity_index
#     type: number
#     value_format: '0.00#'  
#     sql: ${highest_velocity}/${current_velocity}
