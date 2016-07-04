- connection: caspian-live

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# - explore: order_items
#   joins:
#     - join: orders
#       sql_on: ${orders.id} = ${order_items.order_id}
#     - join: users
#       sql_on: ${users.id} = ${orders.user_id}


- explore: ga_radio_social_data
  label: 'Brand Social Data'
  sql_table_name: publications.ga_radio_twitter_data
  persist_for: 1 hour
  
  joins:
    - join: brand_lookup
      type: inner
      relationship: many_to_many
      sql_on: ${brand_lookup.bra_description} = ${ga_radio_social_data.brand}
  
    - join: ga_radio_twitter_data
      type: inner
      relationship: many_to_many
      sql_on: ${ga_radio_twitter_data.brand} = ${ga_radio_social_data.brand}
     
    - join: ga_radio_users_data
      type: inner
      relationship: many_to_many
      sql_on: ${ga_radio_users_data.brand} = ${ga_radio_twitter_data.brand}
  