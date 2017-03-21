view: jr_lifestyle_audience_test {
  label: "Lifestyle"

  derived_table: {
    sql: SELECT
        Mobile_Model,
        EXACT_COUNT_DISTINCT(Visitor) AS UU_Device
      FROM
        ${jr_lifestyle_audience.SQL_TABLE_NAME}
      WHERE MobileFlag = 1
      GROUP BY Mobile_Model

       ;;
  }


#   dimension: Visitor {
#     view_label: "Audience"
#     group_label: "Audience Dimensions"
#     label: "Client ID"
#     sql: ${TABLE}.Visitor ;;
#     description: "Visitors"
#
#     }

  dimension:  Mobile_Model {
    view_label: "Audience"
    group_label: "Audience Dimensions"
    label: "Mobile: Model Name"
    sql: ${TABLE}.Mobile_Model ;;
    description: "Mobile Model Name"

  }

  dimension:  UU_Device {
    view_label: "Audience"
    group_label: "Audience Dimensions"
    label: "UU Count"
    type:  number
    sql: ${TABLE}.UU_Device ;;
    description: "UU Count by Mobile: Commercial Name"

  }


  }
