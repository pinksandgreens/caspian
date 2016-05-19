- connection: caspian-live

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

- explore: ced_launch_state
  joins:
    - join: ced_sent
      type: inner
      relationship: many_to_one
      sql_on: ${ced_sent.riid} = ${ced_launch_state.account_id}
    
    - join: ced_opened
      type: left_outer
      relationship: many_to_one
      sql_on: ${ced_opened.riid} = ${ced_launch_state.account_id}
    
    - join: ced_clicked
      type: left_outer
      relationship: many_to_one
      sql_on: ${ced_clicked.riid} = ${ced_launch_state.account_id}
    
    - join: ced_bounced
      type: left_outer
      relationship: many_to_one
      sql_on: ${ced_bounced.riid} = ${ced_launch_state.account_id}