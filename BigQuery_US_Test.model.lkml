connection: "biqqueryus"

# include all views in this project
include: "*.view"

# include all dashboards in this project
include: "*.dashboard"

label: "x: BigQuery - Mongo"

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

}
