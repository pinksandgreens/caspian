- view: es_competition_entries
  sql_table_name: publications.es_competition_entries
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: account_id
    type: string
    sql: ${TABLE}.account_id

  - dimension: account_name
    type: string
    sql: ${TABLE}.account_name

  - dimension: action
    type: string
    sql: ${TABLE}.action

  - dimension: channel
    type: string
    sql: ${TABLE}.channel

  - dimension: competition_id
    type: string
    sql: ${TABLE}.competition_id

  - dimension: couponcode
    type: string
    sql: ${TABLE}.couponcode

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_date

  - dimension_group: date_created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_created

  - dimension_group: date_entered
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_entered

  - dimension: entry_status
    type: string
    sql: ${TABLE}.entry_status

  - dimension: entrytype
    type: string
    sql: ${TABLE}.entrytype

  - dimension: flags
    type: string
    sql: ${TABLE}.flags

  - dimension: ip
    type: string
    sql: ${TABLE}.ip

  - dimension: medium
    type: string
    sql: ${TABLE}.medium

  - dimension: mode
    type: string
    sql: ${TABLE}.mode

  - dimension: network
    type: string
    sql: ${TABLE}.network

  - dimension: quizcategory
    type: string
    sql: ${TABLE}.quizcategory

  - dimension: quizscore
    type: number
    sql: ${TABLE}.quizscore

  - dimension: referrals
    type: number
    sql: ${TABLE}.referrals

  - dimension: shares
    type: number
    sql: ${TABLE}.shares

  - dimension: source_user_avatar
    type: string
    sql: ${TABLE}.source_user_avatar

  - dimension: source_user_link
    type: string
    sql: ${TABLE}.source_user_link

  - dimension: source_user_name
    type: string
    sql: ${TABLE}.source_user_name

  - dimension: t_and_c
    type: yesno
    sql: ${TABLE}.t_and_c

  - dimension: timezone
    type: string
    sql: ${TABLE}.timezone

  - dimension: ugccomment
    type: string
    sql: ${TABLE}.ugccomment

  - dimension: ugcimage
    type: string
    sql: ${TABLE}.ugcimage

  - dimension: ugcoriginlink
    type: string
    sql: ${TABLE}.ugcoriginlink

  - dimension: ugcthumbnail
    type: string
    sql: ${TABLE}.ugcthumbnail

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_date

  - dimension: user_id
    type: string
    sql: ${TABLE}.user_id

  - dimension: useragent
    type: string
    sql: ${TABLE}.useragent

  - measure: entries_count
    type: count_distinct
    sql: ${id}
    drill_fields: [id, account_name, source_user_name]
    
  - measure: competitions_count
    type: count_distinct
    sql: ${competition_id}
    drill_fields: [id, account_name, source_user_name]
    
  - measure: avg_entries_per_competition
    type: number
    sql: ${entries_count}/${competitions_count}
    drill_fields: [id, account_name, source_user_name]

