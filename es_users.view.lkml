view: es_users {
  label: "2a. Competition Users"
  sql_table_name: publications.es_users ;;

  dimension: address_line1 {
    hidden: yes
    type: string
    sql: ${TABLE}.address_line1 ;;
  }

  dimension: address_line2 {
    hidden: yes
    type: string
    sql: ${TABLE}.address_line2 ;;
  }

  dimension: age {
    hidden: yes
    type: tier
    tiers: [
      0,
      10,
      20,
      30,
      40,
      50,
      60,
      70,
      80
    ]
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    hidden: yes
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    hidden: yes
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_date ;;
  }

  dimension: date_of_birth {
    hidden: yes
    type: string
    sql: ${TABLE}.date_of_birth ;;
  }

  dimension: email {
    hidden: yes
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    hidden: yes
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    hidden: yes
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: groupoptin {
    label: "Bauer Optin"
    hidden: no
    type: yesno
    sql: ${TABLE}.groupoptin ;;
  }

  dimension: has_been_processed {
    hidden: yes
    type: yesno
    sql: ${TABLE}.has_been_processed ;;
  }

  dimension: homephonenumber {
    hidden: yes
    type: string
    sql: ${TABLE}.homephonenumber ;;
  }

  dimension: last_name {
    hidden: yes
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: mobilephonenumber {
    hidden: yes
    type: string
    sql: ${TABLE}.mobilephonenumber ;;
  }

  dimension: brand_optin {
    hidden: no
    type: yesno
    sql: ${TABLE}.optin ;;
  }

  dimension: phone {
    hidden: yes
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: state {
    hidden: yes
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: thirdpartyoptin {
    label: "Third Party Optin"
    type: yesno
    sql: ${TABLE}.thirdpartyoptin ;;
  }

  dimension: title {
    hidden: yes
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension_group: updated {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_date ;;
  }

  dimension: user_id {
    label: "User ID"
    type: string
    primary_key: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: workphonenumber {
    hidden: yes
    type: string
    sql: ${TABLE}.workphonenumber ;;
  }

  dimension: zipcode {
    hidden: yes
    type: string
    sql: ${TABLE}.zipcode ;;
  }

  measure: users_count {
    label: "Users Count"
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [user_id]
  }
}
