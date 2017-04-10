connection: "caspian-live"

# include all views in this project
include: "*.view"

# include all dashboards in this project
include: "*.dashboard"

explore: gigya_users {
  label: "User Registration Data"
  hidden: yes
  persist_for: "24 hour"

  join: bauer_list {
    type: full_outer
    relationship: one_to_many
    sql_on: ${bauer_list.email_address} = ${gigya_users.email} ;;
  }

#   join: radio_login_data_20160820 {
#     type: full_outer
#     relationship: one_to_many
#     sql_on: ${radio_login_data_20160820.account_email} = ${gigya_users.email} ;;
#   }

#   join: identities {
#     type: inner
#     relationship: one_to_one
#     sql_on: ${identities.email} = ${bauer_list.email_address} ;;
#   }

#   join: identities_keys {
#     type: inner
#     relationship: one_to_one
#     sql_on: ${identities.idd_id} = ${identities_keys.idd_key_id} ;;
#   }

  join: gigya_brand_optin {
    type: left_outer
    relationship: one_to_one
    sql_on: ${gigya_brand_optin.gigya_id} = ${gigya_users.gigya_id} ;;
  }

  join: gigya_newsletters {
    type: left_outer
    relationship: one_to_one
    sql_on: ${gigya_newsletters.gigya_id} = ${gigya_users.gigya_id} ;;
  }

  join: brand_lookup {
    type: inner
    relationship: one_to_many
    sql_on: ${brand_lookup.bra_code} = ${gigya_brand_optin.brand_code} ;;
  }

  #    sql_on: ${brand_lookup.bra_code} = ${bauer_list.regsource}


  join: gigya_social_identities {
    type: inner
    relationship: one_to_one
    sql_on: ${gigya_social_identities.gigya_id} = ${gigya_users.gigya_id} ;;
  }

#   join: brand_preferences {
#     type: inner
#     relationship: one_to_many
#     sql_on: ${brand_preferences.idd_id} = ${identities.idd_id} ;;
#   }

  join: postcode_lookup {
    type: inner
    relationship: many_to_many
    sql_on: ${postcode_lookup.postcode} = ${bauer_list.postal_code} ;;
  }
}

# explore: radio_login {
#   label: "Audio - Non AR Login"
#   sql_table_name: publications.radio_login ;;
#   persist_for: "20 hour"
# }
