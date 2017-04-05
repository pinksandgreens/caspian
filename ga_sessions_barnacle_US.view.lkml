#US POC for Looker

# "ga:77116734" "Closer Weekly" "Lifestyle US"
# "ga:10832246" "In Touch Weekly" "Lifestyle US"
# "ga:74001021" "Womans World"  "Lifestyle US"
# "ga:74000526" "Life and Style"  "Lifestyle US"
# "ga:72272327" "J 14"  "Lifestyle US"
# "ga:116843474"  "FHM" "Lifestyle US"

view: ga_sessions_barnacle_US {
  sql_table_name: ( SELECT * FROM {% table_date_range date_filter 77116734.ga_sessions_ %},
                  {% table_date_range date_filter 77116734.ga_sessions_intraday_ %},
                  {% table_date_range date_filter 10832246.ga_sessions_ %},
                  {% table_date_range date_filter 10832246.ga_sessions_intraday_ %},
                  {% table_date_range date_filter 74001021.ga_sessions_ %},
                  {% table_date_range date_filter 74001021.ga_sessions_intraday_ %},
                  {% table_date_range date_filter 74000526.ga_sessions_ %},
                  {% table_date_range date_filter 74000526.ga_sessions_intraday_ %},
                  {% table_date_range date_filter 72272327.ga_sessions_ %},
                  {% table_date_range date_filter 72272327.ga_sessions_intraday_ %},
                  {% table_date_range date_filter 116843474.ga_sessions_ %},
                  {% table_date_range date_filter 116843474.ga_sessions_intraday_ %});;

    filter: date_filter {
      type: date
    }

# TABLE_DATE_RANGE([uplifted-light-89310:114668488.ga_sessions_],DATE_ADD(CURRENT_TIMESTAMP(), -1, 'YEAR'),CURRENT_TIMESTAMP())

# - dimension: unique_key
#   type: string
#   sql: ${TABLE}.fullVisitorId || ${TABLE}.visitId

    dimension: channel_grouping {
      type: string
      sql: ${TABLE}.channelGrouping ;;
    }


    dimension: uu_key {
      label: "Unique Key"
      hidden: yes
      sql: CONCAT(string(${TABLE}.fullVisitorId),"-",string(${TABLE}.visitId)) ;;
    }

    measure: Unique_Users {
      label: "Unique Users"
      type: count_distinct
      sql: ${TABLE}.fullVisitorId ;;
    }

}
