view: es_brand_optin {
  label: "2e. Competition Optins"
  sql_table_name: publications.es_brand_optin ;;

  dimension: brand {
    label: "Brand Name"
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: brandoptin {
    label: "Brand Opin"
    type: yesno
    sql: ${TABLE}.brandoptin ;;
  }

  dimension: brandoptin_not_null {
    label: "brandoptinnotnull"
    hidden: yes
    type: string
    sql: CASE
       WHEN ${brandoptin} = 'Yes' THEN '1'
       ELSE '0'
      END
       ;;
  }

  dimension_group: date_created {
    label: "Optin"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_created ;;
  }

  measure: Brand_Optin_Total {
    type: number
    sql: sum(${brandoptin_not_null}) ;;
  }

  dimension_group: last_updated {
    label: "Updated Optin"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: user_id {
    hidden: no
    type: string
    sql: ${TABLE}.user_id ;;
  }

  measure: users_count {
    hidden: yes
    label: "Users Count"
    type: count_distinct
    sql: ${TABLE}.user_id ;;
  }
}

#   - measure: count
#     hidden: TRUE
#     type: count
#     drill_fields: []
