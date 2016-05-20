- connection: caspian-live

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

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
    relationship: one_to_many
    sql_on: ${es_brand_optin.user_id} = ${es_users.user_id}
      
  - join: es_source
    type: inner
    relationship: one_to_one
    sql_on: ${es_brand_optin.brand} = ${es_source.brand}
    
  - join: brand_lookup
    type: inner
    relationship: one_to_one
    sql_on: ${es_source.brand} = ${brand_lookup.bra_code}
    
  - join: identities_keys
    type: inner
    relationship: one_to_one
    sql_on: ${es_users.user_id} = ${identities_keys.value}
    
  - join: identities
    type: inner
    relationship: many_to_one
    sql_on: ${identities_keys.idd_key_id} = ${identities.idd_id}
    
  - join: bauer_list
    type: inner
    relationship: one_to_one
    sql_on: ${identities.email} = ${bauer_list.customer_id}
    
  - join: odin_es_agg
    type: left_outer
    relationship: one_to_one
    sql_on: ${bauer_list.customer_id} = ${odin_es_agg.email_address}