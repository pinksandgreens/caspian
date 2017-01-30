view: es_campaign_report {
  label: "2d. Campaign Report(s)"
  sql_table_name: publications.es_campaign_report ;;

  dimension: id {
    primary_key: yes
    hidden: no
    type: string
    sql: ${TABLE}.comp_id ;;
  }

  dimension: created_by {
    hidden: no
    type: string
    sql: CASE
        WHEN INITCAP(split_part(REPLACE(${TABLE}.created_by, '.', ' '),'@',1)) = 'Richard Foster2' THEN 'Richard Foster'
        WHEN INITCAP(split_part(REPLACE(${TABLE}.created_by, '.', ' '),'@',1)) = 'John' THEN 'John (Empire)'
        WHEN INITCAP(split_part(REPLACE(${TABLE}.created_by, '.', ' '),'@',1)) = 'James' THEN 'James (Empire)'
        ELSE INITCAP(split_part(REPLACE(${TABLE}.created_by, '.', ' '),'@',1))
      END
       ;;
  }

  dimension: external_ref {
    label: "External Reference"
    hidden: yes
    type: string
    sql: ${TABLE}.external_ref ;;
  }

  dimension: master {
    hidden: yes
    type: string
    sql: ${TABLE}.master ;;
  }

  dimension: name {
    label: "Competition Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: name1 {
    label: "Competition Reference"
    type: string
    sql: ${TABLE}.name1 ;;
  }

  dimension_group: publish_date {
    label: "Competition Published"
    type: time
    timeframes: [date, week, month]
    sql: TO_DATE (${TABLE}.publish_date, 'DD-MM-YYYY')
      ;;
  }

  dimension: short_url {
    hidden: yes
    type: string
    sql: ${TABLE}.short_url ;;
  }

  ############ HIDDEN ###############
  dimension: total_conversions {
    #  Hours wasted trying to fix: 1  #
    hidden: yes
    ###################################
    type: string
    sql: ${TABLE}.total_conversions ;;
  }

  #    sql: TO_NUMBER(${TABLE}.total_conversions) ## Testing Still

  ############ HIDDEN ###############
  dimension: total_shares {
    hidden: yes
    type: number
    sql: ${TABLE}.total_shares ;;
  }

  measure: total_views_sum {
    hidden: yes
    type: sum
    sql: CAST(CASE WHEN ${TABLE}.total_views =  0 THEN NULL
      END AS INT)
       ;;
  }

  dimension: total_views {
    hidden: no
    type: number
    sql: ${TABLE}.total_views ;;
  }

  # Can't set these 3 as integers, might be because they're strings in the DB?

  measure: count {
    hidden: yes
    type: count
    drill_fields: [name]
  }
}
