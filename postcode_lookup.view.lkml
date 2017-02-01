view: postcode_lookup {
  sql_table_name: publications.postcode_lookup ;;

  dimension: id {
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: postcode {
    hidden: no
    type: string
    sql: ${TABLE}.postcode ;;
  }

  dimension: latitude {
    hidden: no
    type: string
    sql: CAST(CASE WHEN ${TABLE}.latitude IS NULL THEN '0'
      WHEN LEN(${TABLE}.latitude) = 0 THEN '0'
      ELSE ${TABLE}.latitude
      END AS REAL)
       ;;
  }

  dimension: longitude {
    hidden: no
    type: string
    sql: CAST(CASE WHEN ${TABLE}.longitude IS NULL THEN '0'
      WHEN LEN(${TABLE}.longitude) = 0 THEN '0'
      ELSE ${TABLE}.longitude
      END AS REAL)
       ;;
  }

  dimension: location {
    label: "Latitude/Longitude Location"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }
}

#(1.00)*(
