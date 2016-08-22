- view: social_twitter_trending
  sql_table_name: publications.social_twitter_trending
  fields:

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: query
    type: string
    sql: ${TABLE}.query

  - dimension: url
    type: string
    sql: ${TABLE}.url

  - dimension: woeid
    type: string
    sql: ${TABLE}.woeid

  - measure: count
    type: count
    drill_fields: [name]

