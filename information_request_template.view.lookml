- view: information_request_template
  derived_table:
    sql: |
      select
       gigya_users.gigya_id as gigya_id,
       gigya_users.email as email,
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
    
  - measure: count
    type: count
