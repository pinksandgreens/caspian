
- view: location_long_lat
  derived_table:
    sql: |
      select publications.gigya_id,
      SELECT publications.gigya_users.location_lat|| ', ' ||publications.gigya_users.location_long from publications.gigya_users limit 50;

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: column
    type: string
    sql: ${TABLE}."Location"

  sets:
    detail:
      - column

