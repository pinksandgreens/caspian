view: nudge_brands {
  sql_table_name: publications.nudge_brands ;;

  dimension: business {
    type: string
    sql: ${TABLE}.business ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: feed_threshold_days {
    type: number
    sql: ${TABLE}.feed_threshold_days ;;
  }

  dimension: list_brand_code {
    type: string
    sql: ${TABLE}.list_brand_code ;;
  }

  dimension: list_name {
    type: string
    sql: ${TABLE}.list_name ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: obsolete {
    type: string
    sql: ${TABLE}.obsolete ;;
  }

  dimension: parent_code {
    type: string
    sql: ${TABLE}.parent_code ;;
  }

  dimension: subs_description {
    type: string
    sql: ${TABLE}.subs_description ;;
  }

  measure: count {
    type: count
    drill_fields: [list_name]
  }
}
