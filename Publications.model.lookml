- connection: caspian-live

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

- explore: bauer_list
  joins:
    - join: gigya_users
      type: left_outer
      relationship: many_to_one
      sql_on: ${gigya_users.email} = ${bauer_list.customer_id}







# LEFT JOIN publications.nudge_individuals ON nudge_individuals.individual_id = gigya_users.individual_id
# LEFT JOIN publications.identities ON identities.email = bauer_list.customer_id