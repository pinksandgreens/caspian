view: entries {
  sql_table_name: [bauerxcel.com:api-project-792028032348:Mongo_DB.entries]
    ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: contestant_uuid {
    type: string
    sql: ${TABLE}.contestant_uuid ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      minute30,
      hour,
      time_of_day,
      date,
      week,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: demo_info {
    type: string
    sql: ${TABLE}.demo_info ;;
  }

  dimension: drawing_id {
    type: number
    sql: ${TABLE}.drawing_id ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: from_child {
    type: yesno
    sql: ${TABLE}.from_child ;;
  }

  dimension: imported_at {
    type: string
    sql: ${TABLE}.imported_at ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: legacy_id {
    type: string
    sql: ${TABLE}.legacy_id ;;
  }

  dimension: referer {
    type: string
    sql: ${TABLE}.referer ;;
  }

  dimension: site_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.site_id ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: unique_key {
    type: string
    sql: ${TABLE}.unique_key ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }

  measure: distinct_email {
   label: "WINIT EMAILS"
   type: count_distinct
    sql_distinct_key: ${TABLE}.email ;;
    sql: ${TABLE}.email ;;

  }
  measure: count {
    type: count
    approximate_threshold: 100000
  }
}
