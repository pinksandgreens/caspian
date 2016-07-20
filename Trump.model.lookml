- connection: caspian-live

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

 ###################################################################################################################################################

- explore: bauer_list       
  label: 'WE MUST BUILD THE CUSTOMER WALL'
  persist_for: 24 hours

  joins:
  - join: gigya_users
    type: full_outer
    relationship: one_to_many
    sql_on: ${gigya_users.email} = ${bauer_list.email_address}
  
  - join: identities
    type: inner
    relationship: one_to_one
    sql_on: ${identities.email} = ${bauer_list.email_address}
  
  - join: gigya_brand_optin
    type: left_outer
    relationship: one_to_one
    sql_on: ${gigya_brand_optin.gigya_id} = ${gigya_users.gigya_id}
  
#   - join: brand_lookup
#     type: inner
#     relationship: one_to_one
#     sql_on: ${brand_lookup.bra_code} = ${gigya_brand_optin.brand_code}
  
  - join: gigya_social_identities
    type: inner
    relationship: one_to_one
    sql_on: ${gigya_social_identities.gigya_id} = ${gigya_users.gigya_id}
  
  - join: brand_preferences
    type: inner
    relationship: one_to_many
    sql_on: ${brand_preferences.idd_id} = ${identities.idd_id}
  
    
##########################################################################################################################################################

  - join: responsy_active
    type: full_outer
    relationship: one_to_one
    sql_on: ${responsy_active.email_address} = ${bauer_list.email_address}

  - join: brand_lookup
    type: inner
    relationship: one_to_one
    sql_on: ${brand_lookup.bra_code} = substring(UPPER(${responsy_active.launch_name}),1,3)
    
##########################################################################################################################################################


  - join: es_users
    type: left_outer
    relationship: one_to_many
    sql_on: ${es_users.email} = ${bauer_list.email_address}
  
  - join: es_competition_entries
    type: inner
    relationship: one_to_many
    sql_on: ${es_users.user_id} = ${es_competition_entries.user_id}
    
  - join: es_competitions
    type: inner
    relationship: many_to_one
    sql_on: ${es_competitions.id} = ${es_competition_entries.competition_id}
  
  - join: es_campaign_report
    type: inner
    relationship: one_to_one
    sql_on: ${es_competitions.id} = ${es_campaign_report.id}
#   sql_on: substring(UPPER(${es_competitions.external_ref}),1,12) = substring(UPPER(${es_campaign_report.external_ref}),1,12) #326 comps match
#   sql_on: UPPER(${es_competitions.name}) = UPPER(${es_campaign_report.name}) # 323 comps match

  - join: es_brand_optin
    type: inner
    relationship: one_to_many
    sql_on: ${es_brand_optin.user_id} = ${es_users.user_id}
      
  - join: es_source_no_tickets
    type: inner
    relationship: one_to_one
    sql_on: ${es_brand_optin.brand} = ${es_source_no_tickets.brand}
    
#   - join: brand_lookup
#     type: inner
#     relationship: one_to_one
#     sql_on: ${es_source_no_tickets.brand} = ${brand_lookup.bra_code}
    
  - join: identities_keys
    type: inner
    relationship: one_to_one
    sql_on: ${es_users.user_id} = ${identities_keys.value}

    
##########################################################################################################################################################

  - join: events
    type: left_outer
    relationship: many_to_one
    sql_on: ${gigya_users.gigya_id} = ${events.user_id}
    
  - join: snowplow_clicks
    type: inner
    relationship: many_to_many
    sql_on: ${events.event_id} = ${snowplow_clicks.root_id}
      
  - join: article_context
    type: inner
    relationship: one_to_one
    sql_on: ${events.event_id} = ${article_context.root_id}
      
  - join: sessions
    type: inner
    relationship: one_to_many
    sql_on: ${events.session_id} = ${sessions.session_id}
    
    
    
    
    
  