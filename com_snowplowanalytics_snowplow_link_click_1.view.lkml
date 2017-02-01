view: snowplow_clicks {
  sql_table_name: snowplow.com_snowplowanalytics_snowplow_link_click_1 ;;

  dimension: element_classes {
    type: string
    sql: ${TABLE}.element_classes ;;
  }

  dimension: element_id {
    hidden: yes
    type: string
    sql: ${TABLE}.element_id ;;
  }

  dimension: element_target {
    hidden: yes
    type: string
    sql: ${TABLE}.element_target ;;
  }

  dimension: ref_parent {
    hidden: yes
    type: string
    sql: ${TABLE}.ref_parent ;;
  }

  dimension: ref_root {
    hidden: yes
    type: string
    sql: ${TABLE}.ref_root ;;
  }

  dimension: ref_tree {
    hidden: yes
    type: string
    sql: ${TABLE}.ref_tree ;;
  }

  dimension: root_id {
    hidden: yes
    type: string
    primary_key: yes
    sql: ${TABLE}.root_id ;;
  }

  dimension_group: root_tstamp {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.root_tstamp ;;
  }

  dimension: schema_format {
    hidden: yes
    type: string
    sql: ${TABLE}.schema_format ;;
  }

  dimension: schema_name {
    hidden: yes
    type: string
    sql: ${TABLE}.schema_name ;;
  }

  dimension: schema_vendor {
    hidden: yes
    type: string
    sql: ${TABLE}.schema_vendor ;;
  }

  dimension: schema_version {
    hidden: yes
    type: string
    sql: ${TABLE}.schema_version ;;
  }

  dimension: target_url {
    type: string
    sql: ${TABLE}.target_url ;;
  }

  measure: count {
    label: "Clicks Count"
    type: count
    drill_fields: [schema_name]
  }
}
