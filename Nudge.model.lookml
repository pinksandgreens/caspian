- connection: caspian-live

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project



- explore: nudge_individuals
  persist_for: 24 hour
  label: 'Nudge Database'

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.

  joins:
  - join: nudge_households
    type: inner
    relationship: one_to_one
    sql_on: ${nudge_individuals.individual_id} = ${nudge_households.household_id} 

  - join: nudge_subscriptions
    type: inner
    relationship: one_to_one
    sql_on: ${nudge_individuals.individual_id} = ${nudge_subscriptions.individual_id} 
    
  - join: nudge_interactions
    type: inner
    relationship: one_to_one
    sql_on: ${nudge_individuals.individual_id} = ${nudge_interactions.individual_id}
    
  - join: nudge_registrations
    type: inner
    relationship: one_to_one
    sql_on: ${nudge_individuals.individual_id} = ${nudge_registrations.individual_id}
    
  - join: odin_global_permission
    type: inner
    relationship: one_to_one
    sql_on: ${nudge_individuals.email_address} = ${odin_global_permission.email_address}
  
  - join: odin_newsletter_permission
    type: inner
    relationship: one_to_one
    sql_on: ${nudge_individuals.email_address} = ${odin_newsletter_permission.email_address}

  - join: odin_subs_raw
    type: inner
    relationship: one_to_one
    sql_on: ${nudge_individuals.email_address} = ${odin_subs_raw.email_address}
    
  - join: responsys_newsletter_permissions
    type: left_outer
    relationship: one_to_one
    sql_on: ${nudge_individuals.email_address} = ${responsys_newsletter_permissions.email_address}

  - join: responsys_brand_permissions
    type: left_outer
    relationship: one_to_one
    sql_on: ${nudge_individuals.email_address} = ${responsys_brand_permissions.email_address}
    
  - join: brand_lookup
    type: inner
    relationship: one_to_one
    sql_on: ${brand_lookup.bra_code} = ${nudge_subscriptions.magazine_code}
    
  - join: nudge_transactions
    type: inner
    relationship: one_to_many
    sql_on: ${nudge_individuals.individual_id} = ${nudge_transactions.individual_id}    

# individual_id - base id for interactions
# unique_table_id - concat id for interactions

  - join: nudge_insurance_details
    type: inner
    relationship: many_to_many
    sql_on: ${nudge_interactions.source_key} = ${nudge_insurance_details.transaction_id}
    
  - join: nudge_mcn_taxonomy
    type: inner
    relationship: many_to_one
    sql_on: ${nudge_insurance_details.id} = ${nudge_mcn_taxonomy.id}   
