connection: "caspian-live"

# include all views in this project
include: "*.view"

# include all dashboards in this project
include: "*.dashboard"

explore: social_reddit {
  label: "Reddit"
  sql_table_name: publications.social_reddit ;;
  persist_for: "1 hour"
}

explore: social_spike {
  label: "Spike"
  sql_table_name: publications.social_spike ;;
  persist_for: "1 hour"
}

explore: social_twitter_trending {
  label: "Twitter Trending"
  sql_table_name: publications.social_twitter_trending ;;
  persist_for: "1 hour"
}
