view: odin_subs_raw {
  sql_table_name: responsys.odin_subs_raw ;;

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: subscurrentsourcecode {
    type: string
    sql: ${TABLE}.subscurrentsourcecode ;;
  }

  dimension_group: subsdatejoined {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.subsdatejoined ;;
  }

  dimension_group: subsissueexpirydate {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.subsissueexpirydate ;;
  }

  dimension_group: subsissuestartdate {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.subsissuestartdate ;;
  }

  dimension_group: subslastissuereceiveddate {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.subslastissuereceiveddate ;;
  }

  dimension: subsmagazinecode {
    type: string
    sql: ${TABLE}.subsmagazinecode ;;
  }

  dimension: subsoriginalsourcecode {
    type: string
    sql: ${TABLE}.subsoriginalsourcecode ;;
  }

  dimension: subspaymenttype {
    type: string
    sql: ${TABLE}.subspaymenttype ;;
  }

  dimension: subsrecencybanding {
    type: string
    sql: ${TABLE}.subsrecencybanding ;;
  }

  dimension: subsrenewalstatus {
    type: string
    sql: ${TABLE}.subsrenewalstatus ;;
  }

  dimension: subssubscriberid {
    type: number
    value_format_name: id
    sql: ${TABLE}.subssubscriberid ;;
  }

  dimension: subssubscriberrefid {
    type: string
    sql: ${TABLE}.subssubscriberrefid ;;
  }

  dimension: subssubscriptionindicator {
    type: string
    sql: ${TABLE}.subssubscriptionindicator ;;
  }

  dimension: subssubscriptionstatus {
    type: string
    sql: ${TABLE}.subssubscriptionstatus ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.updated_date ;;
  }

  measure: Unique_Email_Count {
    type: count_distinct
    sql: ${TABLE}.email_address ;;
  }
}
