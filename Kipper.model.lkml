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


explore: kipper {
  hidden: yes
  sql_table_name: publications.kipper ;;
}

explore: kipper_historical {
  hidden:  yes
  sql_table_name: publications.kipper_historical ;;
}
