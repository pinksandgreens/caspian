- connection: caspian-live

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

- explore: bauer_list
  persist_for: 24 hour
  hidden: TRUE
  label: 'General User Demographics'
  joins:
    - join: gigya_users
      type: left_outer
      relationship: many_to_one
      sql_on: ${gigya_users.email} = ${bauer_list.customer_id}
      
    - join: nudge_individuals
      type: left_outer
      relationship: one_to_one
      sql_on: ${nudge_individuals.individual_id} = ${gigya_users.individual_id}

    - join: identities
      type: left_outer
      relationship: one_to_one
      sql_on: ${identities.email} = ${bauer_list.customer_id}

#- explore: interactions

