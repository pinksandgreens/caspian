view: nudge_transactions {
  sql_table_name: publications.nudge_transactions ;;

  dimension: address_line_1 {
    type: string
    sql: ${TABLE}.address_line_1 ;;
  }

  dimension: address_line_2 {
    type: string
    sql: ${TABLE}.address_line_2 ;;
  }

  dimension: address_line_3 {
    type: string
    sql: ${TABLE}.address_line_3 ;;
  }

  dimension: address_line_4 {
    type: string
    sql: ${TABLE}.address_line_4 ;;
  }

  dimension: address_line_5 {
    type: string
    sql: ${TABLE}.address_line_5 ;;
  }

  dimension: address_line_6 {
    type: string
    sql: ${TABLE}.address_line_6 ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: brand_code {
    type: string
    sql: ${TABLE}.brand_code ;;
  }

  dimension: contact_id {
    type: string
    sql: ${TABLE}.contact_id ;;
  }

  dimension: contact_id_type {
    type: string
    sql: ${TABLE}.contact_id_type ;;
  }

  dimension_group: date_of_birth {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.date_of_birth ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: fulfillment_company {
    type: string
    sql: ${TABLE}.fulfillment_company ;;
  }

  dimension: home_phone {
    type: string
    sql: ${TABLE}.home_phone ;;
  }

  dimension: individual_id {
    type: number
    sql: ${TABLE}.individual_id ;;
  }

  dimension: interations_id {
    type: string
    sql: ${TABLE}.interations_id ;;
  }

  dimension: item_description {
    type: string
    sql: ${TABLE}.item_description ;;
  }

  dimension: items {
    type: number
    sql: ${TABLE}.items ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: offer_code {
    type: string
    sql: ${TABLE}.offer_code ;;
  }

  dimension: offer_description {
    type: string
    sql: ${TABLE}.offer_description ;;
  }

  dimension: offer_media {
    type: string
    sql: ${TABLE}.offer_media ;;
  }

  dimension: offer_type {
    type: string
    sql: ${TABLE}.offer_type ;;
  }

  dimension: order_line {
    type: string
    sql: ${TABLE}.order_line ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}.order_status ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension: postcode {
    type: string
    sql: ${TABLE}.postcode ;;
  }

  dimension: product_code {
    type: string
    sql: ${TABLE}.product_code ;;
  }

  dimension: product_description {
    type: string
    sql: ${TABLE}.product_description ;;
  }

  dimension: publication_name {
    type: string
    sql: ${TABLE}.publication_name ;;
  }

  dimension: response_channel {
    type: string
    sql: ${TABLE}.response_channel ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension_group: transaction {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.transaction_date ;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type ;;
  }

  dimension: transaction_value {
    type: number
    sql: ${TABLE}.transaction_value ;;
  }

  dimension: work_phone {
    type: string
    sql: ${TABLE}.work_phone ;;
  }

  measure: count {
    type: count
    drill_fields: [first_name, middle_name, last_name, publication_name]
  }

  measure: Trans_Unique_Email_Count {
    type: count_distinct
    sql: ${TABLE}.email_address ;;
  }
}
