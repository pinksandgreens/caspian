- view: competitions
  sql_table_name: responsys.odin_es_raw
  fields:

  - dimension: email_address
    type: string
    sql: ${TABLE}.email_address

#  - dimension: account_id
#    type: string
#    sql: ${TABLE}.esaccountid

  - dimension: account_name
    type: string
    sql: ${TABLE}.esaccountname

  - dimension: campaign_id
    type: string
    sql: ${TABLE}.escampaignid

  - dimension: campaign_name
    type: string
    sql: ${TABLE}.escampaignname

  - dimension: campaign_type
    type: string
    sql: ${TABLE}.escampaigntype

  - dimension: channel
    type: string
    sql: ${TABLE}.eschannel

#  - dimension: escouponcode
#    type: string
#    sql: ${TABLE}.escouponcode

  - dimension_group: date_created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.esdatecreatedts

  - dimension_group: date_entered
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.esdateenteredts

#  - dimension: esentryid
#    type: string
#    sql: ${TABLE}.esentryid

  - dimension: taxonomy
    type: string
    sql: ${TABLE}.esexternalref

  - dimension: tracking_medium
    type: string
    sql: ${TABLE}.esmedium

#  - dimension: social_network
#    type: string
#    sql: ${TABLE}.esnetwork

#  - dimension: esquizcategory
#    type: string
#    sql: ${TABLE}.esquizcategory

#  - dimension: esquizscore
#    type: number
#    sql: ${TABLE}.esquizscore

  - dimension: source
    type: string
    sql: ${TABLE}.essource

#  - dimension: estermsandconditions
#    type: string
#    sql: ${TABLE}.estermsandconditions

#  - dimension: esugccomment
#    type: string
#    sql: ${TABLE}.esugccomment

#  - dimension: esugcimage
#    type: string
#    sql: ${TABLE}.esugcimage

#  - dimension: esugcoriginlink
#    type: string
#    sql: ${TABLE}.esugcoriginlink

#  - dimension: esugcthumbnail
#    type: string
#    sql: ${TABLE}.esugcthumbnail

  - dimension: competition_user_id
    type: string
    sql: ${TABLE}.esuserid

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_date

  - measure: count
    type: count
    drill_fields: [esaccountname, escampaignname]

