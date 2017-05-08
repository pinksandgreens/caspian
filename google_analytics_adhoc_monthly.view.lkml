view: google_analytics_adhoc_monthly {
  sql_table_name: publications.google_analytics_adhoc_monthly ;;

  dimension: channelgrouping {
    label: "Channel Grouping"
    type: string
    sql: ${TABLE}.channelgrouping ;;
  }

  dimension: brand {
    label: "Brand Page"
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  dimension: branding {
    type: string
    sql: ${TABLE}.branding ;;
  }

  dimension: date {
    hidden: yes
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: device {
    type: string
    sql: INITCAP(${TABLE}.device) ;;
  }

  dimension: devicecategory {
    label: "Device Category"
    type: string
    sql: INITCAP(${TABLE}.devicecategory) ;;
  }

  dimension: key_device {
    hidden: no
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: key_channel {
    hidden: no
    type: string
    sql: ${TABLE}.brand_name || '' || ${TABLE}.channelgrouping ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  measure: pageviews {
    type: sum
    sql: ${TABLE}.pageviews ;;
  }

  measure: sessions {
    type: sum
    sql: ${TABLE}.sessions ;;
  }

  measure: users {
    type: sum
    sql: ${TABLE}.users ;;
  }

  dimension_group: yearmonth {
    label: "Year/Month"
    type: time
    timeframes: [year, month, month_num]
    convert_tz: no
    sql: TO_DATE(${TABLE}.yearmonth,'YYYY/MM') ;;
  }

  measure: pages_per_session {
    type: number
    value_format: "0.00"
    sql: ${pageviews}/${sessions} ;;
  }

}
