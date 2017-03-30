view: mcn_syb {
  sql_table_name: responsys.mcn_syb ;;

  dimension: address1 {
    type: string
    sql: ${TABLE}.address1 ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.address2 ;;
  }

  dimension: address3 {
    type: string
    sql: ${TABLE}.address3 ;;
  }

  dimension: advertid {
    type: string
    sql: ${TABLE}.advertid ;;
  }

  dimension: advertprice {
    type: string
    sql: ${TABLE}.advertprice ;;
  }

  dimension: bikeprice {
    type: string
    sql: ${TABLE}.bikeprice ;;
  }

  dimension: brandpermission {
    type: string
    sql: ${TABLE}.brandpermission ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: dateofbirth {
    type: string
    sql: ${TABLE}.dateofbirth ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: enquirydate {
    type: string
    sql: ${TABLE}.enquirydate ;;
  }

  dimension: expirydate {
    type: string
    sql: ${TABLE}.expirydate ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: import_id {
    type: string
    sql: ${TABLE}.import_id ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension: make {
    type: string
    sql: ${TABLE}.make ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: package {
    type: string
    sql: ${TABLE}.package ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: postcode {
    type: string
    sql: ${TABLE}.postcode ;;
  }

  dimension: price {
    type: string
    sql: ${TABLE}.price ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: town {
    type: string
    sql: ${TABLE}.town ;;
  }

  dimension: transactiondate {
    type: string
    sql: ${TABLE}.transactiondate ;;
  }

  dimension: uniqueid {
    type: string
    sql: ${TABLE}.uniqueid ;;
  }

  measure: count {
    type: count
    drill_fields: [firstname, lastname]
  }
}
