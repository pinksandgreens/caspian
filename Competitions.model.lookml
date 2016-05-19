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

- explore: es_users
 
  joins:
  - join: es_competition_entries
    type: inner
    relationship: one_to_many
    sql_on: ${es_users.user_id} = ${es_competition_entries.user_id}
    
  - join: es_competitions
    type: inner
    relationship: many_to_one
    sql_on: ${es_competitions.id} = ${es_competition_entries.competition_id}
      
  - join: es_brand_optin
    type: inner
    relationship: many_to_one
    sql_on: ${es_brand_optin.user_id} = ${es_users.user_id}
      
  - join: es_source
    type: inner
    relationship: many_to_one
    sql_on: ${es_brand_optin.brand} = ${es_source.brand}
    
  - join: brand_lookup
    type: inner
    relationship: one_to_one
    sql_on: ${es_source.brand} = ${brand_lookup.bra_code}