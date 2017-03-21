connection: "bigquery-connection"

# include all views in this project
include: "*.view"

# include all dashboards in this project
include: "*.dashboard"

label: "x: BigQuery - Brands"

# the view to start exploring from
explore: ga_sessions {
  label: "BigQuery - Lifestyle"

  always_filter: {
    #This will be the default date range.
    filters: {
      field: date_filter
      value: "30 days"
    }
  }

  join: ga_sessions_lifestyle_crossover {
    type: inner
    relationship: one_to_many
    sql_on: ${ga_sessions_lifestyle_crossover.full_Visitor_Id} = ${ga_sessions.full_visitor_id} ;;
  }

  join: ga_sessions_lifestyle_advcompsearch {
    type: inner
    relationship: one_to_many
    sql_on: ${ga_sessions_lifestyle_advcompsearch.full_Visitor_Id} = ${ga_sessions.full_visitor_id} ;;
  }

  join: ga_sessions_lifestyle_brandsearch {
    type: inner
    relationship: one_to_many
    sql_on: ${ga_sessions_lifestyle_brandsearch.full_Visitor_Id} = ${ga_sessions.full_visitor_id} ;;
  }
}

# Hidden until we get a data layer change
#     - join: ga_sessions_lifestyle_articles
#       type: inner
#       relationship: one_to_many
#       sql_on: ${ga_sessions_lifestyle_articles.Unique_ID} = ${ga_sessions.full_visitor_id}


explore: ga_sessions_parkers {
  label: "BigQuery - Parkers"

  always_filter: {
    filters: {
      field: date_filter
      value: "30 days"
    }
  }

  join: ga_sessions_advcompsearch {
    type: inner
    relationship: one_to_many
    sql_on: ${ga_sessions_advcompsearch.full_Visitor_Id} = ${ga_sessions_parkers.full_visitor_id} ;;
  }

  join: ga_sessions_parkers_brandsearch {
    type: inner
    relationship: one_to_many
    sql_on: ${ga_sessions_parkers_brandsearch.full_Visitor_Id} = ${ga_sessions_parkers.full_visitor_id} ;;
  }
}

explore: ga_sessions_mcn_transactions {
  hidden: yes
  label: "BigQuery - MCN Transaction (BFS)"

  always_filter: {
    #This will be the default date range.
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}

explore: ga_sessions_empire {
  label: "BigQuery - Empire"

  always_filter: {
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}

explore: ga_sessions_debrief {
  label: "BigQuery - The Debrief"

  always_filter: {
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}

explore: parkers_competing_car_view {
  hidden: yes
  label: "BigQuery - Parkers - Find Competing Cars"

  always_filter: {
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}

explore: mcn_competing_bike_view {
  hidden: yes
  label: "BigQuery - MCN - Find Competing Bikes"

  always_filter: {
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}

explore: ccfs_competing_car_views {
  hidden: yes
  label: "BigQuery - CCFS - Find Competing Classic Cars"

  always_filter: {
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}

explore: ga_sessions_mcn {
  label: "BigQuery - MCN"

  always_filter: {
    filters: {
      field: date_filter
      value: "30 days"
    }
  }

  join: ga_sessions_mcn_advcompsearch {
    type: inner
    relationship: one_to_many
    sql_on: ${ga_sessions_mcn_advcompsearch.full_Visitor_Id} = ${ga_sessions_mcn.full_visitor_id} ;;
  }

  join: ga_sessions_mcn_brandsearch {
    type: inner
    relationship: one_to_many
    sql_on: ${ga_sessions_mcn_brandsearch.full_Visitor_Id} = ${ga_sessions_mcn.full_visitor_id} ;;
  }
}

explore: ga_sessions_motherandbaby {
  label: "BigQuery - Mother & Baby"

  always_filter: {
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}

explore: mother_baby_competing_products_view {
  hidden: yes
  label: "BigQuery - Mother & Baby - Competing Products"

  always_filter: {
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}

explore: ga_sessions_todaygolfer {
  label: "BigQuery - Today's Golfer"

  always_filter: {
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}

explore: ga_sessions_winit {
  label: "BigQuery - Winit"

  always_filter: {
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}


explore: angling_times_content_consumed_by_article {
  hidden: yes
  label: "BigQuery - Angling Times - Article Cohort Analysis"

  always_filter: {
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}

explore: mcn_most_popular_articles_by_content_consumption {
  hidden: yes
  label: "BigQuery - MCN - SBS Articles"

  always_filter: {
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}

explore: ga_sessions_planetradio {
  label: "BigQuery - Planet Radio"

  always_filter: {
    filters: {
      field: date_filter
      value: "30 days"
    }
  }

  join: ga_sessions_planetradio_advcompsearch {
    type: inner
    relationship: one_to_many
    sql_on: ${ga_sessions_planetradio_advcompsearch.full_Visitor_Id} = ${ga_sessions_planetradio.full_visitor_id} ;;
  }

}

explore: ga_sessions_greatmagazines {
  label: "BigQuery - Great Magazines"

  always_filter: {
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}

explore: jr_lifestyle_parent_TP1 {
  label: "BigQuery - Lifestyle - Content Analysis"
  hidden: yes

  join: jr_lifestyle_parent_TP2 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${jr_lifestyle_parent_TP2.Key} = ${jr_lifestyle_parent_TP1.Key} ;;
  }

  join: jr_lifestyle_parent_TP12 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${jr_lifestyle_parent_TP12.Key} = ${jr_lifestyle_parent_TP1.Key} ;;
  }

  join: jr_lifestyle_pageviews_TP1 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${jr_lifestyle_pageviews_TP1.Key} = ${jr_lifestyle_parent_TP1.Key} ;;
  }

  join: jr_lifestyle_pageviews_TP2 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${jr_lifestyle_pageviews_TP2.Key} = ${jr_lifestyle_parent_TP2.Key} ;;
  }

  join: jr_lifestyle_pageviews_TP12 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${jr_lifestyle_pageviews_TP12.Key} = ${jr_lifestyle_parent_TP2.Key} ;;
  }

  join: jr_lifestyle_pagetitle {
    type: left_outer
    relationship: one_to_many
    sql_on: ${jr_lifestyle_pagetitle.Key} = ${jr_lifestyle_parent_TP1.Key} ;;
  }

  join: jr_lifestyle_queryString {
    type: left_outer
    relationship: one_to_many
    sql_on: ${jr_lifestyle_queryString.Key} = ${jr_lifestyle_parent_TP1.Key} ;;
  }

  join: jr_lifestyle_date_expressions {
    type: left_outer
    relationship: one_to_many
    sql_on: ${jr_lifestyle_date_expressions.Key} = ${jr_lifestyle_parent_TP1.Key} ;;
  }

  join: jr_lifestyle_weekly_agg_content_pageviews_GA_NEW {
    type: left_outer
    relationship: one_to_many
    sql_on: ${jr_lifestyle_weekly_agg_content_pageviews_GA_NEW.Key} = ${jr_lifestyle_parent_TP1.Key} ;;
  }

  join: jr_lifestyle_referral_source_medium {
    type: left_outer
    relationship: one_to_many
    sql_on: ${jr_lifestyle_referral_source_medium.Key} = ${jr_lifestyle_parent_TP1.Key} ;;
  }

  always_filter: {
    filters: {
      field: jr_lifestyle_parent_TP1.TP1
      value: "last month"
    }

    filters: {
      field: jr_lifestyle_parent_TP2.TP2
      value: "2 months ago"
    }

    filters: {
      field: jr_lifestyle_parent_TP1.TP12
      value: "13 months ago"
    }

    filters: {
      field: jr_lifestyle_parent_TP1.brand_filter
      value: "grazia"
    }

    filters: {
      field: jr_lifestyle_referral_source_medium.referral_source_Medium_filter
      value: "referral, organic, social, cpc, email, Social, twitter, Chat, cpm, \"(none)\""
    }
  }
}

explore: ga_sessions_kiss {
  label: "BigQuery - Kiss"

  always_filter: {
    filters: {
      field: date_filter
      value: "30 days"
      }
    filters: {
      field: date_filter_premigration
      value: "30 days"
    }
  }
}

explore: ga_sessions_magic {
  label: "BigQuery - Magic"

  always_filter: {
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}

explore: ga_sessions_car {
  label: "BigQuery - Car Magazine"

  always_filter: {
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}


explore: jr_mcn_syb_funnel_30_days {
  label: "BigQuery - MCN SYB Funnel Journey"
  hidden: yes
}

explore: jr_mcn_syb_tx_customer_journey_source_rollup {
  label: "BigQuery - MCN SYB Source Rollup"
  hidden: yes
}

explore: jr_mcn_tx_source_attribution {
  label: "BigQuery - MCN - Tx Source Analysis"
  hidden: yes
  always_filter: {
    filters: {
      field: jr_mcn_tx_source_attribution.date_filter
      value: "last month"
    }
  }
}
