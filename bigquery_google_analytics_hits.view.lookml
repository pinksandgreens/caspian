- view: bigquery_google_analytics_hits
  sql_table_name: publications.bigquery_google_analytics_hits
  fields:

  - dimension: fullvisitorid
    hidden: TRUE
    type: string
    primary_key: TRUE
    sql: ${TABLE}.fullvisitorid

  - dimension: hits_appinfo_appid
    label: 'App - App ID'
    type: string
    sql: ${TABLE}.hits_appinfo_appid

  - dimension: hits_appinfo_appinstallerid
    label: 'App - Installer ID'
    type: string
    sql: ${TABLE}.hits_appinfo_appinstallerid

  - dimension: hits_appinfo_appname
    label: 'App - App Name'
    type: string
    sql: ${TABLE}.hits_appinfo_appname

  - dimension: hits_appinfo_appversion
    hidden: TRUE
    type: string
    sql: ${TABLE}.hits_appinfo_appversion

  - dimension: hits_appinfo_exitscreenname
    label: 'App - Exit Screen name'
    type: string
    sql: ${TABLE}.hits_appinfo_exitscreenname

  - dimension: hits_appinfo_id
    label: 'App - Appinfo Id'
    type: string
    sql: ${TABLE}.hits_appinfo_id

  - dimension: hits_appinfo_installerid
    hidden: TRUE
    type: string
    sql: ${TABLE}.hits_appinfo_installerid

  - dimension: hits_appinfo_landingscreenname
    label: 'App - Landing screen name'
    type: string
    sql: ${TABLE}.hits_appinfo_landingscreenname

  - dimension: hits_appinfo_name
    label: 'App - App info name'
    type: string
    sql: ${TABLE}.hits_appinfo_name

  - dimension: hits_appinfo_screendepth
    hidden: TRUE
    type: string
    sql: ${TABLE}.hits_appinfo_screendepth

  - dimension: hits_appinfo_screenname
    label: 'App - Screen name'
    type: string
    sql: ${TABLE}.hits_appinfo_screenname

  - dimension: hits_appinfo_version
    label: 'App - App version'
    type: string
    sql: ${TABLE}.hits_appinfo_version

  - dimension: hits_contentinfo_contentdescription
    label: 'App - Content description'
    type: string
    sql: ${TABLE}.hits_contentinfo_contentdescription

  - dimension: hits_ecommerceaction_action_type
    label: 'Ecommerce - Action Type'
    type: string
    sql: ${TABLE}.hits_ecommerceaction_action_type

  - dimension: hits_ecommerceaction_option
    label: 'Ecommerce - Action Option'
    type: string
    sql: ${TABLE}.hits_ecommerceaction_option

  - dimension: hits_ecommerceaction_step
    label: 'Ecommerce - Action Step'
    type: number
    sql: ${TABLE}.hits_ecommerceaction_step

  - dimension: hits_eventinfo_eventaction
    label: 'Events - Event action'
    type: string
    sql: ${TABLE}.hits_eventinfo_eventaction

  - dimension: hits_eventinfo_eventcategory
    label: 'Events - Event category'
    type: string
    sql: ${TABLE}.hits_eventinfo_eventcategory

  - dimension: hits_eventinfo_eventlabel
    label: 'Events - Event label'
    type: string
    sql: ${TABLE}.hits_eventinfo_eventlabel

  - measure: hits_eventinfo_eventvalue
    label: 'Events - Event Value'
    type: sum
    sql: ${TABLE}.hits_eventinfo_eventvalue

  - dimension: hits_exceptioninfo_description
    label: 'Exception - Description'
    type: string
    sql: ${TABLE}.hits_exceptioninfo_description

  - measure: hits_exceptioninfo_exceptions
    hidden: TRUE
    label: 'Exception - Exceptions'
    type: sum
    sql: ${TABLE}.hits_exceptioninfo_exceptions

  - measure: hits_exceptioninfo_fatalexceptions
    hidden: TRUE
    label: 'Exception - Fatal Exceptions'
    type: sum
    sql: ${TABLE}.hits_exceptioninfo_fatalexceptions

  - dimension: hits_exceptioninfo_isfatal
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.hits_exceptioninfo_isfatal

  - measure: hits_hitnumber
    label: 'Hits - Hit Number'
    type: sum
    sql: ${TABLE}.hits_hitnumber

  - dimension: hits_hour
    label: 'Hits - Hour of Hit'
    type: number
    sql: ${TABLE}.hits_hour

  - dimension: hits_isentrance
    label: 'Hits - Is an entrance hit'
    type: yesno
    sql: ${TABLE}.hits_isentrance

  - dimension: hits_isexit
    label: 'Hits - Is an exit hit'
    type: yesno
    sql: ${TABLE}.hits_isexit

  - dimension: hits_isinteraction
    label: 'Hits - is interaction'
    type: yesno
    sql: ${TABLE}.hits_isinteraction

  - dimension: hits_issecure
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.hits_issecure

  - dimension: hits_item_currencycode
    label: 'Ecommerce - Currency Code'
    type: string
    sql: ${TABLE}.hits_item_currencycode

  - dimension: hits_item_itemquantity
    label: 'Ecommerce - Item Quantity'
    type: number
    sql: ${TABLE}.hits_item_itemquantity

  - measure: hits_item_itemrevenue
    label: 'Ecommerce - Item Revenue'
    type: sum
    sql: ${TABLE}.hits_item_itemrevenue

  - measure: hits_item_localitemrevenue
    label: 'Ecommerce - Local Item Revenue'
    type: sum
    sql: ${TABLE}.hits_item_localitemrevenue

  - dimension: hits_item_productcategory
    label: 'Ecommerce - Product Category'
    type: string
    sql: ${TABLE}.hits_item_productcategory

  - dimension: hits_item_productname
    label: 'Ecommerce - Product Name'
    type: string
    sql: ${TABLE}.hits_item_productname

  - dimension: hits_item_productsku
    label: 'Ecommerce - Product SKU'
    type: string
    sql: ${TABLE}.hits_item_productsku

  - dimension: hits_item_transactionid
    label: 'Ecommerce - Transaction ID'
    type: string
    sql: ${TABLE}.hits_item_transactionid

  - dimension: hits_latencytracking_domainlookuptime
    hidden: TRUE
    type: number
    sql: ${TABLE}.hits_latencytracking_domainlookuptime

  - dimension: hits_latencytracking_domcontentloadedtime
    hidden: TRUE
    type: number
    sql: ${TABLE}.hits_latencytracking_domcontentloadedtime

  - dimension: hits_latencytracking_dominteractivetime
    hidden: TRUE
    type: number
    sql: ${TABLE}.hits_latencytracking_dominteractivetime

  - dimension: hits_latencytracking_domlatencymetricssample
    hidden: TRUE
    type: number
    sql: ${TABLE}.hits_latencytracking_domlatencymetricssample

  - dimension: hits_latencytracking_pagedownloadtime
    hidden: TRUE
    type: number
    sql: ${TABLE}.hits_latencytracking_pagedownloadtime

  - dimension: hits_latencytracking_pageloadsample
    hidden: TRUE
    type: number
    sql: ${TABLE}.hits_latencytracking_pageloadsample

  - dimension: hits_latencytracking_pageloadtime
    hidden: TRUE
    type: number
    sql: ${TABLE}.hits_latencytracking_pageloadtime

  - dimension: hits_latencytracking_redirectiontime
    hidden: TRUE
    type: number
    sql: ${TABLE}.hits_latencytracking_redirectiontime

  - dimension: hits_latencytracking_serverconnectiontime
    hidden: TRUE
    type: number
    sql: ${TABLE}.hits_latencytracking_serverconnectiontime

  - dimension: hits_latencytracking_serverresponsetime
    hidden: TRUE
    type: number
    sql: ${TABLE}.hits_latencytracking_serverresponsetime

  - dimension: hits_latencytracking_speedmetricssample
    hidden: TRUE
    type: number
    sql: ${TABLE}.hits_latencytracking_speedmetricssample

  - dimension: hits_latencytracking_usertimingcategory
    hidden: TRUE
    type: string
    sql: ${TABLE}.hits_latencytracking_usertimingcategory

  - dimension: hits_latencytracking_usertiminglabel
    hidden: TRUE
    type: string
    sql: ${TABLE}.hits_latencytracking_usertiminglabel

  - dimension: hits_latencytracking_usertimingsample
    hidden: TRUE
    type: number
    sql: ${TABLE}.hits_latencytracking_usertimingsample

  - dimension: hits_latencytracking_usertimingvalue
    hidden: TRUE
    type: number
    sql: ${TABLE}.hits_latencytracking_usertimingvalue

  - dimension: hits_latencytracking_usertimingvariable
    hidden: TRUE
    type: string
    sql: ${TABLE}.hits_latencytracking_usertimingvariable

  - dimension: hits_minute
    label: 'Hits - Hit Minute'
    type: number
    sql: ${TABLE}.hits_minute

  - dimension: hits_page_hostname
    label: 'Hits - Page Hostname'
    type: string
    sql: ${TABLE}.hits_page_hostname

  - dimension: hits_page_pagepath
    label: 'Hits - Page path'
    type: string
    sql: ${TABLE}.hits_page_pagepath

  - dimension: hits_page_pagepathlevel1
    label: 'Hits - Page path Lv1'
    type: string
    sql: ${TABLE}.hits_page_pagepathlevel1

  - dimension: hits_page_pagepathlevel2
    label: 'Hits - Page path Lv2'
    type: string
    sql: ${TABLE}.hits_page_pagepathlevel2

  - dimension: hits_page_pagepathlevel3
    label: 'Hits - Page path Lv3'
    type: string
    sql: ${TABLE}.hits_page_pagepathlevel3

  - dimension: hits_page_pagepathlevel4
    label: 'Hits - Page path Lv4'
    type: string
    sql: ${TABLE}.hits_page_pagepathlevel4

  - dimension: hits_page_pagetitle
    label: 'Hits - Page Title'
    type: string
    sql: ${TABLE}.hits_page_pagetitle

  - dimension: hits_page_searchcategory
    label: 'Search - Search Category'
    type: string
    sql: ${TABLE}.hits_page_searchcategory

  - dimension: hits_page_searchkeyword
    label: 'Search - Search Keyword'
    type: string
    sql: ${TABLE}.hits_page_searchkeyword

  - measure: hits_publisher_adsensebackfilldfpclicks
    hidden: TRUE
    label: 'DFP - Backfill Clicks'
    type: sum
    sql: ${TABLE}.hits_publisher_adsensebackfilldfpclicks

  - measure: hits_publisher_adsensebackfilldfpimpressions
    hidden: TRUE
    label: 'DFP - Backfill Impressions'
    type: sum
    sql: ${TABLE}.hits_publisher_adsensebackfilldfpimpressions

  - measure: hits_publisher_adsensebackfilldfpmatchedqueries
    hidden: TRUE
    label: 'DFP - Matched Queries'
    type: sum
    sql: ${TABLE}.hits_publisher_adsensebackfilldfpmatchedqueries

  - measure: hits_publisher_adsensebackfilldfpmeasurableimpressions
    hidden: TRUE
    label: 'DFP - Measureable Impressions'
    type: sum
    sql: ${TABLE}.hits_publisher_adsensebackfilldfpmeasurableimpressions

  - measure: hits_publisher_adsensebackfilldfppagesviewed
    hidden: TRUE
    label: 'DFP - Backfill Clicks'
    type: sum
    sql: ${TABLE}.hits_publisher_adsensebackfilldfppagesviewed

  - measure: hits_publisher_adsensebackfilldfpqueries
    hidden: TRUE
    type: sum
    sql: ${TABLE}.hits_publisher_adsensebackfilldfpqueries

  - measure: hits_publisher_adsensebackfilldfprevenuecpc
    hidden: TRUE
    type: sum
    sql: ${TABLE}.hits_publisher_adsensebackfilldfprevenuecpc

  - measure: hits_publisher_adsensebackfilldfprevenuecpm
    hidden: TRUE
    type: sum
    sql: ${TABLE}.hits_publisher_adsensebackfilldfprevenuecpm

  - measure: hits_publisher_adsensebackfilldfpviewableimpressions
    hidden: TRUE
    type: sum
    sql: ${TABLE}.hits_publisher_adsensebackfilldfpviewableimpressions

  - measure: hits_publisher_adxbackfilldfpclicks
    hidden: TRUE
    type: sum
    sql: ${TABLE}.hits_publisher_adxbackfilldfpclicks

  - measure: hits_publisher_adxbackfilldfpimpressions
    hidden: TRUE
    type: sum
    sql: ${TABLE}.hits_publisher_adxbackfilldfpimpressions

  - measure: hits_publisher_adxbackfilldfpmatchedqueries
    hidden: TRUE
    type: sum
    sql: ${TABLE}.hits_publisher_adxbackfilldfpmatchedqueries

  - measure: hits_publisher_adxbackfilldfpmeasurableimpressions
    hidden: TRUE
    type: sum
    sql: ${TABLE}.hits_publisher_adxbackfilldfpmeasurableimpressions

  - measure: hits_publisher_adxbackfilldfppagesviewed
    hidden: TRUE
    type: sum
    sql: ${TABLE}.hits_publisher_adxbackfilldfppagesviewed

  - measure: hits_publisher_adxbackfilldfpqueries
    hidden: TRUE
    type: sum
    sql: ${TABLE}.hits_publisher_adxbackfilldfpqueries

  - measure: hits_publisher_adxbackfilldfprevenuecpc
    hidden: TRUE
    type: sum
    sql: ${TABLE}.hits_publisher_adxbackfilldfprevenuecpc

  - measure: hits_publisher_adxbackfilldfprevenuecpm
    hidden: TRUE
    type: sum
    sql: ${TABLE}.hits_publisher_adxbackfilldfprevenuecpm

  - measure: hits_publisher_adxbackfilldfpviewableimpressions
    hidden: TRUE
    type: sum
    sql: ${TABLE}.hits_publisher_adxbackfilldfpviewableimpressions

  - dimension: hits_publisher_dfpadgroup
    label: 'DFP - Adgroup ID'
    type: string
    sql: ${TABLE}.hits_publisher_dfpadgroup

  - dimension: hits_publisher_dfpadunits
    label: 'DFP - Adunit ID'
    type: string
    sql: ${TABLE}.hits_publisher_dfpadunits

  - measure: hits_publisher_dfpclicks
    label: 'DFP - Clicks'
    type: sum
    sql: ${TABLE}.hits_publisher_dfpclicks

  - measure: hits_publisher_dfpimpressions
    label: 'DFP - Impressions'
    type: sum
    sql: ${TABLE}.hits_publisher_dfpimpressions

  - measure: hits_publisher_dfpmatchedqueries
    label: 'DFP - Matched Queries'
    type: sum
    sql: ${TABLE}.hits_publisher_dfpmatchedqueries

  - measure: hits_publisher_dfpmeasurableimpressions
    label: 'DFP - Measureable Impressions'
    type: sum
    sql: ${TABLE}.hits_publisher_dfpmeasurableimpressions

  - dimension: hits_publisher_dfpnetworkid
    label: 'DFP - Adnetwork ID'
    type: string
    sql: ${TABLE}.hits_publisher_dfpnetworkid

  - measure: hits_publisher_dfppagesviewed
    label: 'DFP - Pages Viewed'
    type: sum
    sql: ${TABLE}.hits_publisher_dfppagesviewed

  - measure: hits_publisher_dfpqueries
    label: 'DFP - Queries'
    type: sum
    sql: ${TABLE}.hits_publisher_dfpqueries

  - measure: hits_publisher_dfprevenuecpc
    label: 'DFP - Revenue CPC'
    type: sum
    sql: ${TABLE}.hits_publisher_dfprevenuecpc

  - measure: hits_publisher_dfprevenuecpm
    label: 'DFP - Revenue CPM'
    type: sum
    sql: ${TABLE}.hits_publisher_dfprevenuecpm

  - measure: hits_publisher_dfpviewableimpressions
    label: 'DFP - Viewable Impressions'
    type: sum
    sql: ${TABLE}.hits_publisher_dfpviewableimpressions

  - dimension: hits_referer
    label: 'Hits - Referer'
    type: string
    sql: ${TABLE}.hits_referer

  - dimension: hits_refund_localrefundamount
    hidden: TRUE
    type: number
    sql: ${TABLE}.hits_refund_localrefundamount

  - dimension: hits_refund_refundamount
    hidden: TRUE
    type: number
    sql: ${TABLE}.hits_refund_refundamount

  - dimension: hits_social_hassocialsourcereferral
    label: 'Social - Has social referral'
    type: string
    sql: ${TABLE}.hits_social_hassocialsourcereferral

  - dimension: hits_social_socialinteractionaction
    label: 'Social - Interaction Action'
    type: string
    sql: ${TABLE}.hits_social_socialinteractionaction

  - dimension: hits_social_socialinteractionnetwork
    label: 'Social - Social Network Interaction'
    type: string
    sql: ${TABLE}.hits_social_socialinteractionnetwork

  - dimension: hits_social_socialinteractionnetworkaction
    label: 'Social - Network Action'
    type: string
    sql: ${TABLE}.hits_social_socialinteractionnetworkaction

  - measure: hits_social_socialinteractions
    label: 'Social - Number of Social Interactions'
    type: sum
    sql: ${TABLE}.hits_social_socialinteractions

  - dimension: hits_social_socialinteractiontarget
    label: 'Social - Interaction Target'
    type: string
    sql: ${TABLE}.hits_social_socialinteractiontarget

  - dimension: hits_social_socialnetwork
    label: 'Social - Social Network'
    type: string
    sql: ${TABLE}.hits_social_socialnetwork

  - dimension: hits_social_uniquesocialinteractions
    hidden: TRUE
    type: number
    sql: ${TABLE}.hits_social_uniquesocialinteractions

  - dimension: hits_sourcepropertyinfo_sourcepropertydisplayname
    hidden: TRUE
    type: string
    sql: ${TABLE}.hits_sourcepropertyinfo_sourcepropertydisplayname

  - dimension: hits_sourcepropertyinfo_sourcepropertytrackingid
    hidden: TRUE
    type: string
    sql: ${TABLE}.hits_sourcepropertyinfo_sourcepropertytrackingid

  - dimension: hits_time
    label: 'Hits - Hit Time'
    type: number
    sql: ${TABLE}.hits_time

  - dimension: hits_transaction_affiliation
    label: 'Transaction - Affiliation'
    type: string
    sql: ${TABLE}.hits_transaction_affiliation

  - dimension: hits_transaction_currencycode
    label: 'Transaction - Currency Code'
    type: string
    sql: ${TABLE}.hits_transaction_currencycode

  - measure: hits_transaction_localtransactionrevenue
    label: 'Transaction - Local Transaction Revenue'
    type: sum
    sql: ${TABLE}.hits_transaction_localtransactionrevenue

  - measure: hits_transaction_localtransactionshipping
    hidden: TRUE
    label: 'Transaction - Local Shipping Cost'
    type: sum
    sql: ${TABLE}.hits_transaction_localtransactionshipping

  - measure: hits_transaction_localtransactiontax
    hidden: TRUE
    label: 'Transaction - Local Tax'
    type: sum
    sql: ${TABLE}.hits_transaction_localtransactiontax

  - measure: hits_transaction_transactioncoupon
    label: 'Transaction - Coupon Used'
    type: sum
    sql: ${TABLE}.hits_transaction_transactioncoupon

  - dimension: hits_transaction_transactionid
    label: 'Transaction - Transaction ID'
    type: string
    sql: ${TABLE}.hits_transaction_transactionid

  - dimension: hits_transaction_transactionrevenue
    label: 'Transaction - Revenue'
    type: number
    sql: ${TABLE}.hits_transaction_transactionrevenue

  - dimension: hits_transaction_transactionshipping
    label: 'Transaction - Shipping Cost'
    type: number
    sql: ${TABLE}.hits_transaction_transactionshipping

  - dimension: hits_transaction_transactiontax
    label: 'Transaction - Tax'
    type: number
    sql: ${TABLE}.hits_transaction_transactiontax

  - dimension: hits_type
    label: 'Hits - Type'
    type: string
    sql: ${TABLE}.hits_type

  - dimension_group: import
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.import_date

  - dimension: visitid
    hidden: TRUE
    type: number
    value_format_name: id
    sql: ${TABLE}.visitid

  - measure: visitnumber
    label: 'Hits - Visit Number'
    type: sum
    sql: ${TABLE}.visitnumber


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - hits_sourcepropertyinfo_sourcepropertydisplayname
    - hits_page_hostname
    - hits_item_productname
    - hits_appinfo_name
    - hits_appinfo_appname
    - hits_appinfo_screenname
    - hits_appinfo_landingscreenname
    - hits_appinfo_exitscreenname

