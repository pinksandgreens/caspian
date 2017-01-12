- view: nudge_insurance_details
  sql_table_name: publications.nudge_insurance_details
  fields:

  - dimension: id
    type: string
    sql: ${TABLE}.manufacturer || '-' || ${TABLE}.model

  - dimension: abi_code
    type: string
    sql: ${TABLE}.abi_code

  - dimension_group: car_licence
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.car_licence_date

  - dimension: car_licence_type
    type: string
    sql: ${TABLE}.car_licence_type

  - dimension: cheapest_quote
    type: string
    sql: ${TABLE}.cheapest_quote

  - dimension: cover_type
    type: string
    sql: ${TABLE}.cover_type

  - dimension: do_not_notify
    type: string
    sql: ${TABLE}.do_not_notify

  - dimension: employment
    type: string
    sql: ${TABLE}.employment

  - dimension: engine_size
    type: string
    sql: ${TABLE}.engine_size

  - dimension: fuel_type
    type: string
    sql: ${TABLE}.fuel_type

  - dimension: home_owner
    type: string
    sql: ${TABLE}.home_owner

  - dimension_group: licence_start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.licence_start_date

  - dimension: licence_type
    type: string
    sql: ${TABLE}.licence_type

  - dimension_group: main_ins_item_purc
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.main_ins_item_purc_date

  - dimension: main_ins_item_val
    type: string
    sql: ${TABLE}.main_ins_item_val

  - dimension: manufacturer
    type: string
    sql: ${TABLE}.manufacturer

  - dimension: marital_status
    type: string
    sql: ${TABLE}.marital_status

  - dimension: model
    type: string
    sql: ${TABLE}.model

  - dimension: ncd_years
    type: string
    sql: ${TABLE}.ncd_years

  - dimension_group: next_renewal
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.next_renewal_date

  - dimension: not_bought_yet
    type: string
    sql: ${TABLE}.not_bought_yet

  - dimension: number_children
    type: string
    sql: ${TABLE}.number_children

  - dimension_group: quote
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.quote_date

  - dimension: registration
    type: string
    sql: ${TABLE}.registration

  - dimension_group: registration
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.registration_date

  - dimension_group: renewal
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.renewal_date

  - dimension: renewal_price
    type: string
    sql: ${TABLE}.renewal_price

  - dimension_group: residence
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.residence

  - dimension: source
    type: string
    sql: ${TABLE}.source

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_date

  - dimension: tot_claims_fault
    type: string
    sql: ${TABLE}.tot_claims_fault

  - dimension: total_claims
    type: string
    sql: ${TABLE}.total_claims

  - dimension: total_pts
    type: string
    sql: ${TABLE}.total_pts

  - dimension: transaction_id
    type: string
    sql: ${TABLE}.transaction_id

  - dimension: transmission
    type: string
    sql: ${TABLE}.transmission

  - dimension: where_heard_about
    type: string
    sql: ${TABLE}.where_heard_about

  - dimension: year_of_manufact
    type: string
    sql: ${TABLE}.year_of_manufact

  - measure: count
    type: count
    drill_fields: []



