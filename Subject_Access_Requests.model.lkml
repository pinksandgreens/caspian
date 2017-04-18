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
    type: full_outer
    relationship: one_to_one
    sql_on: ${bauer_list.email_address} = ${responsys_engaged_list.email_address};;
  }

  join: responsys_newsletter_permissions {
    type: full_outer
    relationship: one_to_many
    sql_on: ${bauer_list.email_address} = ${responsys_newsletter_permissions.email_address} ;;
  }

  join: responsys_brand_permissions {
   type: full_outer
   relationship: one_to_many
   sql_on: ${bauer_list.email_address} = ${responsys_brand_permissions.email_address} ;;
  }

  join: responsy_active {
    type: full_outer
    relationship: one_to_one
    sql_on:${bauer_list.email_address} = ${responsy_active.email_address} ;;
  }


}
