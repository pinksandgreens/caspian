- view: social_spike
  sql_table_name: publications.social_spike
  fields:

  - dimension: title
    type: string
    sql: ${TABLE}.title
    
        # CASE
        #   WHEN ${TABLE}.title ILIKE '%a%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%b%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%c%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%d%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%e%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%f%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%g%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%h%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%i%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%j%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%k%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%l%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%m%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%n%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%o%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%p%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%q%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%r%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%s%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%t%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%u%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%v%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%w%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%x%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%y%' THEN ${TABLE}.title
        #   WHEN ${TABLE}.title ILIKE '%z%' THEN ${TABLE}.title
        #   ELSE NULL
        # END

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
