connection: "caspian-live"

# include all views in this project
include: "*.view"

# include all dashboards in this project
include: "*.dashboard"

explore: google_analytics_top_line {
  label: "Google Analytics - Top Line"
  sql_table_name: publications.google_analytics_top_line ;;
  persist_for: "20 hour"

#   join: brand_lookup {
#     type: inner
#     relationship: one_to_one
#     sql_on: ${brand_lookup.bra_code} = ${google_analytics_top_line.brand_code} ;;
#   }
}

# - explore: google_analytics_pages
#   hidden: TRUE
#   label: 'Google Analytics - Pages'
#   sql_table_name: publications.google_analytics_pages
#   persist_for: 20 hour

# - explore: google_analytics_channels
#   hidden: TRUE
#   label: 'Google Analytics - Channels'
#   sql_table_name: publications.google_analytics_channels
# persist_for: 20 hour

# - explore: integrated_ads
#   hidden: TRUE
#   label: 'Advertisement Data'
#   sql_table_name: publications.integrated_ads
# persist_for: 20 hour

explore: google_analytics_dfp {
  hidden: yes
  label: "Google Analytics - DFP"
  sql_table_name: publications.google_analytics_dfp ;;
  persist_for: "20 hour"
}

explore: audiometrix_countries {
  label: "Audiometrix Historical - by Countries"
  sql_table_name: publications.audiometrix_countries ;;
  persist_for: "20 hour"

  join: brand_lookup {
    type: inner
    relationship: one_to_one
    sql_on: ${audiometrix_countries.brand_code}=${brand_lookup.bra_code} ;;
  }
}

explore: audiometrix_devices {
  label: "Audiometrix Historical - by Device"
  sql_table_name: publications.audiometrix_devices ;;
  persist_for: "20 hour"

  join: brand_lookup {
    type: inner
    relationship: one_to_one
    sql_on: ${audiometrix_devices.brand_code}=${brand_lookup.bra_code} ;;
  }
}

explore: audiometrix_realtime {
  hidden: yes
  label: "Audiometrix - Realtime"
  sql_table_name: publications.audiometrix_realtime_unique ;;
}

explore: audiometrix_realtime_devices {
  hidden: yes
  label: "Audiometrix - Realtime Devices"
  sql_table_name: publications.audiometrix_realtime_devices_unique ;;
}

explore: google_analytics_devices {
  hidden: yes
  label: "Google Analytics - Devices"
  sql_table_name: publications.google_analytics_devices ;;
  persist_for: "20 hour"
}

explore: barnacletopline {
  hidden: yes
  label: "Barnacle - Top Line"
  sql_table_name: publications.barnacletopline ;;
  persist_for: "1 hour"

  join: brand_lookup {
    type: inner
    relationship: one_to_one
    sql_on: ${brand_lookup.bra_code} = ${barnacletopline.brand_code} ;;
  }
}

explore: barnaclepages {
  hidden: yes
  label: "Barnacle - Pages"
  sql_table_name: publications.barnaclepages ;;
  persist_for: "1 hour"

  join: brand_lookup {
    type: inner
    relationship: one_to_one
    sql_on: ${brand_lookup.bra_code} = ${barnaclepages.brand_code} ;;
  }
}

explore: barnaclesessions {
  hidden: yes
  label: "Barnacle - Sessions"
  sql_table_name: publications.barnaclesessions ;;
  persist_for: "20 hour"

  join: brand_lookup {
    type: inner
    relationship: one_to_one
    sql_on: ${brand_lookup.bra_code} = ${barnaclesessions.brand_code} ;;
  }
}

explore: barnaclesessions_30day {
  hidden: yes
  label: "Barnacle - Sessions 30 Day"
  sql_table_name: publications.barnaclesessions_30day ;;
  persist_for: "20 hour"

  join: brand_lookup {
    type: inner
    relationship: one_to_one
    sql_on: ${brand_lookup.bra_code} = ${barnaclesessions_30day.brand_code} ;;
  }
}

explore: google_analytics_prebid {
  label: "Google Analytics - Prebid"
  hidden: yes
  sql_table_name: publications.google_analytics_prebid ;;
  persist_for: "20 hour"

  join: brand_lookup {
    type: inner
    relationship: one_to_one
    sql_on: ${brand_lookup.bra_code} = ${google_analytics_prebid.brand_code} ;;
  }
}

explore: bigquery_google_analytics {
  label: "Google BigQuery"
  hidden: yes
  sql_table_name: publications.bigquery_google_analytics ;;
  persist_for: "22 hour"

  join: bigquery_google_analytics_hits {
    type: inner
    relationship: one_to_many
    sql_on: ${bigquery_google_analytics.fullvisitorid}=${bigquery_google_analytics_hits.fullvisitorid} ;;
  }

  join: bigquery_google_analytics_hits_customdimensions {
    type: inner
    relationship: one_to_many
    sql_on: ${bigquery_google_analytics.fullvisitorid}=${bigquery_google_analytics_hits_customdimensions.fullvisitorid} ;;
  }

  join: brand_lookup {
    type: inner
    relationship: one_to_one
    sql_on: ${brand_lookup.bra_code} = ${bigquery_google_analytics_hits.hits_page_hostname_pp1} ;;
  }
}

######################## THIS IS USED BUT HIDDEN #################################

explore: google_analytics_yearly {
  hidden: yes
  label: "Google Analytics - By Month"
  sql_table_name: publications.google_analytics_yearly ;;
  persist_for: "20 hour"

  join: brand_lookup {
    type: inner
    relationship: one_to_one
    sql_on: ${brand_lookup.bra_code} = ${google_analytics_yearly.brand_code} ;;
  }
}

explore: ga_demographics {
  hidden: yes
  label: "Google Analytics - Demographics"
  sql_table_name: publications.ga_demographics ;;
  persist_for: "20 hour"

  join: brand_lookup {
    type: inner
    relationship: one_to_one
    sql_on: ${brand_lookup.bra_code} = ${ga_demographics.brand_code} ;;
  }
}

explore: google_analytics_weekly_demogs {
  hidden: yes
  label: "Google Analytics - Weekly Demographics"
  sql_table_name: publications.google_analytics_weekly_demogs ;;
  persist_for: "20 hour"

  join: brand_lookup {
    type: inner
    relationship: one_to_one
    sql_on: ${brand_lookup.bra_code} = ${google_analytics_weekly_demogs.brand_code} ;;
  }
}

explore: google_analytics_demographics30days {
  hidden: yes
  label: "Google Analytics - 30 Day Demographics"
  sql_table_name: publications.google_analytics_demographics30days ;;
  persist_for: "20 hour"

  join: brand_lookup {
    type: inner
    relationship: one_to_one
    sql_on: ${brand_lookup.bra_code} = ${google_analytics_demographics30days.brand_code} ;;
  }
}

explore: google_analytics_trafficreport {
  hidden: yes
  label: "Google Analytics - Traffic Report"
  sql_table_name: publications.google_analytics_trafficreport ;;
  persist_for: "20 hour"
}

############################################################################









explore: google_analytics_marconi {
  hidden: yes
  label: "Google Analytics - Marconi Tracker"
  sql_table_name: publications.google_analytics_marconi ;;
  persist_for: "20 hour"
}




# - join: bigquery_google_analytics_hits
#   foreign_key: bigquery_google_analytics.fullvisitorid

# - join: bigquery_google_analytics_hits_customdimensions
#   foreign_key: bigquery_google_analytics.fullvisitorid
