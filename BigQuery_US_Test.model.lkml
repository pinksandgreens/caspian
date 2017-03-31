connection: "biqqueryus"

# include all views in this project
include: "*.view"

# include all dashboards in this project
include: "*.dashboard"


# the view to start exploring from
explore: entries {
  label: "BigQuery - SweepOn"

  always_filter: {
    #This will be the default date range.
    filters: {
      field: created_date
      value: "30 days"
 }
}
join:sites  {
  type: inner
  view_label: "SweepOn Sites"
  relationship: one_to_one
  sql_table_name: [bauerxcel.com:api-project-792028032348:Mongo_DB.sites]
    ;;
  sql_on: ${sites.id} = ${entries.site_id} ;;
   }
}
explore: ga_sessions_20161005 {
  label: "In Touch Weekly"

  always_filter: {
    #This will be the default date range.
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}
