connection: "caspian-live"

# include all views in this project
include: "*.view"

# include all dashboards in this project
include: "*.dashboard"


explore: bauer_list {
  label: "SAR Template Emailable List"
  persist_for: "2 hour"


  join: identities {
    type: inner
    relationship: one_to_one
    sql_on: ${bauer_list.email_address} = ${identities.email} ;;
  }


  join: responsys_engaged_list {
    type: left_outer
    relationship: one_to_one
    sql_on: ${bauer_list.email_address} = ${responsys_engaged_list.email_address};;
  }

  join: responsys_newsletter_permissions {
    type: left_outer
    relationship: one_to_many
    sql_on: ${bauer_list.email_address} = ${responsys_newsletter_permissions.email_address} ;;
  }

  join: responsys_brand_permissions {
   type: left_outer
   relationship: one_to_many
   sql_on: ${bauer_list.email_address} = ${responsys_brand_permissions.email_address} ;;
  }


  join: responsy_active {
    type: inner
    relationship: one_to_one
    sql_on: ${responsy_active.email_address} = ${responsys_engaged_list.email_address} ;;
  }


}


# join: responsys_newsletter_permissions {
#   type: left_outer
#   relationship: one_to_many
#   sql_on: ${responsys_engaged_list.email_address} = ${responsys_newsletter_permissions.email_address} ;;
# }
#
# join: responsys_brand_permissions {
#   type: left_outer
#   relationship: one_to_many
#   sql_on: ${responsys_engaged_list.email_address} = ${responsys_brand_permissions.email_address} ;;
# }


#

#
#   join: brand_lookup {
#     type: inner
#     relationship: one_to_one
#     sql_on: ${responsys_newsletter_permissions.brandcode}=${brand_lookup.bra_code} ;;
#   }
#

#
#   join: responsy_active {
#     type: inner
#     relationship: one_to_one
#     sql_on: ${responsy_active.email_address} = ${responsys_engaged_list.email_address} ;;
#   }
