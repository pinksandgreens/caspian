- connection: caspian-live

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project



- explore: nudge_individuals
  label: 'Nudge Database'

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.

  joins:
  - join: nudge_households
    type: inner
    relationship: one_to_one
    sql_on: ${nudge_individuals.individual_id} = ${nudge_households.household_id} 

