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

#- explore: gigya_users

  joins:
  - join: gigya_brand_optin
    type: inner
    relationship: one_to_many
    sql_on: ${gigya_users.gigya_id} = ${gigya_brand_optin.gigya_id}
    
  - join: es_source
    type: inner
    relationship: many_to_one
    sql_on: ${gigya_brand_optin.brand_code} = ${es_source.brand}