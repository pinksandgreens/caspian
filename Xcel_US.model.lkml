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

explore: ga_page_metrics_month_20170301 {
  view_label: "GA Page Metrics"
  sql_table_name: [bauerxcel.com:api-project-792028032348:ga_editorial_data.ga_page_metrics_month_20170301] ;;
}

# BQ Table  Site
# Dataset Details: 99659431 Simple Grace
# Dataset Details: 99687033 Recipes Plus
# Dataset Details: 99656431 j14es
# Dataset Details: 99302461 All Sweeps
# Dataset Details: 85879355 Animal Tales Magazine
# Dataset Details: 77116734 Closer Weekly
# Dataset Details: 76304924 Girls' World
# Dataset Details: 74811326 Miss literati
# Dataset Details: 74005709 In Touch Weekly
# Dataset Details: 74001021 Womans World
# Dataset Details: 74000526 Life & Style
# Dataset Details: 72272327 J 14
# Dataset Details: 72272126 Twist
# Dataset Details: 72205690 M Magazine
# Dataset Details: 7128045  4TNZ
# Dataset Details: 67247184 Astrogirl Freebies
# Dataset Details: 39172709 First for Women
# Dataset Details: 37783830 Ideas and Discoveries
# Dataset Details: 22442075 Quizfest
# Dataset Details: 20800654 FHM
# Dataset Details: 16671093 My First for Woman
# Dataset Details: 12544518 Sweepon
# Dataset Details: 116843474  FHM
# Dataset Details: 112922704  BNTP AND TWINIT
# Dataset Details: 10832469 Soaps in Depth
# Dataset Details: 04_Entries ?
