connection: "caspian-live"

# include all views in this project
include: "*.view"

# include all dashboards in this project
include: "*.dashboard"

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# - explore: order_items
#   joins:
#     - join: orders
#       sql_on: ${orders.id} = ${order_items.order_id}
#     - join: users
#       sql_on: ${users.id} = ${orders.user_id}


explore: social_facebook_likes {
  label: "Brand Social Data"
  sql_table_name: publications.social_facebook_likes ;;
  persist_for: "24 hour"

  join: brand_lookup {
    type: inner
    relationship: one_to_one
    sql_on: ${brand_lookup.bra_description} = ${social_facebook_likes.name} ;;
  }

  join: social_twitter_likes {
    type: inner
    relationship: one_to_one
    sql_on: ${social_twitter_likes.name} = ${social_facebook_likes.name} ;;
  }

  join: social_youtube_likes {
    type: inner
    relationship: one_to_one
    sql_on: ${social_youtube_likes.brand} = ${social_facebook_likes.name} ;;
  }

  join: social_instagram_likes {
    type: inner
    relationship: one_to_one
    sql_on: ${social_instagram_likes.brand} = ${social_facebook_likes.name} ;;
  }

  join: social_pinterest {
    type: inner
    relationship: one_to_one
    sql_on: ${social_pinterest.brand} = ${social_facebook_likes.name} ;;
  }
}

explore: social_facebook_likes_not_our_brands {
  hidden: yes
  label: "Non-Brand Social Data"
  sql_table_name: publications.social_facebook_likes_not_our_brands ;;
  persist_for: "24 hour"

  join: social_twitter_likes_not_our_brands {
    type: inner
    relationship: one_to_one
    sql_on: ${social_twitter_likes_not_our_brands.name} = ${social_facebook_likes_not_our_brands.name} ;;
  }

  join: social_youtube_likes_not_our_brands {
    type: inner
    relationship: one_to_one
    sql_on: ${social_youtube_likes_not_our_brands.brand} = ${social_facebook_likes_not_our_brands.name} ;;
  }

  join: social_instagram_likes_not_our_brands {
    type: inner
    relationship: one_to_one
    sql_on: ${social_instagram_likes_not_our_brands.brand} = ${social_facebook_likes_not_our_brands.name} ;;
  }

  join: social_pinterest_not_our_brands {
    type: inner
    relationship: one_to_one
    sql_on: ${social_pinterest_not_our_brands.brand} = ${social_facebook_likes_not_our_brands.name} ;;
  }
}

explore: social_facebook_posts {
  hidden: yes
  label: "Facebook Posts"
  sql_table_name: publications.social_facebook_posts ;;
  persist_for: "1 hour"
}

explore: social_facebook_advanced_pages {
  label: "Facebook Pages"
  sql_table_name: publications.social_facebook_advanced_pages ;;
  persist_for: "1 hour"
}

explore: social_facebook_advanced_posts {
  label: "Facebook Posts"
  sql_table_name: publications.social_facebook_advanced_posts ;;
  persist_for: "1 hour"
}

explore: social_twitter_posts {
  label: "Twitter Posts"
  sql_table_name: publications.social_twitter_posts ;;
  persist_for: "1 hour"
}

explore: social_youtube_videos {
  hidden: yes
  label: "Youtube Videos"
  sql_table_name: publications.social_youtube_videos ;;
  persist_for: "1 hour"
}

explore: social_youtube_advanced {
  hidden: no
  label: "YouTube Videos"
  sql_table_name: publications.social_youtube_advanced ;;
  persist_for: "1 hour"
}


explore: social_twitter_trending_adv {
  label: "Twitter Trending"
  sql_table_name: publications.social_twitter_trending_adv ;;
  persist_for: "1 hour"
}

explore: social_youtube_trending {
  label: "YouTube Trending"
  sql_table_name: publications.social_youtube_trending ;;
  persist_for: "1 hour"
}


#     - join: ga_radio_twitter_data
#       type: inner
#       relationship: many_to_many
#       sql_on: ${ga_radio_twitter_data.brand} = ${ga_radio_social_data.brand}
#
#     - join: ga_radio_users_data
#       type: inner
#       relationship: many_to_many
#       sql_on: ${ga_radio_users_data.brand} = ${ga_radio_twitter_data.brand}
