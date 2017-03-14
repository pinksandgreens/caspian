connection: "caspian-live"

# include all views in this project
include: "*.view"

# include all dashboards in this project
include: "*.dashboard"

explore: nudge_individuals {
  persist_for: "24 hour"
  label: "Mini-Nudge Database"
  # # Select the views that should be a part of this model,
  # # and define the joins that connect them together.

  join: nudge_households {
    type: inner
    relationship: one_to_many
    sql_on: ${nudge_individuals.household_id} = ${nudge_households.household_id} ;;
  }

  join: nudge_subscriptions {
    type: inner
    relationship: one_to_one
    sql_on: ${nudge_individuals.individual_id} = ${nudge_subscriptions.individual_id} ;;
  }

  join: nudge_interactions {
    type: inner
    relationship: one_to_one
    sql_on: ${nudge_individuals.individual_id} = ${nudge_interactions.individual_id} ;;
  }

  join: nudge_registrations {
    type: inner
    relationship: one_to_one
    sql_on: ${nudge_individuals.individual_id} = ${nudge_registrations.individual_id} ;;
  }

# THIS NEEDS SORTING AS IT NEEDS TO BE AT INDIVIDUAL LEVEL NOT SUBS LEVEL
  join: brand_lookup {
    type: inner
    relationship: one_to_one
    sql_on: ${brand_lookup.bra_code} = ${nudge_subscriptions.magazine_code} ;;
  }

  join: nudge_transactions {
    type: inner
    relationship: one_to_many
    sql_on: ${nudge_individuals.individual_id} = ${nudge_transactions.individual_id} ;;
  }

  join: nudge_insurance_details {
    type: inner
    relationship: many_to_many
    sql_on: ${nudge_interactions.source_key} = ${nudge_insurance_details.transaction_id} ;;
  }

  join: nudge_mcn_taxonomy {
    type: left_outer
    relationship: many_to_one
    sql_on: ${nudge_insurance_details.id} = ${nudge_mcn_taxonomy.id} ;;
  }
}
