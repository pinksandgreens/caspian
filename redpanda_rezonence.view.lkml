view: rezonence {
  sql_table_name: ad_platform.rezonence ;;

  dimension: clicks {
    type: string
    sql: ${TABLE}.clicks ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: cpe {
    type: string
    sql: ${TABLE}.cpe ;;
  }

  dimension: creative_id {
    type: string
    sql: ${TABLE}.creative_id ;;
  }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}.date,'DD/MM/YYYY') ;;
  }


  dimension: engagements {
    type: string
    sql: ${TABLE}.engagements ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  dimension: video_completions {
    type: string
    sql: ${TABLE}.video_completions ;;
  }

  dimension: video_starts {
    type: string
    sql: ${TABLE}.video_starts ;;
  }

  dimension: views {
    type: string
    sql: ${TABLE}.views ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
