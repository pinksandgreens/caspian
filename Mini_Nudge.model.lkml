connection: "caspian-live"

# include all views in this project
include: "*.view"

# include all dashboards in this project
include: "*.dashboard"

explore: nudge_individuals {
  persist_for: "24 hour"
  label: "Mini-Nudge Database"
  view_label: "2. Individuals"
  # # Select the views that should be a part of this model,
  # # and define the joins that connect them together.

  join: nudge_households {
    type: inner
    view_label: "1. Households"
    relationship: one_to_one
    sql_on: ${nudge_individuals.household_id} = ${nudge_households.household_id} ;;
  }

  join: nudge_subscriptions {
    type: inner
    view_label: "4. Subscriptions (Beta)"
    relationship: one_to_many
    sql_on: ${nudge_individuals.individual_id} = ${nudge_subscriptions.individual_id} ;;
  }

  join: nudge_subscription_history {
    type: inner
    view_label: "5. Subscriptions Hisotry (Beta)"
    relationship: one_to_many
    sql_on: ${nudge_individuals.individual_id} = ${nudge_subscription_history.individual_id} ;;
  }

  join: nudge_interactions {
    type: left_outer
    view_label: "3. Interactions"
    relationship: one_to_many
    sql_on: ${nudge_individuals.individual_id} = ${nudge_interactions.individual_id} ;;
  }

  join: nudge_registrations {
    type: inner
    view_label: "9. Regsitrations"
    relationship: one_to_one
    sql_on: ${nudge_individuals.individual_id} = ${nudge_registrations.individual_id} ;;
  }

# THIS NEEDS SORTING AS IT NEEDS TO BE AT INDIVIDUAL LEVEL NOT SUBS LEVEL
  join: brand_lookup {
    type: inner
    view_label: "Brand Lookup (TESTING)"
    relationship: one_to_one
    sql_on: ${brand_lookup.bra_code} = ${nudge_brands.code} ;;
  }

  join: nudge_transactions {
    type: inner
    view_label: "6. Transactions (Beta)"
    relationship: one_to_many
    sql_on: ${nudge_individuals.individual_id} = ${nudge_transactions.individual_id} ;;
  }

  join: nudge_insurance_details {
    type: inner
    view_label: "7. Insurance Details (Beta)"
    relationship: many_to_many
    sql_on: ${nudge_interactions.source_key} = ${nudge_insurance_details.transaction_id} ;;
  }

  join: nudge_mcn_taxonomy {
    type: left_outer
    view_label: "8. MCN Taxonomy Lookup"
    relationship: many_to_one
    sql_on: ${nudge_insurance_details.id} = ${nudge_mcn_taxonomy.id} ;;
  }

  join: nudge_brand_permissions {
    type: inner
    view_label: "XX. Brand Permissions"
    relationship: one_to_many
    sql_on: ${nudge_individuals.individual_id} = ${nudge_brand_permissions.individual_id} ;;
  }

  join: nudge_brands {
    type: full_outer
    view_label: "0. Nudge Brands"
    relationship: one_to_many
    sql_on: ${nudge_interactions.magazine_code} = ${nudge_brands.code} ;;
  }



}
