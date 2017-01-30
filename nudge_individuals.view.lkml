view: nudge_individuals {
  sql_table_name: publications.nudge_individuals ;;

  dimension: age_band {
    type: string
    sql: ${TABLE}.age_band ;;
  }

  dimension: bauer_phone_option {
    type: string
    sql: ${TABLE}.bauer_phone_option ;;
  }

  dimension: children_at_home {
    type: string
    sql: ${TABLE}.children_at_home ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: composite_key {
    type: string
    sql: ${TABLE}.composite_key ;;
  }

  dimension: cr_address_urn {
    type: number
    sql: ${TABLE}.cr_address_urn ;;
  }

  dimension: cr_person_status {
    type: number
    sql: ${TABLE}.cr_person_status ;;
  }

  dimension: cr_person_urn {
    type: number
    sql: ${TABLE}.cr_person_urn ;;
  }

  dimension_group: created {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.created_date ;;
  }

  dimension_group: date_of_birth {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.date_of_birth ;;
  }

  dimension: email_address {
    hidden: no
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: empire_vigintile {
    type: number
    sql: ${TABLE}.empire_vigintile ;;
  }

  dimension: external_email_optin {
    type: string
    sql: ${TABLE}.external_email_optin ;;
  }

  dimension: external_email_optin_method {
    type: string
    sql: ${TABLE}.external_email_optin_method ;;
  }

  dimension: external_fax_optin {
    type: string
    sql: ${TABLE}.external_fax_optin ;;
  }

  dimension: external_fax_optin_method {
    type: string
    sql: ${TABLE}.external_fax_optin_method ;;
  }

  dimension: external_home_phone_optin {
    type: string
    sql: ${TABLE}.external_home_phone_optin ;;
  }

  dimension: external_home_phone_optin_method {
    type: string
    sql: ${TABLE}.external_home_phone_optin_method ;;
  }

  dimension: external_mail_optin {
    type: string
    sql: ${TABLE}.external_mail_optin ;;
  }

  dimension: external_mail_optin_method {
    type: string
    sql: ${TABLE}.external_mail_optin_method ;;
  }

  dimension: external_mobile_phone_optin {
    type: string
    sql: ${TABLE}.external_mobile_phone_optin ;;
  }

  dimension: external_mobile_phone_optin_method {
    type: string
    sql: ${TABLE}.external_mobile_phone_optin_method ;;
  }

  dimension: external_sms_optin {
    type: string
    sql: ${TABLE}.external_sms_optin ;;
  }

  dimension: external_sms_optin_method {
    type: string
    sql: ${TABLE}.external_sms_optin_method ;;
  }

  dimension: external_work_phone_optin {
    type: string
    sql: ${TABLE}.external_work_phone_optin ;;
  }

  dimension: external_work_phone_optin_method {
    type: string
    sql: ${TABLE}.external_work_phone_optin_method ;;
  }

  dimension: fax_number {
    type: string
    sql: ${TABLE}.fax_number ;;
  }

  dimension_group: first_loaded {
    type: time
    timeframes: [date, week, month, year]
    convert_tz: no
    sql: ${TABLE}.first_loaded_date ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: grazia_vigintile {
    type: number
    sql: ${TABLE}.grazia_vigintile ;;
  }

  dimension: home_phone {
    type: string
    sql: ${TABLE}.home_phone ;;
  }

  dimension: household_id {
    type: number
    sql: ${TABLE}.household_id ;;
  }

  dimension: household_income {
    type: string
    sql: ${TABLE}.household_income ;;
  }

  dimension: household_size {
    type: string
    sql: ${TABLE}.household_size ;;
  }

  dimension: individual_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.individual_id ;;
  }

  dimension: interest {
    type: string
    sql: ${TABLE}.interest ;;
  }

  dimension: internal_email_optin {
    type: string
    sql: ${TABLE}.internal_email_optin ;;
  }

  dimension: internal_email_optin_method {
    type: string
    sql: ${TABLE}.internal_email_optin_method ;;
  }

  dimension: internal_fax_optin {
    type: string
    sql: ${TABLE}.internal_fax_optin ;;
  }

  dimension: internal_fax_optin_method {
    type: string
    sql: ${TABLE}.internal_fax_optin_method ;;
  }

  dimension: internal_home_phone_optin {
    type: string
    sql: ${TABLE}.internal_home_phone_optin ;;
  }

  dimension: internal_home_phone_optin_method {
    type: string
    sql: ${TABLE}.internal_home_phone_optin_method ;;
  }

  dimension: internal_mail_optin {
    type: string
    sql: ${TABLE}.internal_mail_optin ;;
  }

  dimension: internal_mail_optin_method {
    type: string
    sql: ${TABLE}.internal_mail_optin_method ;;
  }

  dimension: internal_mobile_phone_optin {
    type: string
    sql: ${TABLE}.internal_mobile_phone_optin ;;
  }

  dimension: internal_mobile_phone_optin_method {
    type: string
    sql: ${TABLE}.internal_mobile_phone_optin_method ;;
  }

  dimension: internal_sms_optin {
    type: string
    sql: ${TABLE}.internal_sms_optin ;;
  }

  dimension: internal_sms_optin_method {
    type: string
    sql: ${TABLE}.internal_sms_optin_method ;;
  }

  dimension: internal_work_phone_optin {
    type: string
    sql: ${TABLE}.internal_work_phone_optin ;;
  }

  dimension: internal_work_phone_optin_method {
    type: string
    sql: ${TABLE}.internal_work_phone_optin_method ;;
  }

  dimension: investment_value {
    type: string
    sql: ${TABLE}.investment_value ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension_group: last_debt_letter_send {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.last_debt_letter_send ;;
  }

  dimension_group: last_interaction {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.last_interaction_date ;;
  }

  dimension_group: last_loaded {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.last_loaded_date ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: lifestage {
    type: string
    sql: ${TABLE}.lifestage ;;
  }

  dimension: lvt {
    type: number
    sql: ${TABLE}.lvt ;;
  }

  dimension: magazine_read {
    type: string
    sql: ${TABLE}.magazine_read ;;
  }

  dimension: media_span {
    type: string
    sql: ${TABLE}.media_span ;;
  }

  dimension: middle_initials {
    type: string
    sql: ${TABLE}.middle_initials ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: mobile_phone_sms {
    type: string
    sql: ${TABLE}.mobile_phone_sms ;;
  }

  dimension: ms_adr_wide_a_urn {
    type: number
    sql: ${TABLE}.ms_adr_wide_a_urn ;;
  }

  dimension: ms_imputed_gender {
    type: string
    sql: ${TABLE}.ms_imputed_gender ;;
  }

  dimension: ms_occ_f_urn {
    type: number
    sql: ${TABLE}.ms_occ_f_urn ;;
  }

  dimension: ms_occ_i_urn {
    type: number
    sql: ${TABLE}.ms_occ_i_urn ;;
  }

  dimension: ms_salacious_email_flag {
    type: string
    sql: ${TABLE}.ms_salacious_email_flag ;;
  }

  dimension: ms_salacious_name_flag {
    type: string
    sql: ${TABLE}.ms_salacious_name_flag ;;
  }

  dimension: ms_std_suffix {
    type: string
    sql: ${TABLE}.ms_std_suffix ;;
  }

  dimension: occuptation {
    type: string
    sql: ${TABLE}.occuptation ;;
  }

  dimension: puk {
    type: string
    sql: ${TABLE}.puk ;;
  }

  dimension: readership {
    type: string
    sql: ${TABLE}.readership ;;
  }

  dimension: see_ems {
    type: string
    sql: ${TABLE}.see_ems ;;
  }

  dimension: seen_acs {
    type: string
    sql: ${TABLE}.seen_acs ;;
  }

  dimension: seen_acs_stock {
    type: string
    sql: ${TABLE}.seen_acs_stock ;;
  }

  dimension: seen_acs_subs {
    type: string
    sql: ${TABLE}.seen_acs_subs ;;
  }

  dimension: seen_competitions {
    type: string
    sql: ${TABLE}.seen_competitions ;;
  }

  dimension: seen_partner {
    type: string
    sql: ${TABLE}.seen_partner ;;
  }

  dimension: seen_percentage {
    type: string
    sql: ${TABLE}.seen_percentage ;;
  }

  dimension: seen_responsability {
    type: string
    sql: ${TABLE}.seen_responsability ;;
  }

  dimension: seen_webform {
    type: string
    sql: ${TABLE}.seen_webform ;;
  }

  dimension: shop {
    type: string
    sql: ${TABLE}.shop ;;
  }

  dimension: suppression_flag {
    type: string
    sql: ${TABLE}.suppression_flag ;;
  }

  dimension: telehphone_banking {
    type: string
    sql: ${TABLE}.telehphone_banking ;;
  }

  dimension: third_party_phone_option {
    type: string
    sql: ${TABLE}.third_party_phone_option ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: work_phone {
    type: string
    sql: ${TABLE}.work_phone ;;
  }

  dimension: year_of_birth {
    type: number
    sql: ${TABLE}.year_of_birth ;;
  }

  measure: count {
    type: count_distinct
    sql: ${TABLE}.individual_id ;;
    drill_fields: [first_name, last_name]
  }

  measure: Email_count_Subs_QA {
    type: count_distinct
    sql: ${TABLE}.email_address ;;
  }
}
