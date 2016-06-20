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
  sql_table_name: publications.ga_radio_social_data
  
  joins:
   - join: brand_lookup
     type: inner
     relationship: many_to_many
     sql_on: ${brand_lookup.bra_description} = ${ga_radio_social_data.brand}
