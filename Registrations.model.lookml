- connection: caspian-live

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

- explore: gigya_users

  joins:
  - join: bauer_list
    type: inner
    relationship: one_to_many
    sql_on: ${bauer_list.customer_id} = ${gigya_users.email}
  
  - join: identities
    type: inner
    relationship: one_to_one
    sql_on: ${identities.email} = ${bauer_list.customer_id}
  
  - join: gigya_brand_optin
    type: inner
    relationship: one_to_many
    sql_on: ${gigya_brand_optin.gigya_id} = ${gigya_users.gigya_id}
  
  - join: brand_lookup
    type: inner
    relationship: one_to_one
    sql_on: ${brand_lookup.bra_code} = ${gigya_brand_optin.brand_code}
  
  - join: gigya_social_identities
    type: inner
    relationship: one_to_one
    sql_on: ${gigya_social_identities.gigya_id} = ${gigya_users.gigya_id}
  
  - join: brand_preferences
    type: inner
    relationship: one_to_many
    sql_on: ${brand_preferences.idd_id} = ${identities.idd_id}

