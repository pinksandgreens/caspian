- connection: caspian-live

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.

- explore: bk_swap_ids_gygia
  label: 'DMP Audience Data'

  joins:
  - join: bk_identity_categories
    type: inner
    relationship: one_to_one
    sql_on: ${bk_swap_ids_gygia.bk_uuid} = ${bk_identity_categories.user_id}
       
  - join: bk_taxonomy_categories
    type: inner
    relationship: many_to_one
    sql_on: ${bk_identity_categories.category_id} = ${bk_taxonomy_categories.node_id}
       
  - join: gigya_users
    type: inner
    relationship: one_to_one
    sql_on: ${bk_swap_ids_gygia.gygia_id} = ${gigya_users.gigya_id}