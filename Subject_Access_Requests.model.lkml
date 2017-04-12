connection: "caspian-live"

# include all views in this project
include: "*.view"

# include all dashboards in this project
include: "*.dashboard"

explore: responsy_active {
  label: "SAR Template"
  persist_for: "2 hour"

  join: responsy_device {
    type: inner
    relationship: one_to_one
    sql_on: ${responsy_active.concatid} = ${responsy_device.concat_id} ;;
  }

  join: bauer_list {
    type: inner
    relationship: one_to_one
    sql_on: ${bauer_list.email_address} = ${responsy_active.email_address} ;;
  }

  # join:  responsy_active {
  #   type: inner
  #   relationship: one_to_one
  #   sql_on: ${responsy_active.email_address} = ${identities.email} ;;
  # }

  join: brand_lookup {
    type: inner
    relationship: one_to_one
    sql_on: ${brand_lookup.bra_code} = substring(UPPER(${responsy_active.launch_name}),1,3) ;;
  }

  join: gigya_users {
    type: inner
    relationship: one_to_one
    sql_on: ${gigya_users.email} = ${bauer_list.email_address} ;;
  }

  join: gigya_brand_optin {
    type: inner
    relationship: one_to_one
    sql_on: ${gigya_brand_optin.gigya_id} = ${gigya_users.gigya_id} ;;
  }

  join: gigya_newsletters {
    type: inner
    relationship: one_to_one
    sql_on: ${gigya_newsletters.gigya_id} = ${gigya_users.gigya_id} ;;
  }

  join: identities {
    type: inner
    relationship: one_to_one
    sql_on: ${identities.email} = ${bauer_list.email_address} ;;
  }

  join: brand_preferences {
    type: inner
    relationship: one_to_many
    sql_on: ${brand_preferences.idd_id} = ${identities.idd_id} ;;
  }
}

explore: responsys_engaged_list {
  label: "SAR Template Emailable List"
  persist_for: "2 hour"

  join: bauer_list {
    type: inner
    relationship: one_to_many
    sql_on: ${responsys_engaged_list.email_address} = ${bauer_list.email_address} ;;
  }

  join: responsys_newsletter_permissions {
    type: left_outer
    relationship: one_to_many
    sql_on: ${responsys_engaged_list.email_address} = ${responsys_newsletter_permissions.email_address} ;;
  }

  join: responsys_brand_permissions {
    type: left_outer
    relationship: one_to_many
    sql_on: ${responsys_engaged_list.email_address} = ${responsys_brand_permissions.email_address} ;;
  }

  join: brand_lookup {
    type: inner
    relationship: one_to_one
    sql_on: ${responsys_newsletter_permissions.brandcode}=${brand_lookup.bra_code} ;;
  }

  join: postcode_lookup {
    type: inner
    relationship: many_to_many
    sql_on: ${postcode_lookup.postcode} = ${bauer_list.postal_code} ;;
  }

  join: responsy_active {
    type: inner
    relationship: many_to_many
    sql_on: ${responsy_active.email_address} = ${responsys_engaged_list.email_address} ;;
  }

  join: identities {
    type: inner
    relationship: one_to_one
    sql_on: ${identities.email} = ${bauer_list.email_address} ;;
  }

}

# - explore: email_list
#   label: 'Testing - In Dev'
#   persist_for: 2 hour


explore: responsys_engaged_list_overlap {
  label: "Emailable Numbers - Overlap"
  hidden: yes
  persist_for: "2 hour"

  join: responsys_brand_permissions_overlap {
    type: left_outer
    relationship: one_to_many
    sql_on: ${responsys_engaged_list_overlap.email_address} = ${responsys_brand_permissions_overlap.email_address} ;;
  }

  join: responsys_brand_permissions_overlap2 {
    from: responsys_brand_permissions_overlap
    type: left_outer
    relationship: many_to_one
    sql_on: ${responsys_brand_permissions_overlap.brandcode} = ${responsys_brand_permissions_overlap2.brandcode} ;;
  }
}
