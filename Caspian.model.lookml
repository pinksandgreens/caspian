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

- explore: gigya_users

  joins:
  - join: responsys_email_history
    type: inner
    relationship: one_to_many
    sql_on: ${gigya_users.email} = ${responsys_email_history.email_address}
    
  - join: nudge_email_history
    type: inner
    relationship: one_to_many
    sql_on: ${nudge_email_history.email_address} = ${gigya_users.email}
    
  - join: bk_categories
    type: inner
    relationship: one_to_many
    sql_on: ${gigya_users.gigya_id} = ${bk_categories.gygia_id}
    
  - join: events
    type: inner
    relationship: one_to_many
    sql_on: ${gigya_users.gigya_id} = ${events.user_id}
    
  - join: es_users
    type: inner
    relationship: one_to_many
    sql_on: ${gigya_users.email} = ${es_users.email}
    
  
- explore: events
  joins:
    - join: gigya_users
      type: left_outer
      relationship: many_to_one
      sql_on: ${gigya_users.gigya_id} = ${events.user_id}








  