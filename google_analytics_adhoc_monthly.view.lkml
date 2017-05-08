view: google_analytics_adhoc_monthly {
  sql_table_name: publications.google_analytics_adhoc_monthly ;;

  dimension: channelgrouping {
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
    type: string
    sql: INITCAP(${TABLE}.devicecategory) ;;
  }

  dimension: key {
    hidden: yes
    type: string
    sql: ${TABLE}.key ;;
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

  dimension: yearmonth {
    type: string
    sql: ${TABLE}.yearmonth ;;
  }


  dimension_group: yearmonth {
    label: "Year/Month"
    type: time
    timeframes: [month, month_num]
    convert_tz: no
    sql: TO_DATE(${TABLE}.date,'YYYY/MM') ;;
  }

  measure: pages_per_session {
    type: number
    value_format: "0.00"
    sql: ${pageviews}/${sessions} ;;
  }

}
