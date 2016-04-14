- view: information_request_template
  derived_table:
    sql: |
      select
       gigya_users.gigya_id as gigya_id,
       gigya_users.email as email,
       gigya_users.created,
       gigya_users.ddw_updated_date,
       gigya_users.registered_timestamp,
       gigya_newsletters.optin_subscribe_date,
       gigya_newsletters.optin_unsubscribe_date,
       
       decode(gigya_users.baueremailoptin,'t',
        '1',
        '0'
       ) AS BauerOptin,
       decode(
        gigya_users.thirdpartyemailoptin,
        't',
        '1',
        '0'
       ) AS ThirdOptin,
       gigya_brand_optin.brand_code as brand_code,
       decode(
        gigya_brand_optin.emailoptin,
        'true',
        '1',
        '0'
       ) AS BrandOptin,
       gigya_nl_lookup.nwlname as newletter_name,
       gigya_newsletters.id newsletter_id,
       decode(
        gigya_newsletters.optin,
        't',
        '1',
        '0'
       ) AS NwlOptin
      FROM
       publications.gigya_users
      INNER JOIN publications.gigya_brand_optin ON gigya_users.gigya_id = gigya_brand_optin.gigya_id
      INNER JOIN publications.gigya_newsletters ON gigya_users.gigya_id = gigya_newsletters.gigya_id
      INNER JOIN publications.gigya_nl_lookup ON gigya_newsletters. ID = gigya_nl_lookup.nwlid
      WHERE gigya_nl_lookup.nwlbrandcode = gigya_brand_optin.brand_code
      ORDER BY
       brand_code,
       ID
    
  fields:

  - dimension: gigya_id
    sql: ${TABLE}.gigya_id
    
  - dimension: email
    sql: ${TABLE}.email

  - dimension: BauerOptin
    sql: ${TABLE}.BauerOptin

  - dimension: ThirdOptin
    sql: ${TABLE}.ThirdOptin

  - dimension: BrandOptin
    sql: ${TABLE}.BrandOptin

  - dimension: newletter_name
    sql: ${TABLE}.newletter_name

  - dimension: newsletter_id
    sql: ${TABLE}.newsletter_id

  - dimension: NwlOptin
    sql: ${TABLE}.NwlOptin
    
  - dimension: brand_code
    sql: ${TABLE}.brand_code
    
  - dimension: ddw_updated_date
    type: time
    timeframes: [time, hour, date, week, month]
    sql: ${TABLE}.ddw_updated_date
    
  - dimension: created
    type: time
    timeframes: [time, hour, date, week, month]
    sql: ${TABLE}.created
    
  - dimension: registered_timestamp
    type: time
    timeframes: [time, hour, date, week, month]
    sql: ${TABLE}.registered_timestamp
    
  - dimension: optin_subscribe_date
    type: time
    timeframes: [time, hour, date, week, month]
    sql: ${TABLE}.optin_subscribe_date
    
  - dimension: optin_unsubscribe_date
    type: time
    timeframes: [time, hour, date, week, month]
    sql: ${TABLE}.optin_unsubscribe_date
    
    
  - measure: count
    type: count
