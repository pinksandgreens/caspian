connection: "caspian-live"

# include all views in this project
include: "*.view"

# include all dashboards in this project
include: "*.dashboard"

explore: es_users {
  label: "Competition Data"
  persist_for: "24 hour"

  join: es_competition_entries {
    type: inner
    relationship: one_to_many
    sql_on: ${es_users.user_id} = ${es_competition_entries.user_id} ;;
  }

  join: es_competitions {
    type: inner
    relationship: many_to_one
    sql_on: ${es_competitions.id} = ${es_competition_entries.competition_id} ;;
  }

  join: es_campaign_report {
    type: inner
    relationship: one_to_one
    sql_on: ${es_competitions.id} = ${es_campaign_report.id} ;;
  }

  #   sql_on: substring(UPPER(${es_competitions.external_ref}),1,12) = substring(UPPER(${es_campaign_report.external_ref}),1,12) #326 comps match
  #   sql_on: UPPER(${es_competitions.name}) = UPPER(${es_campaign_report.name}) # 323 comps match

  join: es_brand_optin {
    type: inner
    relationship: one_to_many
    sql_on: ${es_brand_optin.user_id} = ${es_users.user_id} ;;
  }

  join: es_source_no_tickets {
    type: inner
    relationship: one_to_one
    sql_on: ${es_brand_optin.brand} = ${es_source_no_tickets.brand} ;;
  }

  join: brand_lookup {
    type: inner
    relationship: one_to_one
    sql_on: ${es_brand_optin.brand}=${brand_lookup.bra_code} ;;
  }

  join: identities_keys {
    type: inner
    relationship: one_to_one
    sql_on: ${es_users.user_id} = ${identities_keys.value} ;;
  }

  join: identities {
    type: inner
    relationship: many_to_one
    sql_on: ${identities_keys.idd_key_id} = ${identities.idd_id} ;;
  }

  # DO NOT REMOVE IDENTITIES IS MATCHING BASED ON BAUER LIST - SO BAUER LIST CAN BE USED

  join: bauer_list {
    type: inner
    relationship: one_to_one
    sql_on: ${identities.email} = ${bauer_list.email_address} ;;
  }
}

#   - join: es_competition_entries_banded_today
#     type: inner
#     relationship: one_to_one
#     sql_on: ${bauer_list.email_address} = ${es_competition_entries_banded_today.email}
#
#   - join: es_competition_entries_banded_7_days
#     type: inner
#     relationship: one_to_one
#     sql_on: ${bauer_list.email_address} = ${es_competition_entries_banded_7_days.email}
#
#   - join: es_competition_entries_banded_30_days
#     type: inner
#     relationship: one_to_one
#     sql_on: ${bauer_list.email_address} = ${es_competition_entries_banded_30_days.email}
#
#   - join: es_competition_entries_banded_3_months
#     type: inner
#     relationship: one_to_one
#     sql_on: ${bauer_list.email_address} = ${es_competition_entries_banded_3_months.email}
#
#   - join: es_competition_entries_banded_6_months
#     type: inner
#     relationship: one_to_one
#     sql_on: ${bauer_list.email_address} = ${es_competition_entries_banded_6_months.email}
#
#   - join: es_competition_entries_banded_1_year
#     type: inner
#     relationship: one_to_one
#     sql_on: ${bauer_list.email_address} = ${es_competition_entries_banded_1_year.email}
#
