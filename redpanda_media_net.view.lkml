view: media_net {
  sql_table_name: ad_platform.media_net ;;

  dimension: adtagid {
    label: "Ad Tag ID"
    type: string
    sql: SPLIT_PART(${TABLE}.adtagid, '|', 1) ;;
  }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(SPLIT_PART(${TABLE}.adtagid, '|', 2),'YYYY-MM-DD') ;;
  }

  dimension: adunitname {
    label: "Ad Unit Name"
    type: string
    sql: ${TABLE}.adunitname ;;
  }

  dimension: channelname {
    label: "Channel Name"
    type: string
    sql: ${TABLE}.channelname ;;
  }

  measure: estimatedrevenue {
    label: "Estimated Revenue"
    type: sum
    value_format: "\£0.0000"
    sql: 1.00*${TABLE}.estimatedrevenue::float ;;
  }

  measure: impressions {
    label: "Impressions"
    type: sum
    sql: ${TABLE}.impressions ;;
  }

  dimension: rownum {
    label: ""
    hidden: yes
    type: string
    sql: ${TABLE}.rownum ;;
  }

  measure: rpm {
    value_format: "\£0.0000"
    type: average
    sql: ${TABLE}.rpm::float ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [channelname, adunitname]
  }
}
