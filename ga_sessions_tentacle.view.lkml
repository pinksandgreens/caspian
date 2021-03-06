#lifestyle
view: ga_sessions_tentacle {
  sql_table_name: ( SELECT * FROM {% table_date_range date_filter 114668488.ga_sessions_ %},
                  {% table_date_range intraday_date_filter 114668488.ga_sessions_intraday_ %},
                  {% table_date_range date_filter 21699534.ga_sessions_ %},
                  {% table_date_range intraday_date_filter 21699534.ga_sessions_intraday_ %},
                  {% table_date_range date_filter 82149182.ga_sessions_ %},
                  {% table_date_range intraday_date_filter 82149182.ga_sessions_intraday_ %},
                  {% table_date_range date_filter 8896222.ga_sessions_ %},
                  {% table_date_range intraday_date_filter 8896222.ga_sessions_intraday_ %},
                  {% table_date_range date_filter 46993019.ga_sessions_ %},
                  {% table_date_range intraday_date_filter 46993019.ga_sessions_intraday_ %});;



#   sql_table_name: ( SELECT * FROM (TABLE_DATE_RANGE(["{% parameter table_id %}".ga_sessions_],TIMESTAMP(DATE_ADD(TIMESTAMP(CONCAT(CURRENT_DATE(), ' 00:00:00')), -60, 'DAY')),TIMESTAMP(DATE_ADD(DATE_ADD(DATE_ADD(TIMESTAMP(CONCAT(CURRENT_DATE(), ' 00:00:00')), -60, 'DAY'), 61, 'DAY'),-1, 'SECOND')))),
#   (TABLE_DATE_RANGE(["{% parameter table_id %}".ga_sessions_intraday_],TIMESTAMP(DATE_ADD(TIMESTAMP(CONCAT(CURRENT_DATE(), ' 00:00:00')), -60, 'DAY')),TIMESTAMP(DATE_ADD(DATE_ADD(DATE_ADD(TIMESTAMP(CONCAT(CURRENT_DATE(), ' 00:00:00')), -60, 'DAY'), 61, 'DAY'),-1, 'SECOND')))));;


# {% parameter table_id %}
# 'REGEXP_MATCH(table_id, r"{% parameter brand %}")'

# Lifestyle.one 114668488
# Planet Radio  127467161
# Empire  21699534
# MCN 22661559 - REMOVED
# Parkers 24089672 - REMOVED
# The Debrief 82149182
# Mother & Baby 8896222
# CAR 24931796 - REMOVED
# Today's Golfer  46993019
# Classic Cars for Sale 53155378 - REMOVED

                  # {% table_date_range date_filter 24089672.ga_sessions_ %},
                  # {% table_date_range date_filter 24089672.ga_sessions_intraday_ %},

#      dimension: table_id
#       {
#         type: string
#         sql: CASE
#                 WHEN {% parameter table %} = 'Absolute Radio' THEN 127467161
#                 WHEN {% parameter table %} = 'Aire' THEN 127467161
#                 WHEN {% parameter table %} = 'Borders' THEN 127467161
#                 WHEN {% parameter table %} = 'Car Magazine' THEN 24931796
#                 WHEN {% parameter table %} = 'CFM' THEN 127467161
#                 WHEN {% parameter table %} = 'City' THEN 127467161
#                 WHEN {% parameter table %} = 'Classic Cars for Sale' THEN 53155378
#                 WHEN {% parameter table %} = 'Closer' THEN 114668488
#                 WHEN {% parameter table %} = 'Clyde' THEN 127467161
#                 WHEN {% parameter table %} = 'Cool FM' THEN 127467161
#                 WHEN {% parameter table %} = 'Downtown' THEN 127467161
#                 WHEN {% parameter table %} = 'Empire' THEN 21699534
#                 WHEN {% parameter table %} = 'Forth' THEN 127467161
#                 WHEN {% parameter table %} = 'Free' THEN 127467161
#                 WHEN {% parameter table %} = 'Gem' THEN 127467161
#                 WHEN {% parameter table %} = 'Grazia' THEN 114668488
#                 WHEN {% parameter table %} = 'Hallam' THEN 127467161
#                 WHEN {% parameter table %} = 'Heat' THEN 114668488
#                 WHEN {% parameter table %} = 'Heat Radio' THEN 127467161
#                 WHEN {% parameter table %} = 'Kerrang' THEN 127467161
#                 WHEN {% parameter table %} = 'Key' THEN 127467161
#                 WHEN {% parameter table %} = 'Kiss' THEN 127467161
#                 WHEN {% parameter table %} = 'Magic' THEN 127467161
#                 WHEN {% parameter table %} = 'Metro' THEN 127467161
#                 WHEN {% parameter table %} = 'MFR' THEN 127467161
#                 WHEN {% parameter table %} = 'Mother & Baby' THEN 8896222
#                 WHEN {% parameter table %} = 'Motorcyclenews' THEN 22661559
#                 WHEN {% parameter table %} = 'Northsound' THEN 127467161
#                 WHEN {% parameter table %} = 'Parkers' THEN 24089672
#                 WHEN {% parameter table %} = 'Planet Radio' THEN 127467161
#                 WHEN {% parameter table %} = 'Planet Rock' THEN 127467161
#                 WHEN {% parameter table %} = 'Rock FM' THEN 127467161
#                 WHEN {% parameter table %} = 'Tay FM' THEN 127467161
#                 WHEN {% parameter table %} = 'TFM' THEN 127467161
#                 WHEN {% parameter table %} = 'The Debrief' THEN 82149182
#                 WHEN {% parameter table %} = 'The Hits' THEN 127467161
#                 WHEN {% parameter table %} = 'Todays Golfer' THEN 46993019
#                 WHEN {% parameter table %} = 'Unknown' THEN 127467161
#                 WHEN {% parameter table %} = 'Viking' THEN 127467161
#                 WHEN {% parameter table %} = 'Wave' THEN 127467161
#                 WHEN {% parameter table %} = 'West FM' THEN 127467161
#                 WHEN {% parameter table %} = 'Westsound' THEN 127467161
#                 WHEN {% parameter table %} = 'Parkers' THEN 24089672
#                 ELSE 0
#               END;;
#       }
#
#     filter: table {
#       suggestions: ["Absolute Radio","Aire","Borders","Car Magazine","CFM","City","Classic Cars for Sale","Closer","Clyde","Cool FM","Downtown","Empire","Forth","Free","Gem","Grazia","Hallam","Heat","Heat Radio","Kerrang","Key","Kiss","Magic","Metro","MFR","Mother & Baby","Motorcyclenews","Northsound","Parkers","Planet Radio","Planet Rock","Rock FM","Tay FM","TFM","The Debrief","The Hits","Todays Golfer","Unknown","Viking","Wave","West FM","Westsound","Parkers"]
#       type: string
#     }


    filter: date_filter {
      type: date
    }

  filter: intraday_date_filter {
    type: date
  }

    # TABLE_DATE_RANGE([uplifted-light-89310:114668488.ga_sessions_],DATE_ADD(CURRENT_TIMESTAMP(), -1, 'YEAR'),CURRENT_TIMESTAMP())

    # - dimension: unique_key
    #   type: string
    #   sql: ${TABLE}.fullVisitorId || ${TABLE}.visitId

    dimension: channel_grouping {
      type: string
      sql: ${TABLE}.channelGrouping ;;
    }

    #${TABLE}.visitnumber || ${TABLE}.date ||

    dimension: custom_dimensions__index {
      type: number
      sql: ${TABLE}.customDimensions.index ;;
      fanout_on: "customDimensions"
    }

    dimension: custom_dimensions__value {
      type: string
      sql: ${TABLE}.customDimensions.value ;;
      fanout_on: "customDimensions"
    }

    dimension: device__browser {
      type: string
      sql: ${TABLE}.device.browser ;;
    }

    dimension: device__browser_size {
      type: string
      sql: ${TABLE}.device.browserSize ;;
    }

    dimension: device__browser_version {
      type: string
      sql: ${TABLE}.device.browserVersion ;;
    }

    dimension: device__device_category {
      type: string
      sql: ${TABLE}.device.deviceCategory ;;
    }

    dimension: device__flash_version {
      type: string
      sql: ${TABLE}.device.flashVersion ;;
    }

    dimension: device__is_mobile {
      type: yesno
      sql: ${TABLE}.device.isMobile ;;
    }

    dimension: device__java_enabled {
      type: yesno
      sql: ${TABLE}.device.javaEnabled ;;
    }

    dimension: device__language {
      type: string
      sql: ${TABLE}.device.language ;;
    }

    dimension: device__mobile_device_branding {
      type: string
      sql: ${TABLE}.device.mobileDeviceBranding ;;
    }

    dimension: device__mobile_device_info {
      type: string
      sql: ${TABLE}.device.mobileDeviceInfo ;;
    }

    dimension: device__mobile_device_marketing_name {
      type: string
      sql: ${TABLE}.device.mobileDeviceMarketingName ;;
    }

    dimension: device__mobile_device_model {
      type: string
      sql: ${TABLE}.device.mobileDeviceModel ;;
    }

    dimension: device__mobile_input_selector {
      type: string
      sql: ${TABLE}.device.mobileInputSelector ;;
    }

    dimension: device__operating_system {
      type: string
      sql: ${TABLE}.device.operatingSystem ;;
    }

    dimension: device__operating_system_version {
      type: string
      sql: ${TABLE}.device.operatingSystemVersion ;;
    }

    dimension: device__screen_colors {
      type: string
      sql: ${TABLE}.device.screenColors ;;
    }

    dimension: device__screen_resolution {
      type: string
      sql: ${TABLE}.device.screenResolution ;;
    }

    dimension: full_visitor_id {
      primary_key: yes
      type: string
      sql: ${TABLE}.fullVisitorId ;;
    }

    dimension: geo_network__city {
      type: string
      sql: ${TABLE}.geoNetwork.city ;;
    }

    dimension: geo_network__city_id {
      type: string
      sql: ${TABLE}.geoNetwork.cityId ;;
    }

    dimension: geo_network__continent {
      type: string
      sql: ${TABLE}.geoNetwork.continent ;;
    }

    dimension: geo_network__country {
      type: string
      sql: ${TABLE}.geoNetwork.country ;;
    }

    dimension: geo_network__latitude {
      type: string
      sql: CAST(${TABLE}.geoNetwork.latitude AS FLOAT64) ;;
    }

    dimension: geo_network__longitude {
      type: string
      sql: CAST(${TABLE}.geoNetwork.longitude AS FLOAT64) ;;
    }

    dimension: location {
      label: "Latitude/Longitude Location"
      type: location
      sql_latitude: ROUND(CAST(${TABLE}.geoNetwork.latitude AS FLOAT), 4) ;;
      sql_longitude: ROUND(CAST(${TABLE}.geoNetwork.longitude AS FLOAT), 4) ;;
    }

    dimension: geo_network__metro {
      type: string
      sql: ${TABLE}.geoNetwork.metro ;;
    }

    dimension: geo_network__network_domain {
      type: string
      sql: ${TABLE}.geoNetwork.networkDomain ;;
    }

    dimension: geo_network__network_location {
      type: string
      sql: ${TABLE}.geoNetwork.networkLocation ;;
    }

    dimension: geo_network__region {
      type: string
      sql: ${TABLE}.geoNetwork.region ;;
    }

    dimension: geo_network__sub_continent {
      type: string
      sql: ${TABLE}.geoNetwork.subContinent ;;
    }

    dimension: hits__app_info__app_id {
      type: string
      sql: ${TABLE}.hits.appInfo.appId ;;
      fanout_on: "hits"
    }

    dimension: hits__app_info__app_installer_id {
      type: string
      sql: ${TABLE}.hits.appInfo.appInstallerId ;;
      fanout_on: "hits"
    }

    dimension: hits__app_info__app_name {
      type: string
      sql: ${TABLE}.hits.appInfo.appName ;;
      fanout_on: "hits"
    }

    dimension: hits__app_info__app_version {
      type: string
      sql: ${TABLE}.hits.appInfo.appVersion ;;
      fanout_on: "hits"
    }

    dimension: hits__app_info__exit_screen_name {
      type: string
      sql: ${TABLE}.hits.appInfo.exitScreenName ;;
      fanout_on: "hits"
    }

    dimension: hits__app_info__id {
      type: string
      sql: ${TABLE}.hits.appInfo.id ;;
      fanout_on: "hits"
    }

    dimension: hits__app_info__installer_id {
      type: string
      sql: ${TABLE}.hits.appInfo.installerId ;;
      fanout_on: "hits"
    }

    dimension: hits__app_info__landing_screen_name {
      type: string
      sql: ${TABLE}.hits.appInfo.landingScreenName ;;
      fanout_on: "hits"
    }

    dimension: hits__app_info__name {
      type: string
      sql: ${TABLE}.hits.appInfo.name ;;
      fanout_on: "hits"
    }

    dimension: hits__app_info__screen_depth {
      type: string
      sql: ${TABLE}.hits.appInfo.screenDepth ;;
      fanout_on: "hits"
    }

    dimension: hits__app_info__screen_name {
      type: string
      sql: ${TABLE}.hits.appInfo.screenName ;;
      fanout_on: "hits"
    }

    dimension: hits__app_info__version {
      type: string
      sql: ${TABLE}.hits.appInfo.version ;;
      fanout_on: "hits"
    }

    dimension: hits__content_info__content_description {
      type: string
      sql: ${TABLE}.hits.contentInfo.contentDescription ;;
      fanout_on: "hits"
    }

    dimension: hits__custom_dimensions__index {
      type: number
      sql: ${TABLE}.hits.customDimensions.index ;;
      fanout_on: "hits.customDimensions"
    }

    dimension: hits__custom_dimensions__value {
      type: string
      sql: ${TABLE}.hits.customDimensions.value ;;
      fanout_on: "hits.customDimensions"
    }

    dimension: hits__custom_metrics__index {
      type: number
      sql: ${TABLE}.hits.customMetrics.index ;;
      fanout_on: "hits.customMetrics"
    }

    dimension: hits__custom_metrics__value {
      type: number
      sql: ${TABLE}.hits.customMetrics.value ;;
      fanout_on: "hits.customMetrics"
    }

    dimension: hits__custom_variables__custom_var_name {
      type: string
      sql: ${TABLE}.hits.customVariables.customVarName ;;
      fanout_on: "hits.customVariables"
    }

    dimension: hits__custom_variables__custom_var_value {
      type: string
      sql: ${TABLE}.hits.customVariables.customVarValue ;;
      fanout_on: "hits.customVariables"
    }

    dimension: hits__custom_variables__index {
      type: number
      sql: ${TABLE}.hits.customVariables.index ;;
      fanout_on: "hits.customVariables"
    }

    dimension: hits__e_commerce_action__action_type {
      type: string
      sql: ${TABLE}.hits.eCommerceAction.action_type ;;
      fanout_on: "hits"
    }

    dimension: hits__e_commerce_action__option {
      type: string
      sql: ${TABLE}.hits.eCommerceAction.option ;;
      fanout_on: "hits"
    }

    dimension: hits__e_commerce_action__step {
      type: number
      sql: ${TABLE}.hits.eCommerceAction.step ;;
      fanout_on: "hits"
    }

    dimension: hits__event_info__event_action {
      type: string
      sql: ${TABLE}.hits.eventInfo.eventAction ;;
      fanout_on: "hits"
    }

    dimension: hits__event_info__event_category {
      type: string
      sql: ${TABLE}.hits.eventInfo.eventCategory ;;
      fanout_on: "hits"
    }

    dimension: hits__event_info__event_label {
      type: string
      sql: ${TABLE}.hits.eventInfo.eventLabel ;;
      fanout_on: "hits"
    }

    dimension: hits__event_info__event_value {
      type: number
      sql: ${TABLE}.hits.eventInfo.eventValue ;;
      fanout_on: "hits"
    }

    dimension: hits__exception_info__description {
      type: string
      sql: ${TABLE}.hits.exceptionInfo.description ;;
      fanout_on: "hits"
    }

    dimension: hits__exception_info__exceptions {
      type: number
      sql: ${TABLE}.hits.exceptionInfo.exceptions ;;
      fanout_on: "hits"
    }

    dimension: hits__exception_info__fatal_exceptions {
      type: number
      sql: ${TABLE}.hits.exceptionInfo.fatalExceptions ;;
      fanout_on: "hits"
    }

    dimension: hits__exception_info__is_fatal {
      type: yesno
      sql: ${TABLE}.hits.exceptionInfo.isFatal ;;
      fanout_on: "hits"
    }

    dimension: hits__experiment__experiment_id {
      type: string
      sql: ${TABLE}.hits.experiment.experimentId ;;
      fanout_on: "hits.experiment"
    }

    dimension: hits__experiment__experiment_variant {
      type: string
      sql: ${TABLE}.hits.experiment.experimentVariant ;;
      fanout_on: "hits.experiment"
    }

    dimension: hits__hit_number {
      type: number
      sql: ${TABLE}.hits.hitNumber ;;
      fanout_on: "hits"
    }

    dimension: hits__hour {
      type: number
      sql: ${TABLE}.hits.hour ;;
      fanout_on: "hits"
    }

    dimension: hits__is_entrance {
      type: yesno
      sql: ${TABLE}.hits.isEntrance ;;
      fanout_on: "hits"
    }

    dimension: hits__is_exit {
      type: yesno
      sql: ${TABLE}.hits.isExit ;;
      fanout_on: "hits"
    }

    dimension: hits__is_interaction {
      type: yesno
      sql: ${TABLE}.hits.isInteraction ;;
      fanout_on: "hits"
    }

    dimension: hits__is_secure {
      type: yesno
      sql: ${TABLE}.hits.isSecure ;;
      fanout_on: "hits"
    }

    dimension: hits__item__currency_code {
      type: string
      sql: ${TABLE}.hits.item.currencyCode ;;
      fanout_on: "hits"
    }

    dimension: hits__item__item_quantity {
      type: number
      value_format: "$0.00"
      sql: ${TABLE}.hits.item.itemQuantity ;;
      fanout_on: "hits"
    }

    dimension: hits__item__item_revenue {
      type: number
      value_format: "$0.00"
      sql: ${TABLE}.hits.item.itemRevenue/1000000 ;;
      fanout_on: "hits"
    }

    dimension: hits__item__local_item_revenue {
      type: number
      value_format: "$0.00"
      sql: ${TABLE}.hits.item.localItemRevenue/1000000 ;;
      fanout_on: "hits"
    }

    dimension: hits__item__product_category {
      type: string
      sql: ${TABLE}.hits.item.productCategory ;;
      fanout_on: "hits"
    }

    dimension: hits__item__product_name {
      type: string
      sql: ${TABLE}.hits.item.productName ;;
      fanout_on: "hits"
    }

    dimension: hits__item__product_sku {
      type: string
      sql: ${TABLE}.hits.item.productSku ;;
      fanout_on: "hits"
    }

    dimension: hits__item__transaction_id {
      type: string
      sql: ${TABLE}.hits.item.transactionId ;;
      fanout_on: "hits"
    }

    dimension: hits__latency_tracking__dom_content_loaded_time {
      type: number
      sql: ${TABLE}.hits.latencyTracking.domContentLoadedTime ;;
      fanout_on: "hits"
    }

    dimension: hits__latency_tracking__dom_interactive_time {
      type: number
      sql: ${TABLE}.hits.latencyTracking.domInteractiveTime ;;
      fanout_on: "hits"
    }

    dimension: hits__latency_tracking__dom_latency_metrics_sample {
      type: number
      sql: ${TABLE}.hits.latencyTracking.domLatencyMetricsSample ;;
      fanout_on: "hits"
    }

    dimension: hits__latency_tracking__domain_lookup_time {
      type: number
      sql: ${TABLE}.hits.latencyTracking.domainLookupTime ;;
      fanout_on: "hits"
    }

    dimension: hits__latency_tracking__page_download_time {
      type: number
      sql: ${TABLE}.hits.latencyTracking.pageDownloadTime ;;
      fanout_on: "hits"
    }

    dimension: hits__latency_tracking__page_load_sample {
      type: number
      sql: ${TABLE}.hits.latencyTracking.pageLoadSample ;;
      fanout_on: "hits"
    }

    dimension: hits__latency_tracking__page_load_time {
      type: number
      sql: ${TABLE}.hits.latencyTracking.pageLoadTime ;;
      fanout_on: "hits"
    }

    dimension: hits__latency_tracking__redirection_time {
      type: number
      sql: ${TABLE}.hits.latencyTracking.redirectionTime ;;
      fanout_on: "hits"
    }

    dimension: hits__latency_tracking__server_connection_time {
      type: number
      sql: ${TABLE}.hits.latencyTracking.serverConnectionTime ;;
      fanout_on: "hits"
    }

    dimension: hits__latency_tracking__server_response_time {
      type: number
      sql: ${TABLE}.hits.latencyTracking.serverResponseTime ;;
      fanout_on: "hits"
    }

    dimension: hits__latency_tracking__speed_metrics_sample {
      type: number
      sql: ${TABLE}.hits.latencyTracking.speedMetricsSample ;;
      fanout_on: "hits"
    }

    dimension: hits__latency_tracking__user_timing_category {
      type: string
      sql: ${TABLE}.hits.latencyTracking.userTimingCategory ;;
      fanout_on: "hits"
    }

    dimension: hits__latency_tracking__user_timing_label {
      type: string
      sql: ${TABLE}.hits.latencyTracking.userTimingLabel ;;
      fanout_on: "hits"
    }

    dimension: hits__latency_tracking__user_timing_sample {
      type: number
      sql: ${TABLE}.hits.latencyTracking.userTimingSample ;;
      fanout_on: "hits"
    }

    dimension: hits__latency_tracking__user_timing_value {
      type: number
      sql: ${TABLE}.hits.latencyTracking.userTimingValue ;;
      fanout_on: "hits"
    }

    dimension: hits__latency_tracking__user_timing_variable {
      type: string
      sql: ${TABLE}.hits.latencyTracking.userTimingVariable ;;
      fanout_on: "hits"
    }

    dimension: hits__minute {
      type: number
      sql: ${TABLE}.hits.minute ;;
      fanout_on: "hits"
    }

    dimension: hits__page__hostname {
      type: string
      sql: ${TABLE}.hits.page.hostname ;;
      fanout_on: "hits"
    }

  dimension: hits__page__hostname_without_pr {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN ${TABLE}.hits.page.hostname LIKE "%planetradio%" THEN ""
        WHEN ${TABLE}.hits.page.hostname LIKE "%radioplayer%" THEN ""
        ELSE ${TABLE}.hits.page.hostname
      END;;
    fanout_on: "hits"
  }

    dimension: hits__page__page_path {
      type: string
      sql: ${TABLE}.hits.page.pagePath ;;
      fanout_on: "hits"
    }

    dimension: link_field {
      label: "Link"
      hidden: yes
      type: string
      sql: CONCAT("http://",${hits__page__hostname_without_pr},${hits__page__page_path}) ;;
    }

    dimension: fav_ico {
      label: "Link"
      hidden: yes
      type: string
      sql: CONCAT("http://",${hits__page__hostname_without_pr},"/favicon.ico") ;;
    }

    dimension: hits__page__page_title {
      type: string
      sql: ${TABLE}.hits.page.pageTitle ;;
      fanout_on: "hits"

      link: {
        label: "Website"
        url: "{{ link_field._value }}"
        icon_url: "{{ fav_ico._value }}"
      }

      link: {
        label: "Google"
        url: "http://www.google.com/search?q={{ value }}"
        icon_url: "http://google.com/favicon.ico"
      }

    }

#   dimension: link {
#     label: "Link"
#     hidden: no
#     type: string
#     sql: CONCAT("http://",${hits__page__hostname},${hits__page__page_path}) ;;
#     html: <a href="{{ value }}" target="_new">
#         <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>
#         ;;
#   }

    dimension: hits__page__page_path_level1 {
      type: string
      sql: ${TABLE}.hits.page.pagePathLevel1 ;;
      fanout_on: "hits"
    }

    dimension: hits__page__page_path_level2 {
      type: string
      sql: ${TABLE}.hits.page.pagePathLevel2 ;;
      fanout_on: "hits"
    }

    dimension: hits__page__page_path_level3 {
      type: string
      sql: ${TABLE}.hits.page.pagePathLevel3 ;;
      fanout_on: "hits"
    }

    dimension: hits__page__page_path_level2_and_3 {
      type: string
      sql: CONCAT(${TABLE}.hits.page.pagePathLevel2,${TABLE}.hits.page.pagePathLevel3) ;;
      fanout_on: "hits"
    }

    dimension: hits__page__page_path_level4 {
      type: string
      sql: ${TABLE}.hits.page.pagePathLevel4 ;;
      fanout_on: "hits"
    }


    dimension: hits__page__search_category {
      type: string
      sql: ${TABLE}.hits.page.searchCategory ;;
      fanout_on: "hits"
    }

    dimension: hits__page__search_keyword {
      type: string
      sql: ${TABLE}.hits.page.searchKeyword ;;
      fanout_on: "hits"
    }

    dimension: hits__product__custom_dimensions__index {
      type: number
      sql: ${TABLE}.hits.product.customDimensions.index ;;
      fanout_on: "hits.product.customDimensions"
    }

    dimension: hits__product__custom_dimensions__value {
      type: string
      sql: ${TABLE}.hits.product.customDimensions.value ;;
      fanout_on: "hits.product.customDimensions"
    }

    dimension: hits__product__custom_metrics__index {
      type: number
      sql: ${TABLE}.hits.product.customMetrics.index ;;
      fanout_on: "hits.product.customMetrics"
    }

    dimension: hits__product__custom_metrics__value {
      type: number
      sql: ${TABLE}.hits.product.customMetrics.value ;;
      fanout_on: "hits.product.customMetrics"
    }

    dimension: hits__product__is_click {
      type: yesno
      sql: ${TABLE}.hits.product.isClick ;;
      fanout_on: "hits.product"
    }

    dimension: hits__product__is_impression {
      type: yesno
      sql: ${TABLE}.hits.product.isImpression ;;
      fanout_on: "hits.product"
    }

    dimension: hits__product__local_product_price {
      type: number
      sql: ${TABLE}.hits.product.localProductPrice ;;
      fanout_on: "hits.product"
    }

    dimension: hits__product__local_product_refund_amount {
      type: number
      sql: ${TABLE}.hits.product.localProductRefundAmount ;;
      fanout_on: "hits.product"
    }

    dimension: hits__product__local_product_revenue {
      type: number
      value_format: "$0.00"
      sql: ${TABLE}.hits.product.localProductRevenue/1000000 ;;
      fanout_on: "hits.product"
    }

    dimension: hits__product__product_brand {
      type: string
      sql: ${TABLE}.hits.product.productBrand ;;
      fanout_on: "hits.product"
    }

    dimension: hits__product__product_list_name {
      type: string
      sql: ${TABLE}.hits.product.productListName ;;
      fanout_on: "hits.product"
    }

    dimension: hits__product__product_list_position {
      type: number
      sql: ${TABLE}.hits.product.productListPosition ;;
      fanout_on: "hits.product"
    }

    dimension: hits__product__product_price {
      type: number
      sql: ${TABLE}.hits.product.productPrice ;;
      fanout_on: "hits.product"
    }

    dimension: hits__product__product_quantity {
      type: number
      sql: ${TABLE}.hits.product.productQuantity ;;
      fanout_on: "hits.product"
    }

    dimension: hits__product__product_refund_amount {
      type: number
      sql: ${TABLE}.hits.product.productRefundAmount ;;
      fanout_on: "hits.product"
    }

    dimension: hits__product__product_revenue {
      type: number
      value_format: "$0.00"
      sql: ${TABLE}.hits.product.productRevenue/1000000 ;;
      fanout_on: "hits.product"
    }

    dimension: hits__product__product_sku {
      type: string
      sql: ${TABLE}.hits.product.productSKU ;;
      fanout_on: "hits.product"
    }

    dimension: hits__product__product_variant {
      type: string
      sql: ${TABLE}.hits.product.productVariant ;;
      fanout_on: "hits.product"
    }

    dimension: hits__product__v2_product_category {
      type: string
      sql: ${TABLE}.hits.product.v2ProductCategory ;;
      fanout_on: "hits.product"
    }

    dimension: hits__product__v2_product_name {
      type: string
      sql: ${TABLE}.hits.product.v2ProductName ;;
      fanout_on: "hits.product"
    }

    dimension: hits__promotion__promo_creative {
      type: string
      sql: ${TABLE}.hits.promotion.promoCreative ;;
      fanout_on: "hits.promotion"
    }

    dimension: hits__promotion__promo_id {
      type: string
      sql: ${TABLE}.hits.promotion.promoId ;;
      fanout_on: "hits.promotion"
    }

    dimension: hits__promotion__promo_name {
      type: string
      sql: ${TABLE}.hits.promotion.promoName ;;
      fanout_on: "hits.promotion"
    }

    dimension: hits__promotion__promo_position {
      type: string
      sql: ${TABLE}.hits.promotion.promoPosition ;;
      fanout_on: "hits.promotion"
    }

    dimension: hits__promotion_action_info__promo_is_click {
      type: yesno
      sql: ${TABLE}.hits.promotionActionInfo.promoIsClick ;;
      fanout_on: "hits"
    }

    dimension: hits__promotion_action_info__promo_is_view {
      type: yesno
      sql: ${TABLE}.hits.promotionActionInfo.promoIsView ;;
      fanout_on: "hits"
    }



    ########################### AD THINGS ###############################



    measure: hits__publisher__adsense_backfill_dfp_clicks{
      label: "Ads Adsense Backfill DFP Clicks"
      type: sum
      sql: ${TABLE}.hits.publisher.adsenseBackfillDfpClicks;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adsense_backfill_dfp_impressions{
      label: "Ads Adsense Backfill DFP Impressions"
      type: sum
      sql: ${TABLE}.hits.publisher.adsenseBackfillDfpImpressions;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adsense_backfill_dfp_matched_queries{
      label: "Ads Adsense Backfill DFP Matched Queries"
      type: sum
      sql: ${TABLE}.hits.publisher.adsenseBackfillDfpMatchedQueries;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adsense_backfill_dfp_measurable_impressions{
      label: "Ads Adsense Backfill DFP Measurable Impressions"
      type: sum
      sql: ${TABLE}.hits.publisher.adsenseBackfillDfpMeasurableImpressions;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adsense_backfill_dfp_pages_viewed{
      label: "Ads Adsense Backfill DFP Pages Viewed"
      type: sum
      sql: ${TABLE}.hits.publisher.adsenseBackfillDfpPagesViewed;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adsense_backfill_dfp_queries{
      label: "Ads Adsense Backfill DFP Queries"
      type: sum
      sql: ${TABLE}.hits.publisher.adsenseBackfillDfpQueries;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adsense_backfill_dfp_revenue_cpc{
      label: "Ads Adsense Backfill DFP Revenue CPC"
      type: sum
      value_format: "$0.0000"
      sql: ${TABLE}.hits.publisher.adsenseBackfillDfpRevenueCpc/1000000;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adsense_backfill_dfp_revenue_cpm{
      label: "Ads Adsense Backfill DFP Revenue CPM"
      type: sum
      value_format: "$0.0000"
      sql: ${TABLE}.hits.publisher.adsenseBackfillDfpRevenueCpm/1000000;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adsense_backfill_dfp_viewable_impressions{
      label: "Ads Adsense Backfill DFP Viewable Impressions"
      type: sum
      sql: ${TABLE}.hits.publisher.adsenseBackfillDfpViewableImpressions;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adx_backfill_dfp_clicks{
      label: "Ads Adx Backfill DFP Clicks"
      type: sum
      sql: ${TABLE}.hits.publisher.adxBackfillDfpClicks;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adx_backfill_dfp_impressions{
      label: "Ads Adx Backfill DFP Impressions"
      type: sum
      sql: ${TABLE}.hits.publisher.adxBackfillDfpImpressions;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adx_backfill_dfp_matched_queries{
      label: "Ads Adx Backfill DFP Matched Queries"
      type: sum
      sql: ${TABLE}.hits.publisher.adxBackfillDfpMatchedQueries;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adx_backfill_dfp_measurable_impressions{
      label: "Ads Adx Backfill DFP Measurable Impressions"
      type: sum
      sql: ${TABLE}.hits.publisher.adxBackfillDfpMeasurableImpressions;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adx_backfill_dfp_pages_viewed{
      label: "Ads Adx Backfill DFP Pages Viewed"
      type: sum
      sql: ${TABLE}.hits.publisher.adxBackfillDfpPagesViewed;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adx_backfill_dfp_queries{
      label: "Ads Adx Backfill DFP Queries"
      type: sum
      sql: ${TABLE}.hits.publisher.adxBackfillDfpQueries;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adx_backfill_dfp_revenue_cpc{
      label: "Ads Backfill DFP Revenue CPC"
      type: sum
      value_format: "$0.0000"
      sql: ${TABLE}.hits.publisher.adxBackfillDfpRevenueCpc/1000000;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adx_backfill_dfp_revenue_cpm{
      label: "Ads Adx Backfill DFP Revenue CPM"
      type: sum
      value_format: "$0.0000"
      sql: ${TABLE}.hits.publisher.adxBackfillDfpRevenueCpm/1000000;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adx_backfill_dfp_viewable_impressions{
      label: "Ads Adx Backfill DFP Viewable Impressions"
      type: sum
      sql: ${TABLE}.hits.publisher.adxBackfillDfpViewableImpressions;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adx_clicks{
      label: "Ads Adx CLicks"
      type: sum
      sql: ${TABLE}.hits.publisher.adxClicks;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adx_impressions{
      label: "Ads Adx Impressions"
      type: sum
      sql: ${TABLE}.hits.publisher.adxImpressions;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adx_matched_queries{
      label: "Ads Adx Matched Queries"
      type: sum
      sql: ${TABLE}.hits.publisher.adxMatchedQueries;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adx_measurable_impressions{
      label: "Ads Adx Measurable Impressions"
      type: sum
      sql: ${TABLE}.hits.publisher.adxMeasurableImpressions;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adx_pages_viewed{
      label: "Ads Adx Pages Viewed"
      type: sum
      sql: ${TABLE}.hits.publisher.adxPagesViewed;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adx_queries{
      label: "Ads Adx Queries"
      type: sum
      sql: ${TABLE}.hits.publisher.adxQueries;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adx_revenue{
      label: "Ads Adx Revenue"
      type: sum
      value_format: "$0.0000"
      sql: ${TABLE}.hits.publisher.adxRevenue/1000000 ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__adx_viewable_impressions{
      label: "Ads Adx Viewable Impressions"
      type: sum
      sql: ${TABLE}.hits.publisher.adxViewableImpressions;;
      fanout_on: "hits"
    }


# I don't fully know

    measure: hits__publisher__ads_clicked{
      label: "Ads Clicked"
      type: sum
      sql: ${TABLE}.hits.publisher.adsClicked;;
    }

    measure: hits__publisher__ads_pages_viewed{
      label: "Ads Pages Viewed"
      type: sum
      sql: ${TABLE}.hits.publisher.adsPagesViewed;;
    }

    measure: hits__publisher__ads_revenue{
      label: "Ads Revenue"
      type: sum
      value_format: "$0.0000"
      sql: ${TABLE}.hits.publisher.adsRevenue/1000000;;
    }

    measure: hits__publisher__ads_units_matched{
      label: "Ads Units Matched"
      type: sum
      sql: ${TABLE}.hits.publisher.adsUnitsMatched;;
    }


    measure: hits__publisher__ads_units_viewed{
      label: "Ads Units Viewed"
      type: sum
      sql: ${TABLE}.hits.publisher.adsUnitsViewed;;
    }

    measure: hits__publisher__ads_viewed{
      label: "Ads Viewed"
      type: sum
      sql: ${TABLE}.hits.publisher.adsViewed;;
    }




    dimension: hits__publisher__dfp_ad_group {
      label: "Ads DFP Ad Group"
      type: string
      sql: ${TABLE}.hits.publisher.dfpAdGroup ;;
      fanout_on: "hits"
    }

    dimension: hits__publisher__dfp_ad_units {
      label: "Ads DFP Ad Unit"
      type: string
      sql: ${TABLE}.hits.publisher.dfpAdUnits ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__dfp_clicks {
      label: "Ads DFP Clicks"
      type: sum
      sql: ${TABLE}.hits.publisher.dfpClicks ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__dfp_impressions {
      label: "Ads DFP Impressions"
      type: sum
      sql: ${TABLE}.hits.publisher.dfpImpressions ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__dfp_matched_queries {
      label: "Ads DFP Matched Queries"
      type: sum
      sql: ${TABLE}.hits.publisher.dfpMatchedQueries ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__dfp_measurable_impressions {
      label: "Ads DFP Measurable Impressions"
      type: sum
      sql: ${TABLE}.hits.publisher.dfpMeasurableImpressions ;;
      fanout_on: "hits"
    }

    dimension: hits__publisher__dfp_network_id {
      label: "Ads DFP Network ID"
      type: string
      sql: ${TABLE}.hits.publisher.dfpNetworkId ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__dfp_pages_viewed {
      label: "DFP Pages Viewed"
      type: sum
      sql: ${TABLE}.hits.publisher.dfpPagesViewed ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__dfp_queries {
      label: "Ads DFP Queries"
      type: sum
      sql: ${TABLE}.hits.publisher.dfpQueries ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__dfp_revenue_cpc {
      label: "Ads DFP CPC"
      type: sum
      value_format: "$0.0000"
      sql: ${TABLE}.hits.publisher.dfpRevenueCpc/1000000 ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__dfp_revenue_cpm {
      label: "Ads DFP CPM"
      type: sum
      value_format: "$0.0000"
      sql: ${TABLE}.hits.publisher.dfpRevenueCpm/1000000 ;;
      fanout_on: "hits"
    }

    measure: dfp_revenue {
      label: "Ads DFP Revenue"
      description: "DFP CPC * DFP Clicks"
      type: sum
      value_format: "$0.0000"
      sql: ${TABLE}.hits.publisher.dfpRevenueCpc/1000000 ;;
    }

#      sql: (${TABLE}.hits.publisher.dfpRevenueCpc/1000000)*(${TABLE}.hits.publisher.dfpClicks) ;;

    measure: hits__publisher__dfp_viewable_impressions {
      label: "Ads DFP Viewable Impressions"
      type: sum
      sql: ${TABLE}.hits.publisher.dfpViewableImpressions ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__measurable_ads_viewed {
      label: "Ads DFP Measurable Ads Viewed"
      type: sum
      sql: ${TABLE}.hits.publisher.measurableAdsViewed ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__viewable_ads_viewed {
      label: "Ads DFP Viewable Ads Viewed"
      type: sum
      sql: ${TABLE}.hits.publisher.viewableAdsViewed ;;
      fanout_on: "hits"
    }



    ##########################################################





    dimension: hits__referer {
      type: string
      sql: ${TABLE}.hits.referer ;;
      fanout_on: "hits"
    }

    # - dimension: hits__refund__local_refund_amount
    #   type: number
    #   sql: ${TABLE}.hits.refund.localRefundAmount
    #   fanout_on: hits

    # - dimension: hits__refund__refund_amount
    #   type: number
    #   sql: ${TABLE}.hits.refund.refundAmount
    #   fanout_on: hits

    dimension: hits__social__has_social_source_referral {
      type: string
      sql: ${TABLE}.hits.social.hasSocialSourceReferral ;;
      fanout_on: "hits"
    }

    dimension: hits__social__social_interaction_action {
      type: string
      sql: ${TABLE}.hits.social.socialInteractionAction ;;
      fanout_on: "hits"
    }

    dimension: hits__social__social_interaction_network {
      type: string
      sql: ${TABLE}.hits.social.socialInteractionNetwork ;;
      fanout_on: "hits"
    }

    dimension: hits__social__social_interaction_network_action {
      type: string
      sql: ${TABLE}.hits.social.socialInteractionNetworkAction ;;
      fanout_on: "hits"
    }

    dimension: hits__social__social_interaction_target {
      type: string
      sql: ${TABLE}.hits.social.socialInteractionTarget ;;
      fanout_on: "hits"
    }

    dimension: hits__social__social_interactions {
      type: number
      sql: ${TABLE}.hits.social.socialInteractions ;;
      fanout_on: "hits"
    }

    dimension: hits__social__social_network {
      type: string
      sql: ${TABLE}.hits.social.socialNetwork ;;
      fanout_on: "hits"
    }

    dimension: hits__social__unique_social_interactions {
      type: number
      sql: ${TABLE}.hits.social.uniqueSocialInteractions ;;
      fanout_on: "hits"
    }

    dimension: hits__source_property_info__source_property_display_name {
      type: string
      sql: ${TABLE}.hits.sourcePropertyInfo.sourcePropertyDisplayName ;;
      fanout_on: "hits"
    }

    dimension: hits__source_property_info__source_property_tracking_id {
      type: string
      sql: ${TABLE}.hits.sourcePropertyInfo.sourcePropertyTrackingId ;;
      fanout_on: "hits"
    }

    dimension: hits__time {
      type: number
      sql: ${TABLE}.hits.time ;;
      fanout_on: "hits"
    }

    dimension: hits__transaction__affiliation {
      type: string
      sql: ${TABLE}.hits.transaction.affiliation ;;
      fanout_on: "hits"
    }

    dimension: hits__transaction__currency_code {
      type: string
      sql: ${TABLE}.hits.transaction.currencyCode ;;
      fanout_on: "hits"
    }

    dimension: hits__transaction__local_transaction_revenue {
      type: number
      value_format: "$0.00"
      sql: ${TABLE}.hits.transaction.localTransactionRevenue/1000000 ;;
      fanout_on: "hits"
    }

    dimension: hits__transaction__local_transaction_shipping {
      type: number
      sql: ${TABLE}.hits.transaction.localTransactionShipping ;;
      fanout_on: "hits"
    }

    dimension: hits__transaction__local_transaction_tax {
      type: number
      sql: ${TABLE}.hits.transaction.localTransactionTax ;;
      fanout_on: "hits"
    }

    dimension: hits__transaction__transaction_coupon {
      type: string
      sql: ${TABLE}.hits.transaction.transactionCoupon ;;
      fanout_on: "hits"
    }

    dimension: hits__transaction__transaction_id {
      type: string
      sql: ${TABLE}.hits.transaction.transactionId ;;
      fanout_on: "hits"
    }

    dimension: hits__transaction__transaction_revenue {
      type: number
      value_format: "$0.00"
      sql: ${TABLE}.hits.transaction.transactionRevenue/1000000 ;;
      fanout_on: "hits"
    }

    dimension: hits__transaction__transaction_shipping {
      type: number
      sql: ${TABLE}.hits.transaction.transactionShipping ;;
      fanout_on: "hits"
    }

    dimension: hits__transaction__transaction_tax {
      type: number
      sql: ${TABLE}.hits.transaction.transactionTax ;;
      fanout_on: "hits"
    }

    dimension: hits__type {
      type: string
      sql: ${TABLE}.hits.type ;;
      fanout_on: "hits"
    }

    dimension: social_engagement_type {
      type: string
      sql: ${TABLE}.socialEngagementType ;;
    }

    # - dimension: totals__bounces
    #   type: number
    #   sql: ${TABLE}.totals.bounces

    # - dimension: totals__hits
    #   type: number
    #   sql: ${TABLE}.totals.hits

    # - dimension: totals__new_visits
    #   type: number
    #   sql: ${TABLE}.totals.newVisits

    # - dimension: totals__pageviews
    #   type: number
    #   sql: ${TABLE}.totals.pageviews

    # - dimension: totals__screenviews
    #   type: number
    #   sql: ${TABLE}.totals.screenviews

    dimension: totals__time_on_screen {
      type: number
      sql: ${TABLE}.totals.timeOnScreen ;;
    }

    dimension: totals__time_on_site {
      description: "Time on site in minutes"
      type: number
      sql: ${TABLE}.totals.timeOnSite/60 ;;
    }

    # - dimension: totals__total_transaction_revenue
    #   type: number
    #   sql: ${TABLE}.totals.totalTransactionRevenue/1000000

    # - dimension: totals__transaction_revenue
    #   type: number
    #   sql: ${TABLE}.totals.transactionRevenue/1000000

    # - dimension: totals__transactions
    #   type: number
    #   sql: ${TABLE}.totals.transactions

    # - dimension: totals__unique_screenviews
    #   type: number
    #   sql: ${TABLE}.totals.uniqueScreenviews

    # - dimension: totals__visits
    #   type: number
    #   sql: ${TABLE}.totals.visits

    dimension: traffic_source__ad_content {
      type: string
      sql: ${TABLE}.trafficSource.adContent ;;
    }

    dimension: traffic_source__adwords_click_info__ad_group_id {
      type: number
      sql: ${TABLE}.trafficSource.adwordsClickInfo.adGroupId ;;
    }

    dimension: traffic_source__adwords_click_info__ad_network_type {
      type: string
      sql: ${TABLE}.trafficSource.adwordsClickInfo.adNetworkType ;;
    }

    dimension: traffic_source__adwords_click_info__campaign_id {
      type: number
      sql: ${TABLE}.trafficSource.adwordsClickInfo.campaignId ;;
    }

    dimension: traffic_source__adwords_click_info__creative_id {
      type: number
      sql: ${TABLE}.trafficSource.adwordsClickInfo.creativeId ;;
    }

    dimension: traffic_source__adwords_click_info__criteria_id {
      type: number
      sql: ${TABLE}.trafficSource.adwordsClickInfo.criteriaId ;;
    }

    dimension: traffic_source__adwords_click_info__criteria_parameters {
      type: string
      sql: ${TABLE}.trafficSource.adwordsClickInfo.criteriaParameters ;;
    }

    dimension: traffic_source__adwords_click_info__customer_id {
      type: number
      sql: ${TABLE}.trafficSource.adwordsClickInfo.customerId ;;
    }

    dimension: traffic_source__adwords_click_info__gcl_id {
      type: string
      sql: ${TABLE}.trafficSource.adwordsClickInfo.gclId ;;
    }

    dimension: traffic_source__adwords_click_info__is_video_ad {
      type: yesno
      sql: ${TABLE}.trafficSource.adwordsClickInfo.isVideoAd ;;
    }

    dimension: traffic_source__adwords_click_info__page {
      type: number
      sql: ${TABLE}.trafficSource.adwordsClickInfo.page ;;
    }

    dimension: traffic_source__adwords_click_info__slot {
      type: string
      sql: ${TABLE}.trafficSource.adwordsClickInfo.slot ;;
    }

    dimension: traffic_source__adwords_click_info__targeting_criteria__boom_userlist_id {
      type: number
      sql: ${TABLE}.trafficSource.adwordsClickInfo.targetingCriteria.boomUserlistId ;;
    }

    dimension: traffic_source__campaign {
      type: string
      sql: ${TABLE}.trafficSource.campaign ;;
    }

    dimension: traffic_source__campaign_code {
      type: string
      sql: ${TABLE}.trafficSource.campaignCode ;;
    }

    dimension: traffic_source__is_true_direct {
      type: yesno
      sql: ${TABLE}.trafficSource.isTrueDirect ;;
    }

    dimension: traffic_source__keyword {
      type: string
      sql: ${TABLE}.trafficSource.keyword ;;
    }

    dimension: traffic_source__medium {
      type: string
      sql: ${TABLE}.trafficSource.medium ;;
    }

    dimension: traffic_source__referral_path {
      type: string
      sql: ${TABLE}.trafficSource.referralPath ;;
    }

    dimension: traffic_source__source {
      type: string
      sql: ${TABLE}.trafficSource.source ;;
    }

    dimension: user_id {
      type: string
      sql: ${TABLE}.userId ;;
    }

    dimension: visit_id {
      type: string
      sql: ${TABLE}.visitId ;;
    }

    dimension: visit_number {
      type: number
      sql: ${TABLE}.visitNumber ;;
    }

    # - dimension: visit_start_time
    #   type: number
    #   sql: ${TABLE}.visitStartTime

    dimension_group: start_time {
      label: ""
      type: time
      sql: ${TABLE}.visitStartTime ;;
      datatype: epoch
      convert_tz: yes
    }

#     dimension: last_30_days {
#       type: yesno
#       sql: DATEDIFF( NOW(), ${TABLE}.date ) < 31 ;;
#     }

    dimension: last_30_days {
      type: string
      sql: DATEDIFF( CURRENT_DATE(), ${start_time_date} ) < 31 ;;
    }

  dimension: last_30_days2 {
    label: "Last 30 Days"
    type: string
    sql:
      CASE
        WHEN DATEDIFF( CURRENT_DATE(), ${start_time_date} ) < 31 THEN 'Last 30 Days'
        ELSE 'Previous Month'
      END;;
  }

    dimension: visitor_id {
      type: number
      sql: ${TABLE}.visitorId ;;
    }

    #   - measure: count
    #     type: count
    #     approximate_threshold: 100000
    #     drill_fields: detail*

  dimension: Brand_Name {
    hidden: no
    label: "Brand Name"
    type: string
    suggestions: ["Closer","Empire","Grazia","Heat","Mother & Baby","The Debrief","Todays Golfer"]
    sql: CASE
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/kiss/%' THEN 'Kiss'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hits/%' THEN 'The Hits'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/kerrang/%' THEN 'Kerrang'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/magic/%' THEN 'Magic'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-80s/%' THEN 'Absolute Radio'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-classic-rock/%' THEN 'Absolute Radio'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-radio-00s/%' THEN 'Absolute Radio'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-radio-60s/%' THEN 'Absolute Radio'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-radio-70s/%' THEN 'Absolute Radio'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-radio-90s/%' THEN 'Absolute Radio'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-radio/%' THEN 'Absolute Radio'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute/%' THEN 'Absolute Radio'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absoluteradio/%' THEN 'Absolute Radio'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/aire-2/%' THEN 'Aire'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/aire2/%' THEN 'Aire'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/aire-3/%' THEN 'Aire'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/aire3/%' THEN 'Aire'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/aire/%' THEN 'Aire'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/borders/%' THEN 'Borders'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/cfm/%' THEN 'CFM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/city-2/%' THEN 'City'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/city-3/%' THEN 'City'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/city2/%' THEN 'City'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/city3/%' THEN 'City'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/city-talk/%' THEN 'City'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/city/%' THEN 'City'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde-1/%' THEN 'Clyde'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde1/%' THEN 'Clyde'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/citytalk/%' THEN 'City'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde-2/%' THEN 'Clyde'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde2/%' THEN 'Clyde'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde-3/%' THEN 'Clyde'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde3/%' THEN 'Clyde'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde/%' THEN 'Clyde'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/cool-fm/%' THEN 'Cool FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/coolfm/%' THEN 'Cool FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/downtown/%' THEN 'Downtown'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/downtown-country/%' THEN 'Downtown'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth-2/%' THEN 'Forth'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth2/%' THEN 'Forth'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth-1/%' THEN 'Forth'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth1/%' THEN 'Forth'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth-3/%' THEN 'Forth'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth/%' THEN 'Forth'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth3/%' THEN 'Forth'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free-radio/%' THEN 'Free'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free/%' THEN 'Free'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free-80/%' THEN 'Free'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free-80s/%' THEN 'Free'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free-coventry/%' THEN 'Free'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free-cov/%' THEN 'Free'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/freeradio/%' THEN 'Free'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/gem-106/%' THEN 'Gem'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/gem106/%' THEN 'Gem'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/gem/%' THEN 'Gem'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallam-2/%' THEN 'Hallam'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallam2/%' THEN 'Hallam'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallam-3/%' THEN 'Hallam'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallam3/%' THEN 'Hallam'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallam-fm/%' THEN 'Hallam'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallam/%' THEN 'Hallam'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallamfm/%' THEN 'Hallam'
          WHEN(${TABLE}.hits.page.hostname LIKE '%planetradio.co.uk%' AND ${TABLE}.hits.page.pagePath LIKE '%/heat/%') THEN 'Heat Radio'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key-2/%' THEN 'Key'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key2/%' THEN 'Key'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key-3/%' THEN 'Key'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key3/%' THEN 'Key'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key-103/%' THEN 'Key'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key/%' THEN 'Key'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key103/%' THEN 'Key'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/kiss-fresh/%' THEN 'Kiss'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/kisstory/%' THEN 'Kiss'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/magic-chilled/%' THEN 'Magic'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/mellow-magic/%' THEN 'Magic'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/magic-mellow/%' THEN 'Magic'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/magic-soul/%' THEN 'Magic'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/metro-2/%' THEN 'Metro'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/metro/%' THEN 'Metro'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/metro-3/%' THEN 'Metro'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/mfr-2/%' THEN 'MFR'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/mfr-3/%' THEN 'MFR'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/mfr/%' THEN 'MFR'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/northsound-1/%' THEN 'Northsound'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/northsound-2/%' THEN 'Northsound'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/northsound/%' THEN 'Northsound'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/planet-rock/%' THEN 'Planet Rock'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/tfm/%' THEN 'TFM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/tfm-3/%' THEN 'TFM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/rock-fm/%' THEN 'Rock FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/rockfm/' THEN 'Rock FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/west/%' THEN 'West FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/wave-105/%' THEN 'Wave'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/wave/%' THEN 'Wave'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/wave105/%' THEN 'Wave'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/viking/%' THEN 'Viking'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/viking-3/%' THEN 'Viking'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/viking-2/%' THEN 'Viking'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/tay/%' THEN 'Tay FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/tay-2/%' THEN 'Tay FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/westsound/%' THEN 'Westsound'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/westsound-fm/%' THEN 'Westsound'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/tfm-2/%' THEN 'TFM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/rock/%' THEN 'Rock FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/tay-3/%' THEN 'Tay FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/radioborders/%' THEN 'Borders'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free80s/%' THEN 'Free'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/rock-fm-2/%' THEN 'Rock FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/rock-fm-3/%' THEN 'Rock FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.magic%' THEN 'Magic'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.planetrock%' THEN 'Planet Rock'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.coolfm%' THEN 'Cool FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.kerrangradio%' THEN 'Kerrang'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.forth1%' THEN 'Forth'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.wave105%' THEN 'Wave'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.mellowmagic%' THEN 'Magic'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.key103%' THEN 'Key'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.radiocity%' THEN 'City'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.magicchilled%' THEN 'Magic Chilled'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.metroradio%' THEN 'Metro'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.metro3radio%' THEN 'Metro'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.rockfm%' THEN 'Rock FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.heatworld%' THEN 'Heat Radio'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.hallamfm%' THEN 'Hallam'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.hallam3%' THEN 'Hallam'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.thehitsradio%' THEN 'The Hits'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.kissfmuk%' THEN 'Kiss'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%kisstory.kissfmuk%' THEN 'Kiss'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%kissfresh.kissfmuk%' THEN 'Kiss'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.northsound1%' THEN 'Northsound'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.downtown%' THEN 'Downtown'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.tayfm%' THEN 'Tay FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.mfr%' THEN 'MFR'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.westfm%' THEN 'West FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.vikingfm%' THEN 'Viking'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.cfmradio%' THEN 'CFM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.tfmradio%' THEN 'TFM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.downtowncountry%' THEN 'Downtown'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.radioborders%' THEN 'Borders'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.westsound%' THEN 'Westsound'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.tay2%' THEN 'Tay FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.hallam2%' THEN 'Hallam'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.radioaire2%' THEN 'Aire'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.northsound2%' THEN 'Northsound'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.key2radio%' THEN 'Key'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.viking2%' THEN 'Viking'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.metro2radio%' THEN 'Metro'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.tfm2%' THEN 'TFM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.forth3%' THEN 'Forth'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.tay3%' THEN 'Tay FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.key3radio%' THEN 'Key'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.viking3%' THEN 'Viking'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.radioaire3%' THEN 'Aire'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.tfm3%' THEN 'TFM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.clyde1%' THEN 'Clyde'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.clyde2%' THEN 'Clyde'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.clyde3%' THEN 'Clyde'
          WHEN (${TABLE}.hits.page.hostname LIKE '%lifestyle.one%' AND ${TABLE}.hits.page.pagePath LIKE '%/heat/%') THEN 'Heat'
          WHEN (${TABLE}.hits.page.hostname LIKE '%lifestyle.one%' AND ${TABLE}.hits.page.pagePath LIKE '%/closer/%') THEN 'Closer'
          WHEN (${TABLE}.hits.page.hostname LIKE '%lifestyle.one%' AND ${TABLE}.hits.page.pagePath LIKE '%/grazia%') THEN 'Grazia'
          WHEN ${TABLE}.hits.page.hostname LIKE '%parkers.co.uk%' THEN 'Parkers'
          WHEN ${TABLE}.hits.page.hostname LIKE '%motorcyclenews.com%' THEN 'Motorcyclenews'
          WHEN ${TABLE}.hits.page.hostname LIKE '%www.empireonline.com%' THEN 'Empire'
          WHEN ${TABLE}.hits.page.hostname LIKE '%motherandbaby.co.uk%' THEN 'Mother & Baby'
          WHEN ${TABLE}.hits.page.hostname LIKE '%carmagazine.co.uk%' THEN 'Car Magazine'
          WHEN ${TABLE}.hits.page.hostname LIKE '%classiccarsforsale.co.uk%' THEN 'Classic Cars for Sale'
          WHEN ${TABLE}.hits.page.hostname LIKE '%thedebrief.co.uk%' THEN 'The Debrief'
          WHEN ${TABLE}.hits.page.hostname LIKE '%todaysgolfer.co.uk%' THEN 'Todays Golfer'
          WHEN ${TABLE}.hits.page.hostname LIKE '%freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.hits.page.hostname LIKE '%gem106.orionplayer.co.uk' THEN 'Gem'
          WHEN ${TABLE}.hits.page.hostname LIKE '%planetradio.co.uk%' THEN 'Planet Radio'
          WHEN ${TABLE}.hits.page.hostname LIKE '%lifestyle.one%' THEN 'Todays Golfer'
          WHEN ${TABLE}.hits.page.hostname LIKE '%birmingham.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.hits.page.hostname LIKE '%coventry.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.hits.page.hostname LIKE '%blackcountry.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.hits.page.hostname LIKE '%shropshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.hits.page.hostname LIKE '%worcestershire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.hits.page.hostname LIKE '%80s.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.hits.page.hostname LIKE '%warwickshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.hits.page.hostname LIKE '%herefordshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.hits.page.hostname LIKE '%staffordshire.freeradioplayer.co.uk%' THEN 'Free'
          ELSE 'Unknown'
        END
         ;;
  }

  dimension: Brand_Platform {
    hidden: no
    label: "Brand Platform"
    type: string
    sql: CASE
          WHEN ${TABLE}.hits.page.pagePath LIKE '%kisstory.kissfmuk%' THEN 'Radioplayer'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%kissfresh.kissfmuk%' THEN 'Radioplayer'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer%' THEN 'Radioplayer'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/player/' THEN 'Radioplayer'
          ELSE 'Website'
        END
         ;;
  }

    #########

    dimension: is_engaged {
      description: "Based on having > 3 sessions"
      type: string
      sql: CASE
          WHEN ${TABLE}.totals.pageviews > 2 THEN 'Engaged'
          ELSE 'Not-Engaged'
        END
         ;;
    }

    dimension: uu_key {
      label: "Unique Key"
      hidden: yes
      sql: CONCAT(string(${TABLE}.fullVisitorId),"-",string(${TABLE}.visitId)) ;;
    }

    measure: Unique_Users {
      label: "Unique Users"
      approximate_threshold: 10000
      type: count_distinct
      sql: ${TABLE}.fullVisitorId ;;
    }

    # - dimension: date
    #   label: ''
    #   type: time
    #   timeframes: [date, week, month, month_num]
    #   sql: ${TABLE}.date

    measure: totals_newvisits {
      label: "Total New Sessions"
      type: sum
      sql_distinct_key: ${uu_key} ;;
      sql: ${TABLE}.totals.newVisits ;;
    }

    measure: totals_visits {
      label: "Total Sessions"
      type: sum
      sql_distinct_key: ${uu_key} ;;
      sql: ${TABLE}.totals.visits ;;
    }

    measure: totals_social_visits {
      label: "Total Social Sessions"
      type: sum
      sql_distinct_key: ${uu_key} ;;
      sql: ${TABLE}.totals.visits ;;

      filters: {
        field: hits__social__has_social_source_referral
        value: "Yes"
      }
    }

    dimension: totals_pageviews2 {
      label: "Total Pageviews TEST"
      type: string
      hidden:  yes
      sql: CASE
        WHEN ${TABLE}.totals.pageviews IS NOT NULL THEN 1
        ELSE NULL
        END;;
    }

    measure: totals_pageviews3 {
      label: "Individual Page Pageviews"
      type: sum
      hidden:  no
      sql: ${totals_pageviews2};;
    }

    #   - measure: totals_pageviews
    #     label: 'Total Pageviews'
    #     type: sum
    #     sql: ${TABLE}.totals.pageviews

    measure: totals_pageviews {
      label: "Total Pageviews"
      type: sum_distinct
      sql_distinct_key: ${uu_key} ;;
      sql: ${TABLE}.totals.pageviews ;;
    }

  measure: totals_pageviews122{
    label: "Total Pageviews - test"
    type: sum
    sql: ${TABLE}.totals.pageviews ;;
#       drill_fields: [detail*]
  }

    measure: pages_p_session {
      label: "Pages per Session"
      type: number
      value_format: "0.00"
      sql: ${totals_pageviews}/${totals_visits} ;;
    }

    measure: avg_time_on_site {
      label: "Avg Time on Site per Session"
      description: "Avg ime on site in minutes"
      type: number
      sql: (SUM(${TABLE}.totals.timeOnSite/60))/(SUM(${TABLE}.totals.visits)) ;;
    }

    measure: avg_dfp_clicks_per_session {
      label: "Avg Ad Clicks Per Session"
      description: "Avg ime on site in minutes"
      type: number
      sql: (SUM(${TABLE}.hits.publisher.dfpClicks))/(SUM(${TABLE}.totals.visits)) ;;
    }

    measure: avg_dfp_impressions_per_session {
      label: "Avg Ad Impessions Per Session"
      description: "Avg ime on site in minutes"
      type: number
      sql: (SUM(${TABLE}.hits.publisher.dfpImpressions))/(SUM(${TABLE}.totals.visits)) ;;
    }

    measure: totals__total_transaction_revenue {
      label: "Total Transaction Revenue ($)"
      type: sum
      value_format: "$0.00"
      sql: ${TABLE}.totals.totalTransactionRevenue/1000000 ;;
    }

    # - measure: totals__transaction_revenue
    #   label: 'Transaction Revenue'
    #   type: sum
    #   sql: ${TABLE}.totals.transactionRevenue/1000000

    measure: totals__transactions {
      label: "Transaction Count"
      type: sum
      sql: ${TABLE}.totals.transactions ;;
    }

    # - measure: totals__unique_screenviews
    #   label: 'Screenviews'
    #   type: sum
    #   sql: ${TABLE}.totals.uniqueScreenviews

    measure: totals__bounces {
      label: "Bounce Count"
      type: sum
      sql: ${TABLE}.totals.bounces ;;
    }

    measure: totals__new_visits {
      label: "New Visits Count"
      type: sum
      sql: ${TABLE}.totals.newVisits ;;
    }

    dimension: is_new_visit {
      label: "Is New Visit"
      type: yesno
      sql: ${TABLE}.totals.newVisits = 1 ;;
    }


    ################ H E A D E R  B I D D I N G #############

    # Basically, the Prebid.js data is set as a dataframe under custom events in BigQuery. This means you need to filter out useless data, otherwise it ruins the means/sums.
    # This is what we've replicated: http://prebid.org/assets/images/dev-docs/GA-custom-report.png
    # This is basically working out how Google does their backend data manipulation, it's actually quite inefficient but it works.

    # CASE DIMENSIONS INSTEAD OF FILTERING THEM:


    #
    #   - dimension: Prebid_Action
    #     type: string
    #     description: 'Request/Timeout/Bid/Win etc'
    #     sql: ${TABLE}.hits.eventInfo.eventAction
    #     filters:
    #       hits__event_info__event_category: 'Prebid.js Bids'
    #
    #   - dimension: Prebid_Action
    #     hidden: TRUE
    #     description: 'Prebid value, useless outside of measures'
    #     type: string
    #     sql: ${TABLE}.hits.eventInfo.eventValue
    #     filters:
    #       hits__event_info__event_category: 'Prebid.js Bids'








    measure: BIDTIME_TOTAL_VALUE {
      hidden: yes
      type: number
      sql: CASE
          WHEN ${TABLE}.hits.eventInfo.eventAction = 'Bid Load Time' THEN ${TABLE}.hits.eventInfo.eventValue
        END
         ;;
    }

    measure: BIDTIME_TOTAL_EVENTS {
      hidden: yes
      type: number
      sql: CASE
          WHEN ${TABLE}.hits.eventInfo.eventAction = 'Bid Load Time' THEN ${TABLE}.hits.eventInfo.eventAction
        END
         ;;
    }

    #   - measure: Prebid_BidLoadTime
    #     label: 'Prebid - Avg Bid Loadtime (ms)'
    #     description: 'Average bid loadtime (ms)'
    #     type: avg
    #     value_format: '0.00'
    #     sql: ${TOTAL_VALUE}/${TOTAL_EVENTS}
    #     filters:
    #       hits__event_info__event_action: 'Bid Load Time'

    measure: Prebid_BidLoadTime {
      label: "Prebid - Avg Bid Loadtime (ms)"
      description: "Average bid loadtime (ms)"
      type: number
      value_format: "0.00"
      sql: (SUM(${BIDTIME_TOTAL_VALUE})/COUNT(${BIDTIME_TOTAL_EVENTS}))/10 ;;
    }

    measure: BIDS_TOTAL_EVENTS {
      hidden: yes
      type: number
      sql: CASE
          WHEN ${TABLE}.hits.eventInfo.eventAction = 'Bids' THEN ${TABLE}.hits.eventInfo.eventAction
        END
         ;;
    }

    measure: BIDS_TOTAL_VALUE {
      hidden: yes
      type: number
      sql: CASE
          WHEN ${TABLE}.hits.eventInfo.eventAction = 'Bids' THEN ${TABLE}.hits.eventInfo.eventValue
        END
         ;;
    }

    measure: Prebid_TotalBids {
      label: "Prebid - Total Bids"
      description: "Total number of bids"
      type: sum_distinct
      sql_distinct_key: ${uu_key2} ;;
      sql: CASE
          WHEN ${TABLE}.hits.eventInfo.eventAction = 'Bids' THEN 1
        END
         ;;
    }

    measure: Prebid_AvgBidCPM {
      label: "Prebid - Avg Bid CPM"
      description: "Avg Bid CPM"
      type: average_distinct
      sql_distinct_key: ${uu_key2} ;;
      sql: CASE
          WHEN ${TABLE}.hits.eventInfo.eventAction = 'Bids' THEN (${TABLE}.hits.eventInfo.eventValue/100)*0.79136
        END
         ;;
      value_format: "\"£\"0.00"
    }

    measure: REQUESTS_TOTAL_EVENTS {
      hidden: yes
      type: number
      sql: CASE
          WHEN ${TABLE}.hits.eventInfo.eventAction = 'Requests' THEN ${TABLE}.hits.eventInfo.eventAction
        END
         ;;
    }

    measure: Prebid_Requests {
      label: "Prebid - Total Requests"
      description: "Total number of bid requests"
      type: number
      sql: COUNT(${REQUESTS_TOTAL_EVENTS}) ;;
    }

    measure: TIMEOUTS_TOTAL_EVENTS {
      hidden: yes
      type: number
      sql: CASE
          WHEN ${TABLE}.hits.eventInfo.eventAction = 'Timeouts' THEN ${TABLE}.hits.eventInfo.eventAction
        END
         ;;
    }

    measure: Prebid_Timeouts {
      label: "Prebid - Total Timeouts"
      description: "Total number of timeouts"
      type: number
      sql: COUNT(${TIMEOUTS_TOTAL_EVENTS}) ;;
    }

    dimension: uu_key_2 {
      label: "Unique Key 2"
      hidden: yes
      sql: CONCAT(string(${TABLE}.fullVisitorId),"-",string(${TABLE}.visitId),"-",string(${TABLE}.hits.type),"-",string(${TABLE}.hits.eventInfo.eventAction)) ;;
    }

    dimension: Prebid_Bidder {
      label: "Prebid - Bidder"
      type: string
      sql: CASE
          WHEN ${TABLE}.hits.eventInfo.eventCategory = 'Prebid.js Bids' THEN ${TABLE}.hits.eventInfo.eventLabel
        END
         ;;
    }

    measure: WIN_TOTAL_EVENTS {
      hidden: yes
      type: number
      sql: CASE
          WHEN ${TABLE}.hits.eventInfo.eventAction = 'Wins' THEN ${TABLE}.hits.eventInfo.eventAction
        END
         ;;
    }

    measure: WIN_TOTAL_VALUE {
      hidden: yes
      type: number
      sql: CASE
          WHEN ${TABLE}.hits.eventInfo.eventAction = 'Wins' THEN ${TABLE}.hits.eventInfo.eventValue
        END
         ;;
    }

    #   - measure: Prebid_Wins
    #     label: 'Prebid - Paid Impressions'
    #     description: 'Total number of winning & paid for win'
    #     type: sum
    #     sql: |
    #       CASE
    #         WHEN (${TABLE}.hits.eventInfo.eventAction = 'Wins') THEN 1
    #       END


    dimension: uu_key2 {
      label: "Unique Key2"
      hidden: yes
      sql: CONCAT(string(${TABLE}.fullVisitorId),string(${TABLE}.visitId),string(${TABLE}.hits.eventInfo.eventCategory),string(${TABLE}.hits.eventInfo.eventAction),string(${TABLE}.hits.eventInfo.eventLabel),string(${TABLE}.hits.hitNumber)) ;;
    }

    measure: Prebid_Wins {
      label: "Prebid - Paid Impressions"
      description: "Total number of paid impressions (winning bids)"
      type: sum_distinct
      sql_distinct_key: ${uu_key2} ;;
      sql: CASE
          WHEN ${TABLE}.hits.eventInfo.eventAction = 'Wins' THEN 1
        END
         ;;
    }

    measure: Prebid_Sum_Win_Value {
      hidden: yes
      label: "Prebid - Total Wins"
      description: "Total number of winning bids"
      type: sum_distinct
      sql_distinct_key: ${uu_key2} ;;
      sql: CASE
          WHEN ${TABLE}.hits.eventInfo.eventAction = 'Wins' THEN ${TABLE}.hits.eventInfo.eventValue
        END
         ;;
    }

    measure: Prebid_Avg_Win_Value {
      hidden: yes
      label: "Prebid - Total Wins"
      description: "Total number of winning bids"
      type: number
      sql: ${Prebid_Wins}/${Prebid_Sum_Win_Value} ;;
    }

    #   - measure: Prebid_Wins
    #     label: 'Prebid - Total Wins'
    #     description: 'Total number of winning bids'
    #     type: sum
    #     sql: ${WIN_TOTAL_EVENTS}

    #   - measure: Prebid_WinCPM
    #     label: 'Prebid - Total Wins'
    #     description: 'Total number of winning bids'
    #     type: sum
    #     type: number
    #     sql: ${WIN_TOTAL_VALUE}/1000

    #   - measure: Prebid_AvgWinCPM
    #     label: 'Prebid - Avg Win CPM'
    #     description: 'Average winning CPM'
    #     type: number
    #     sql: ((SUM(${WIN_TOTAL_VALUE}))/(COUNT(${WIN_TOTAL_EVENTS})))/100
    #     value_format: '$0.000000'

    measure: Prebid_AvgWinCPM {
      label: "Prebid - Avg Winning eCPM"
      description: "Average winning eCPM"
      type: number
      sql: ((${Prebid_AvgWinRevenue}*100000)/(${Prebid_Wins}))/100 ;;
      value_format: "\"£\"0.00"
    }

    measure: Prebid_AvgWinCPM1 {
      label: "Prebid - Avg Winning rCPM"
      description: "Average winning rCPM"
      type: number
      sql: ((${Prebid_AvgWinRevenue}*10000)/(${Prebid_Wins}))/100 ;;
      value_format: "\"£\"0.00"
    }

    #   - measure: Prebid_AvgWinRevenue
    #     label: 'Prebid - Revenue'
    #     description: 'Winning Revenue CPM'
    #     type: sum
    #     value_format: '$0.00'
    #     sql: ((${Prebid_Wins})*(${Prebid_Sum_Win_Value}/${Prebid_Wins}))/100000

    #   - measure: Prebid_AvgWinRevenue
    #     label: 'Prebid - Revenue'
    #     description: 'Winning Revenue CPM'
    #     type: number
    #     value_format: '$0.00'
    #     sql: (${Prebid_Wins}*${Prebid_Sum_Win_Value})/100000000000

    measure: Prebid_AvgWinRevenue {
      label: "Prebid - Revenue"
      description: "Winning Revenue CPM"
      type: number
      value_format: "\"£\"0.00"
      #updated 01/12/2016
      sql: (((${Prebid_Sum_Win_Value})/100000)*0.79136) ;;
    }

    measure: Prebid_Timeout_Rate {
      label: "Prebid - Timeout Rate"
      description: "Timeout Rate"
      type: number
      value_format: "0.00\"%\""
      sql: ${Prebid_Timeouts}/${Prebid_Requests} ;;
    }

    ################ CUSTOM DIMENSIONS WRANGLING ##############
    #
    #   - dimension: Author
    #     label: 'Custom Dimensions - Author Name'
    #     type: string
    #     sql: |
    #       CASE
    #         WHEN string(${TABLE}.hits.customDimensions.index) = '1' THEN ${TABLE}.hits.customDimensions.value
    #       END
    #
    #   - dimension: Published_Date
    #     label: 'Custom Dimensions - Author Name'
    #     hidden: TRUE
    #     type: string
    #     sql: |
    #       CASE
    #         WHEN string(${TABLE}.hits.customDimensions.index) = '2' THEN ${TABLE}.hits.customDimensions.value
    #       END
    #
    #   - dimension: article_published
    #     label: 'Custom Dimensions - Author Name'
    #     type: time
    #     timeframes: [date, week, month, month_num]
    #     sql: ${Published_Date}
    #
    #   - dimension: Author_Published_Date
    #     label: 'Custom Dimensions - Author & Published Date'
    #     type: string
    #     sql: CONCAT(string(${Author}),string(${Published_Date}))
    #
    #     #string(${hits__page__page_path})
    #
    #   - measure: No_articles
    #     label: 'Number of Articles Published'
    #     type: count_distinct
    #     sql: ${Author_Published_Date}

}
