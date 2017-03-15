view: nudge_brand_permissions {
  sql_table_name: publications.nudge_brand_permissions ;;

  dimension: brand_code {
    type: string
    sql: ${TABLE}.brand_code ;;
  }

  dimension: brand_email_optin {
    type: string
    sql: ${TABLE}.brand_email_optin ;;
  }

  dimension: brand_fax_optin {
    type: string
    sql: ${TABLE}.brand_fax_optin ;;
  }

  dimension: brand_home_ph_optin {
    type: string
    sql: ${TABLE}.brand_home_ph_optin ;;
  }

  dimension: brand_mail_optin {
    type: string
    sql: ${TABLE}.brand_mail_optin ;;
  }

  dimension: brand_mobile_ph_optin {
    type: string
    sql: ${TABLE}.brand_mobile_ph_optin ;;
  }

  dimension: brand_permssion_key {
    type: string
    sql: ${TABLE}.brand_permssion_key ;;
  }

  dimension: brand_sms_optin {
    type: string
    sql: ${TABLE}.brand_sms_optin ;;
  }

  dimension: brand_work_ph_optin {
    type: string
    sql: ${TABLE}.brand_work_ph_optin ;;
  }

  dimension_group: date_collected {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date_collected ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: ext_email_optin {
    type: string
    sql: ${TABLE}.ext_email_optin ;;
  }

  dimension: ext_fax_optin {
    type: string
    sql: ${TABLE}.ext_fax_optin ;;
  }

  dimension: ext_home_ph_optin {
    type: string
    sql: ${TABLE}.ext_home_ph_optin ;;
  }

  dimension: ext_mail_optin {
    type: string
    sql: ${TABLE}.ext_mail_optin ;;
  }

  dimension: ext_mobile_ph_optin {
    type: string
    sql: ${TABLE}.ext_mobile_ph_optin ;;
  }

  dimension: ext_sms_optin {
    type: string
    sql: ${TABLE}.ext_sms_optin ;;
  }

  dimension: ext_work_ph_optin {
    type: string
    sql: ${TABLE}.ext_work_ph_optin ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: home_phone {
    type: string
    sql: ${TABLE}.home_phone ;;
  }

  dimension: individual_id {
    type: number
    sql: ${TABLE}.individual_id ;;
  }

  dimension: int_email_optin {
    type: string
    sql: ${TABLE}.int_email_optin ;;
  }

  dimension: int_fax_optin {
    type: string
    sql: ${TABLE}.int_fax_optin ;;
  }

  dimension: int_home_ph_optin {
    type: string
    sql: ${TABLE}.int_home_ph_optin ;;
  }

  dimension: int_mail_optin {
    type: string
    sql: ${TABLE}.int_mail_optin ;;
  }

  dimension: int_mobile_ph_optin {
    type: string
    sql: ${TABLE}.int_mobile_ph_optin ;;
  }

  dimension: int_sms_optin {
    type: string
    sql: ${TABLE}.int_sms_optin ;;
  }

  dimension: int_work_ph_optin {
    type: string
    sql: ${TABLE}.int_work_ph_optin ;;
  }

  dimension: mail {
    type: string
    sql: ${TABLE}.mail ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: mobile_phone_sms {
    type: string
    sql: ${TABLE}.mobile_phone_sms ;;
  }

  dimension: work_phone {
    type: string
    sql: ${TABLE}.work_phone ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
