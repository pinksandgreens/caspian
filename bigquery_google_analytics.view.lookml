- view: bigquery_google_analytics
  label: 'User Data'
  sql_table_name: publications.bigquery_google_analytics
  fields:

  - dimension: unique_id
    label: 'Unique User ID'
    type: string
    primary_key: TRUE
    sql: ${TABLE}.fullvisitorid || ${TABLE}.visitnumber || ${TABLE}.date || ${TABLE}.visitid

  - dimension: fullvisitorid
    hidden: TRUE
    label: 'Unique User ID'
    type: string
    sql: ${TABLE}.fullvisitorid
    
#   - measure: count
#     type: count

  - measure: Unique_Users
    label: 'Unique Users'
    type: count_distinct
    sql: ${TABLE}.fullvisitorid
    
  - dimension: channelgrouping
    label: 'Channel Grouping'
    type: string
    sql: ${TABLE}.channelgrouping

  - dimension: date
    label: ''
    type: time
    timeframes: [date, week, month, month_num]
    convert_tz: false
    sql: TO_DATE(${TABLE}.date,'YYYYMMDD')

  - dimension: device_browser
    label: 'Device - Browser'
    type: string
    sql: ${TABLE}.device_browser

  - dimension: device_browsersize
    label: 'Device - Browser Size'
    type: string
    sql: ${TABLE}.device_browsersize

  - dimension: device_browserversion
    hidden: TRUE
    label: 'Device - Browser Version'
    type: string
    sql: ${TABLE}.device_browserversion

  - dimension: device_devicecategory
    label: 'Device - Device Type'
    type: string
    sql: ${TABLE}.device_devicecategory

  - dimension: device_flashversion
    hidden: TRUE
    type: string
    sql: ${TABLE}.device_flashversion

  - dimension: device_javaenabled
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.device_javaenabled

  - dimension: device_language
    hidden: TRUE
    type: string
    sql: ${TABLE}.device_language

  - dimension: device_mobiledevicebranding
    label: 'Device - Brand'
    type: string
    sql: ${TABLE}.device_mobiledevicebranding

  - dimension: device_mobiledeviceinfo
    hidden: TRUE
    type: string
    sql: ${TABLE}.device_mobiledeviceinfo

  - dimension: device_mobiledevicemarketingname
    hidden: TRUE
    type: string
    sql: ${TABLE}.device_mobiledevicemarketingname

  - dimension: device_mobiledevicemodel
    label: 'Device - Model'
    type: string
    sql: ${TABLE}.device_mobiledevicemodel

  - dimension: device_mobileinputselector
    label: 'Device - Input Type'
    type: string
    sql: ${TABLE}.device_mobileinputselector

  - dimension: device_operatingsystem
    label: 'Device - Operating System'
    type: string
    sql: ${TABLE}.device_operatingsystem

  - dimension: device_operatingsystemversion
    label: 'Device - Operating System Version'
    type: string
    sql: ${TABLE}.device_operatingsystemversion

  - dimension: device_screencolors
    hidden: TRUE
    type: string
    sql: ${TABLE}.device_screencolors

  - dimension: device_screenresolution
    label: 'Device - Resolution'
    type: string
    sql: ${TABLE}.device_screenresolution

  - dimension: geonetwork_city
    label: 'Location - City'
    type: string
    sql: ${TABLE}.geonetwork_city

  - dimension: geonetwork_cityid
    hidden: TRUE
    label: 'Location - City ID'
    type: string
    sql: ${TABLE}.geonetwork_cityid

  - dimension: geonetwork_continent
    label: 'Location - Continent'
    type: string
    sql: ${TABLE}.geonetwork_continent

  - dimension: geonetwork_country
    label: 'Location - Country'
    type: string
    sql: ${TABLE}.geonetwork_country

  - dimension: geonetwork_latitude
    label: 'Location - Latitude'
    type: string
    sql: ${TABLE}.geonetwork_latitude

  - dimension: geonetwork_longitude
    label: 'Location - Longitude'
    type: string
    sql: ${TABLE}.geonetwork_longitude

  - dimension: location
    label: 'Latitude/Longitude Location'
    type: location
    sql_latitude: ROUND(${TABLE}.geonetwork_latitude,1)
    sql_longitude: ROUND(${TABLE}.geonetwork_longitude,1)

  - dimension: geonetwork_metro
    label: 'Location - Metropolitan Area'
    type: string
    sql: ${TABLE}.geonetwork_metro

  - dimension: geonetwork_networkdomain
    hidden: TRUE
    label: 'network domain uyselessdsds'
    type: string
    sql: ${TABLE}.geonetwork_networkdomain

  - dimension: geonetwork_networklocation
    hidden: TRUE
    type: string
    sql: ${TABLE}.geonetwork_networklocation

  - dimension: geonetwork_region
    label: 'Location - Region'
    type: string
    sql: ${TABLE}.geonetwork_region

  - dimension: geonetwork_subcontinent
    label: 'Location - Subcontinent'
    type: string
    sql: ${TABLE}.geonetwork_subcontinent

  - dimension_group: import
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.import_date

  - measure: totals_bounces
    type: number
    sql: ${TABLE}.totals_bounces

  - measure: totals_hits
    type: sum
    sql: ${TABLE}.totals_hits

  - measure: totals_newvisits
    label: 'Total New Sessions'
    type: sum
    sql: ${TABLE}.totals_newvisits

  - measure: totals_pageviews
    type: sum
    sql: ${TABLE}.totals_pageviews

  - measure: totals_screenviews
    type: sum
    sql: ${TABLE}.totals_screenviews

  - measure: totals_timeonscreen
    type: sum
    sql: ${TABLE}.totals_timeonscreen

  - measure: totals_timeonsite
    type: sum
    sql: ${TABLE}.totals_timeonsite

  - measure: totals_totaltransactionrevenue
    type: sum
    sql: ${TABLE}.totals_totaltransactionrevenue

  - measure: totals_transactionrevenue
    type: sum
    sql: ${TABLE}.totals_transactionrevenue

  - measure: totals_transactions
    type: sum
    sql: ${TABLE}.totals_transactions

  - measure: totals_uniquescreenviews
    type: sum
    sql: ${TABLE}.totals_uniquescreenviews

  - measure: totals_visits
    label: 'Total Sessions'
    type: sum
    sql: ${TABLE}.totals_visits

  - dimension: trafficsource_adcontent
    label: 'Traffic Source - Adcontent'
    type: string
    sql: ${TABLE}.trafficsource_adcontent

  - dimension: trafficsource_adwordsclickinfo_adgroupid
    label: 'Traffic Source - Adgroup ID'
    type: number
    value_format_name: id
    sql: ${TABLE}.trafficsource_adwordsclickinfo_adgroupid

  - dimension: trafficsource_adwordsclickinfo_adnetworktype
    label: 'Traffic Source - Adnetwork Type'
    type: string
    sql: ${TABLE}.trafficsource_adwordsclickinfo_adnetworktype

  - dimension: trafficsource_adwordsclickinfo_campaignid
    label: 'Traffic Source - Campaign ID'
    type: number
    value_format_name: id
    sql: ${TABLE}.trafficsource_adwordsclickinfo_campaignid

  - dimension: trafficsource_adwordsclickinfo_creativeid
    label: 'Traffic Source - Creative ID'
    type: number
    value_format_name: id
    sql: ${TABLE}.trafficsource_adwordsclickinfo_creativeid

  - dimension: trafficsource_adwordsclickinfo_criteriaid
    label: 'Traffic Source - Criteria ID'
    type: number
    value_format_name: id
    sql: ${TABLE}.trafficsource_adwordsclickinfo_criteriaid

  - dimension: trafficsource_adwordsclickinfo_criteriaparameters
    label: 'Traffic Source - Criteria Params'
    type: string
    sql: ${TABLE}.trafficsource_adwordsclickinfo_criteriaparameters

  - dimension: trafficsource_adwordsclickinfo_customerid
    label: 'Traffic Source - Customer ID'
    type: number
    value_format_name: id
    sql: ${TABLE}.trafficsource_adwordsclickinfo_customerid

  - dimension: trafficsource_adwordsclickinfo_gclid
    label: 'Traffic Source - Google Click Identifier ID'
    type: string
    sql: ${TABLE}.trafficsource_adwordsclickinfo_gclid

  - dimension: trafficsource_adwordsclickinfo_isvideoad
    label: 'Traffic Source - Is from Video Ad'
    type: yesno
    sql: ${TABLE}.trafficsource_adwordsclickinfo_isvideoad

  - dimension: trafficsource_adwordsclickinfo_page
    label: 'Traffic Source - Page Info'
    type: number
    sql: ${TABLE}.trafficsource_adwordsclickinfo_page

  - dimension: trafficsource_adwordsclickinfo_slot
    label: 'Traffic Source - Slot Info'
    type: string
    sql: ${TABLE}.trafficsource_adwordsclickinfo_slot

  - dimension: trafficsource_adwordsclickinfo_targetingcriteria_boomuserlistid
    hidden: TRUE
    type: number
    value_format_name: id
    sql: ${TABLE}.trafficsource_adwordsclickinfo_targetingcriteria_boomuserlistid

  - dimension: trafficsource_campaign
    label: 'Traffic Source - Campaign Name'
    type: string
    sql: ${TABLE}.trafficsource_campaign

  - dimension: trafficsource_campaigncode
    label: 'Traffic Source - Campaign Code'
    type: string
    sql: ${TABLE}.trafficsource_campaigncode

  - dimension: trafficsource_keyword
    label: 'Traffic Source - Keyword Used'
    type: string
    sql: ${TABLE}.trafficsource_keyword

  - dimension: trafficsource_medium
    label: 'Traffic Source - Medium'
    type: string
    sql: ${TABLE}.trafficsource_medium

  - dimension: trafficsource_referralpath
    label: 'Traffic Source - Referral Path'
    type: string
    sql: ${TABLE}.trafficsource_referralpath

  - dimension: trafficsource_source
    label: 'Traffic Source - Source Site'
    type: string
    sql: ${TABLE}.trafficsource_source

  - dimension: visitid
    label: 'Visitor ID'
    type: number
    value_format_name: id
    sql: ${TABLE}.visitid

  - measure: visitnumber
    label: 'Number of Visits'
    type: sum
    sql: ${TABLE}.visitnumber

  - dimension_group: visitstarttime
    label: 'Visit Start Time'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.visitstarttime

