view: rezonence {
  sql_table_name: ad_platform.rezonence ;;

  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  measure: cpe {
    description: "Revenue?"
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.cpe::float ;;
  }

  # measure: revenue {
  #   label: "Revenue (?)"
  #   description: "Cost-per-engagement(CPE)*Clicks"
  #   type: number
  #   value_format: "\£0.0000"
  #   sql: ${cpe}*${clicks} ;;
  # }


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


  measure: engagements {
    type: sum
    sql: ${TABLE}.engagements ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  measure: video_completions {
    type: sum
    sql: ${TABLE}.video_completions ;;
  }

  measure: video_starts {
    type: sum
    sql: ${TABLE}.video_starts ;;
  }

  measure: views {
    type: sum
    sql: ${TABLE}.views ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
