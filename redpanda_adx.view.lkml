view: adx {
  sql_table_name: ad_platform.adx ;;

  dimension: ad_requests {
    type: string
    sql: ${TABLE}.ad_requests ;;
  }

  dimension: ad_tag_name {
    type: string
    sql: ${TABLE}.ad_tag_name ;;
  }

  dimension: ad_unit_size_name {
    type: string
    sql: ${TABLE}.ad_unit_size_name ;;
  }

  dimension: advertiser_name {
    type: string
    sql: ${TABLE}.advertiser_name ;;
  }

  dimension: buyer_network_name {
    type: string
    sql: ${TABLE}.buyer_network_name ;;
  }

  dimension: clicks {
    type: string
    sql: ${TABLE}.clicks ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: domain_name {
    type: string
    sql: ${TABLE}.domain_name ;;
  }

  dimension: dsp_name {
    type: string
    sql: ${TABLE}.dsp_name ;;
  }

  dimension: earnings_gbp {
    type: string
    sql: ${TABLE}."earnings (gbp)" ;;
  }

  dimension: individual_ad_impressions {
    type: string
    sql: ${TABLE}.individual_ad_impressions ;;
  }

  dimension: matched_ad_requests {
    type: string
    sql: ${TABLE}.matched_ad_requests ;;
  }

  dimension: platform_type_name {
    type: string
    sql: ${TABLE}.platform_type_name ;;
  }

  dimension: rownum {
    type: string
    sql: ${TABLE}.rownum ;;
  }

  dimension: transaction_type_name {
    type: string
    sql: ${TABLE}.transaction_type_name ;;
  }

  dimension: url_channel_name {
    type: string
    sql: ${TABLE}.url_channel_name ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      domain_name,
      ad_tag_name,
      ad_unit_size_name,
      advertiser_name,
      buyer_network_name,
      country_name,
      dsp_name,
      platform_type_name,
      transaction_type_name,
      url_channel_name
    ]
  }
}
