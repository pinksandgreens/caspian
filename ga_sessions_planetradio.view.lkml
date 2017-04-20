view: ga_sessions_planetradio {
  sql_table_name: ( SELECT * FROM {% table_date_range date_filter 127467161.ga_sessions_ %},
      {% table_date_range date_filter 127467161.ga_sessions_intraday_ %})
     ;;
     # - view: ga_sessions
     #   sql_table_name: |
     #       [uplifted-light-89310:114668488].ga_sessions_20160112

             # {% table_date_range date_filter 22661559.ga_sessions_ %},
             # {% table_date_range date_filter 24089672.ga_sessions_ %})

             # {% table_date_range date_filter 25170071.ga_sessions_ %}

             # {% table_date_range date_filter 116749887.ga_sessions_ %},
             # {% table_date_range date_filter 117239363.ga_sessions_ %},
             # {% table_date_range date_filter 120878053.ga_sessions_ %},
             # {% table_date_range date_filter 127467161.ga_sessions_ %},
             # {% table_date_range date_filter 128574436.ga_sessions_ %},
             # {% table_date_range date_filter 128576144.ga_sessions_ %},
             # {% table_date_range date_filter 128580663.ga_sessions_ %},
             # {% table_date_range date_filter 18457891.ga_sessions_ %},
             # {% table_date_range date_filter 22925605.ga_sessions_ %},
             # {% table_date_range date_filter 24003361.ga_sessions_ %},
             # {% table_date_range date_filter 24003809.ga_sessions_ %},
             # {% table_date_range date_filter 24004037.ga_sessions_ %},
             # {% table_date_range date_filter 39081823.ga_sessions_ %},
             # {% table_date_range date_filter 40162614.ga_sessions_ %},
             # {% table_date_range date_filter 40742804.ga_sessions_ %},
             # {% table_date_range date_filter 40744371.ga_sessions_ %},
             # {% table_date_range date_filter 44760556.ga_sessions_ %},
             # {% table_date_range date_filter 457989.ga_sessions_ %},
             # {% table_date_range date_filter 49187927.ga_sessions_ %},
             # {% table_date_range date_filter 49238469.ga_sessions_ %},
             # {% table_date_range date_filter 53119312.ga_sessions_ %},
             # {% table_date_range date_filter 55259691.ga_sessions_ %},
             # {% table_date_range date_filter 57443485.ga_sessions_ %},
             # {% table_date_range date_filter 58200759.ga_sessions_ %},
             # {% table_date_range date_filter 58279538.ga_sessions_ %},
             # {% table_date_range date_filter 63446395.ga_sessions_ %},
             # {% table_date_range date_filter 63448481.ga_sessions_ %},
             # {% table_date_range date_filter 63450278.ga_sessions_ %},
             # {% table_date_range date_filter 63456167.ga_sessions_ %},
             # {% table_date_range date_filter 72255843.ga_sessions_ %},
             # {% table_date_range date_filter 773992.ga_sessions_ %},
             # {% table_date_range date_filter 93483324.ga_sessions_ %})
             # {% table_date_range date_filter 25170071.ga_sessions_ %}
    filter: date_filter {
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

    dimension: hits__page__page_path {
      type: string
      sql: ${TABLE}.hits.page.pagePath ;;
      fanout_on: "hits"
    }

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

    dimension: hits__page__page_title {
      type: string
      sql: ${TABLE}.hits.page.pageTitle ;;
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

    # Not sure what use this is

    # - dimension: hits__publisher__ads_clicked
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adsClicked
    #   fanout_on: hits

    # - dimension: hits__publisher__ads_pages_viewed
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adsPagesViewed
    #   fanout_on: hits

    # - dimension: hits__publisher__ads_revenue
    #   type: number
    #   value_format: '$0.00'
    #   sql: ${TABLE}.hits.publisher.adsRevenue/1000000
    #   fanout_on: hits

    # - dimension: hits__publisher__ads_units_matched
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adsUnitsMatched
    #   fanout_on: hits

    # - dimension: hits__publisher__ads_units_viewed
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adsUnitsViewed
    #   fanout_on: hits

    # - dimension: hits__publisher__ads_viewed
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adsViewed
    #   fanout_on: hits







    # - dimension: hits__publisher__adsense_backfill_dfp_clicks
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adsenseBackfillDfpClicks
    #   fanout_on: hits

    # - dimension: hits__publisher__adsense_backfill_dfp_impressions
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adsenseBackfillDfpImpressions
    #   fanout_on: hits

    # - dimension: hits__publisher__adsense_backfill_dfp_matched_queries
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adsenseBackfillDfpMatchedQueries
    #   fanout_on: hits

    # - dimension: hits__publisher__adsense_backfill_dfp_measurable_impressions
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adsenseBackfillDfpMeasurableImpressions
    #   fanout_on: hits

    # - dimension: hits__publisher__adsense_backfill_dfp_pages_viewed
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adsenseBackfillDfpPagesViewed
    #   fanout_on: hits

    # - dimension: hits__publisher__adsense_backfill_dfp_queries
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adsenseBackfillDfpQueries
    #   fanout_on: hits

    # - dimension: hits__publisher__adsense_backfill_dfp_revenue_cpc
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adsenseBackfillDfpRevenueCpc/1000000
    #   fanout_on: hits

    # - dimension: hits__publisher__adsense_backfill_dfp_revenue_cpm
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adsenseBackfillDfpRevenueCpm/1000000
    #   fanout_on: hits

    # - dimension: hits__publisher__adsense_backfill_dfp_viewable_impressions
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adsenseBackfillDfpViewableImpressions
    #   fanout_on: hits

    # - dimension: hits__publisher__adx_backfill_dfp_clicks
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adxBackfillDfpClicks
    #   fanout_on: hits

    # - dimension: hits__publisher__adx_backfill_dfp_impressions
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adxBackfillDfpImpressions
    #   fanout_on: hits

    # - dimension: hits__publisher__adx_backfill_dfp_matched_queries
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adxBackfillDfpMatchedQueries
    #   fanout_on: hits

    # - dimension: hits__publisher__adx_backfill_dfp_measurable_impressions
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adxBackfillDfpMeasurableImpressions
    #   fanout_on: hits

    # - dimension: hits__publisher__adx_backfill_dfp_pages_viewed
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adxBackfillDfpPagesViewed
    #   fanout_on: hits

    # - dimension: hits__publisher__adx_backfill_dfp_queries
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adxBackfillDfpQueries
    #   fanout_on: hits

    # - dimension: hits__publisher__adx_backfill_dfp_revenue_cpc
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adxBackfillDfpRevenueCpc/1000000
    #   fanout_on: hits

    # - dimension: hits__publisher__adx_backfill_dfp_revenue_cpm
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adxBackfillDfpRevenueCpm/1000000
    #   fanout_on: hits

    # - dimension: hits__publisher__adx_backfill_dfp_viewable_impressions
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adxBackfillDfpViewableImpressions
    #   fanout_on: hits

    # - dimension: hits__publisher__adx_clicks
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adxClicks
    #   fanout_on: hits

    # - dimension: hits__publisher__adx_impressions
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adxImpressions
    #   fanout_on: hits

    # - dimension: hits__publisher__adx_matched_queries
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adxMatchedQueries
    #   fanout_on: hits

    # - dimension: hits__publisher__adx_measurable_impressions
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adxMeasurableImpressions
    #   fanout_on: hits

    # - dimension: hits__publisher__adx_pages_viewed
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adxPagesViewed
    #   fanout_on: hits

    # - dimension: hits__publisher__adx_queries
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adxQueries
    #   fanout_on: hits

    # - dimension: hits__publisher__adx_revenue
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adxRevenue/1000000
    #   fanout_on: hits

    # - dimension: hits__publisher__adx_viewable_impressions
    #   type: number
    #   sql: ${TABLE}.hits.publisher.adxViewableImpressions
    #   fanout_on: hits

    dimension: hits__publisher__dfp_ad_group {
      type: string
      sql: ${TABLE}.hits.publisher.dfpAdGroup ;;
      fanout_on: "hits"
    }

    dimension: hits__publisher__dfp_ad_units {
      type: string
      sql: ${TABLE}.hits.publisher.dfpAdUnits ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__dfp_clicks {
      label: "DFP Clicks"
      type: sum
      sql: ${TABLE}.hits.publisher.dfpClicks ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__dfp_impressions {
      label: "DFP Impressions"
      type: sum
      sql: ${TABLE}.hits.publisher.dfpImpressions ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__dfp_matched_queries {
      label: "DFP Matched Queries"
      type: sum
      sql: ${TABLE}.hits.publisher.dfpMatchedQueries ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__dfp_measurable_impressions {
      label: "DFP Measurable Impressions"
      type: sum
      sql: ${TABLE}.hits.publisher.dfpMeasurableImpressions ;;
      fanout_on: "hits"
    }

    dimension: hits__publisher__dfp_network_id {
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
      label: "DFP Queries"
      type: sum
      sql: ${TABLE}.hits.publisher.dfpQueries ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__dfp_revenue_cpc {
      label: "DFP CPC - Testing"
      type: average
      value_format: "$0.00"
      sql: ${TABLE}.hits.publisher.dfpRevenueCpc/1000000 ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__dfp_revenue_cpm {
      label: "DFP CPM - Testing"
      type: average
      value_format: "$0.00"
      sql: ${TABLE}.hits.publisher.dfpRevenueCpm/1000000 ;;
      fanout_on: "hits"
    }

    measure: dfp_revenue {
      label: "DFP Revenue"
      description: "DFP CPC * DFP Clicks"
      type: sum
      value_format: "$0.00"
      sql: (${TABLE}.hits.publisher.dfpRevenueCpc/1000000)*(${TABLE}.hits.publisher.dfpClicks) ;;
    }

    measure: hits__publisher__dfp_viewable_impressions {
      label: "DFP Viewable Impressions"
      type: sum
      sql: ${TABLE}.hits.publisher.dfpViewableImpressions ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__measurable_ads_viewed {
      label: "DFP Measurable Ads Viewed"
      type: sum
      sql: ${TABLE}.hits.publisher.measurableAdsViewed ;;
      fanout_on: "hits"
    }

    measure: hits__publisher__viewable_ads_viewed {
      label: "DFP Viewable Ads Viewed"
      type: sum
      sql: ${TABLE}.hits.publisher.viewableAdsViewed ;;
      fanout_on: "hits"
    }

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


    dimension: UK_RoW {
        label: "UK/RoW"
        type: string
        sql: CASE
            WHEN ${TABLE}.geoNetwork.country = 'United Kingdom' THEN 'United Kingdom'
            WHEN ${TABLE}.geoNetwork.country = '(not set)' THEN 'Unknown'
            ELSE 'RoW'
          END
           ;;
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

    dimension: visitor_id {
      type: number
      sql: ${TABLE}.visitorId ;;
    }

    #   - measure: count
    #     type: count
    #     approximate_threshold: 100000
    #     drill_fields: detail*

    dimension: Brand_Station {
      hidden: no
      label: "Brand Station"
      type: string
      sql: CASE
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/kiss/%' THEN 'Kiss'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hits/%' THEN 'The Hits'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/kerrang/%' THEN 'Kerrang'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/magic/%' THEN 'Magic'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-80s/%' THEN 'Absolute 80s'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-classic-rock/%' THEN 'Absolute Classic Rock'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-radio-00s/%' THEN 'Absolute 00s'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-radio-60s/%' THEN 'Absolute 60s'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-radio-70s/%' THEN 'Absolute 70s'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-radio-90s/%' THEN 'Absolute 90s'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-radio/%' THEN 'Absolute Radio'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute/%' THEN 'Absolute Radio'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absoluteradio/%' THEN 'Absolute Radio'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/aire-2/%' THEN 'Aire 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/aire2/%' THEN 'Aire 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/aire-3/%' THEN 'Aire 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/aire3/%' THEN 'Aire 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/aire/%' THEN 'Aire'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/borders/%' THEN 'Borders'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/cfm/%' THEN 'CFM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/city-2/%' THEN 'City 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/city-3/%' THEN 'City 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/city2/%' THEN 'City 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/city3/%' THEN 'City 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/city-talk/%' THEN 'City Talk'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/city/%' THEN 'City'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde-1/%' THEN 'Clyde 1'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde1/%' THEN 'Clyde 1'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/citytalk/%' THEN 'City Talk'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde-2/%' THEN 'Clyde 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde2/%' THEN 'Clyde 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde-3/%' THEN 'Clyde 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde3/%' THEN 'Clyde 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde/%' THEN 'Clyde 1'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/cool-fm/%' THEN 'Cool FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/coolfm/%' THEN 'Cool FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/downtown/%' THEN 'Downtown'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/downtown-country/%' THEN 'Downtown Country'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth-2/%' THEN 'Forth 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth2/%' THEN 'Forth 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth-1/%' THEN 'Forth 1'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth1/%' THEN 'Forth 1'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth-3/%' THEN 'Forth 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth/%' THEN 'Forth 1'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth3/%' THEN 'Forth 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free-radio/%' THEN 'Free'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free/%' THEN 'Free'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free-80/%' THEN 'Free 80s'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free-80s/%' THEN 'Free 80s'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free-coventry/%' THEN 'Free'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free-cov/%' THEN 'Free'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/freeradio/%' THEN 'Free'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/gem-106/%' THEN 'Gem'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/gem106/%' THEN 'Gem'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/gem/%' THEN 'Gem'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallam-2/%' THEN 'Hallam 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallam2/%' THEN 'Hallam 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallam-3/%' THEN 'Hallam 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallam3/%' THEN 'Hallam 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallam-fm/%' THEN 'Hallam'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallam/%' THEN 'Hallam'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallamfm/%' THEN 'Hallam'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/heat/%' THEN 'Heat'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key-2/%' THEN 'Key 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key2/%' THEN 'Key 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key-3/%' THEN 'Key 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key3/%' THEN 'Key 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key-103/%' THEN 'Key'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key/%' THEN 'Key'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key103/%' THEN 'Key'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/kiss-fresh/%' THEN 'Kiss Fresh'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/kisstory/%' THEN 'Kisstory'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/magic-chilled/%' THEN 'Magic Chilled'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/mellow-magic/%' THEN 'Magic Mellow'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/magic-mellow/%' THEN 'Magic Mellow'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/magic-soul/%' THEN 'Magic Soul'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/metro-2/%' THEN 'Metro 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/metro/%' THEN 'Metro'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/metro-3/%' THEN 'Metro 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/mfr-2/%' THEN 'MFR 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/mfr-3/%' THEN 'MFR 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/mfr/%' THEN 'MFR'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/northsound-1/%' THEN 'Northsound'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/northsound-2/%' THEN 'Northsound 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/northsound/%' THEN 'Northsound'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/planet-rock/%' THEN 'Planet Rock'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/tfm/%' THEN 'TFM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/tfm-3/%' THEN 'TFM 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/rock-fm/%' THEN 'Rock FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/rockfm/' THEN 'Rock FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/west/%' THEN 'West FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/wave-105/%' THEN 'Wave'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/wave/%' THEN 'Wave'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/wave105/%' THEN 'Wave'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/viking/%' THEN 'Viking'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/viking-3/%' THEN 'Viking 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/viking-2/%' THEN 'Viking 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/tay/%' THEN 'Tay FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/tay-2/%' THEN 'Tay 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/westsound/%' THEN 'Westsound'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/westsound-fm/%' THEN 'Westsound'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/tfm-2/%' THEN 'TFM 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/rock/%' THEN 'Rock FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/tay-3/%' THEN 'Tay 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/radioborders/%' THEN 'Borders'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free80s/%' THEN 'Free 80s'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/rock-fm-2/%' THEN 'Rock FM 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/rock-fm-3/%' THEN 'Rock FM 3'

          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.magic%' THEN 'Magic'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.planetrock%' THEN 'Planet Rock'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.coolfm%' THEN 'Cool FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.kerrangradio%' THEN 'Kerrang'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.forth1%' THEN 'Forth 1'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.wave105%' THEN 'Wave'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.mellowmagic%' THEN 'Magic Mellow'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.key103%' THEN 'Key'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.radiocity%' THEN 'City'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.magicchilled%' THEN 'Magic Chilled'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.metroradio%' THEN 'Metro'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.metro3radio%' THEN 'Metro 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.rockfm%' THEN 'Rock FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.heatworld%' THEN 'Heat'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.hallamfm%' THEN 'Hallam'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.hallam3%' THEN 'Hallam 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.thehitsradio%' THEN 'The Hits'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.kissfmuk%' THEN 'Kiss'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%kisstory.kissfmuk%' THEN 'Kisstory'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%kissfresh.kissfmuk%' THEN 'Kiss Fresh'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.northsound1%' THEN 'Northsound'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.downtown%' THEN 'Downtown'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.tayfm%' THEN 'Tay FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.mfr%' THEN 'MFR'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.westfm%' THEN 'West FM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.vikingfm%' THEN 'Viking'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.cfmradio%' THEN 'CFM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.tfmradio%' THEN 'TFM'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.downtowncountry%' THEN 'Downtown Country'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.radioborders%' THEN 'Borders'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.westsound%' THEN 'Westsound'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.tay2%' THEN 'Tay 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.hallam2%' THEN 'Hallam 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.radioaire2%' THEN 'Aire 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.northsound2%' THEN 'Northsound 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.key2radio%' THEN 'Key 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.viking2%' THEN 'Viking 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.metro2radio%' THEN 'Metro 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.tfm2%' THEN 'TFM 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.forth3%' THEN 'Forth 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.tay3%' THEN 'Tay 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.key3radio%' THEN 'Key 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.viking3%' THEN 'Viking 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.radioaire3%' THEN 'Aire 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.tfm3%' THEN 'TFM 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.clyde1%' THEN 'Clyde 1'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.clyde2%' THEN 'Clyde 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.clyde3%' THEN 'Clyde 3'
          ELSE 'Planet Radio'
        END
         ;;
    }

  dimension: Brand_Name {
    hidden: no
    label: "Brand Name"
    type: string
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
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/heat/%' THEN 'Heat'
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
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.heatworld%' THEN 'Heat'
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
          ELSE 'Planet Radio'
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
          WHEN ${TABLE}.hits.page.pagePath LIKE '%player%' THEN 'Radioplayer'
          ELSE 'Website'
        END
         ;;
  }


  dimension: Brand_Network {
    hidden: no
    label: "Brand Network"
    type: string
    sql: CASE
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/kiss/%' THEN 'Kiss Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hits/%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/kerrang/%' THEN 'Kerrang Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/magic/%' THEN 'Magic Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-80s/%' THEN 'Absolute Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-classic-rock/%' THEN 'Absolute Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-radio-00s/%' THEN 'Absolute Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-radio-60s/%' THEN 'Absolute Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-radio-70s/%' THEN 'Absolute Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-radio-90s/%' THEN 'Absolute Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute-radio/%' THEN 'Absolute Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absolute/%' THEN 'Absolute Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/absoluteradio/%' THEN 'Absolute Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/aire-2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/aire2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/aire-3/%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/aire3/%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/aire/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/borders/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/cfm/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/city-2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/city-3/%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/city2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/city3/%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/city-talk/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/city/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde-1/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde1/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/citytalk/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde-2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde-3/%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde3/%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/clyde/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/cool-fm/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/coolfm/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/downtown/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/downtown-country/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth-2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth-1/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth1/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth-3/%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/forth3/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free-radio/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free-80/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free-80s/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free-coventry/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free-cov/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/freeradio/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/gem-106/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/gem106/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/gem/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallam-2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallam2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallam-3/%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallam3/%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallam-fm/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallam/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/hallamfm/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/heat/%' THEN 'Heat Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key-2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key-3/%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key3/%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key-103/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/key103/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/kiss-fresh/%' THEN 'Kiss Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/kisstory/%' THEN 'Kiss Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/magic-chilled/%' THEN 'Magic Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/mellow-magic/%' THEN 'Magic Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/magic-mellow/%' THEN 'Magic Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/magic-soul/%' THEN 'Magic Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/metro-2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/metro/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/metro-3/%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/mfr-2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/mfr-3/%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/mfr/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/northsound-1/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/northsound-2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/northsound/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/planet-rock/%' THEN 'Planet Rock Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/tfm/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/tfm-3/%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/rock-fm/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/rockfm/' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/west/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/wave-105/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/wave/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/wave105/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/viking/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/viking-3/%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/viking-2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/tay/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/tay-2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/westsound/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/westsound-fm/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/tfm-2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/rock/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/tay-3/%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/radioborders/%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/free80s/%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/rock-fm-2/%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%/rock-fm-3/%' THEN 'BCN 3'

          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.magic%' THEN 'Magic Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.planetrock%' THEN 'Planet Rock Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.coolfm%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.kerrangradio%' THEN 'Kerrang Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.forth1%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.wave105%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.mellowmagic%' THEN 'Magic Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.key103%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.radiocity%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.magicchilled%' THEN ' Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.metroradio%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.metro3radio%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.rockfm%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.heatworld%' THEN 'Heat Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.hallamfm%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.hallam3%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.thehitsradio%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.kissfmuk%' THEN 'Kiss Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%kisstory.kissfmuk%' THEN 'Kiss Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%kissfresh.kissfmuk%' THEN 'Kiss Network'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.northsound1%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.downtown%' THEN 'BCN Ext'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.tayfm%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.mfr%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.westfm%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.vikingfm%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.cfmradio%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.tfmradio%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.downtowncountry%' THEN 'BCN Ect'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.radioborders%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.westsound%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.tay2%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.hallam2%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.radioaire2%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.northsound2%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.key2radio%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.viking2%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.metro2radio%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.tfm2%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.forth3%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.tay3%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.key3radio%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.viking3%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.radioaire3%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.tfm3%' THEN 'BCN 3'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.clyde1%' THEN 'BCN'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.clyde2%' THEN 'BCN 2'
          WHEN ${TABLE}.hits.page.pagePath LIKE '%radioplayer.clyde3%' THEN 'BCN 3'
          ELSE 'Planet Radio'
        END
         ;;
  }


# ELSE ${TABLE}.hits.page.pagePath

    #########

    #   - dimension: Page_Path_Full
    #     description: 'Full user page path'
    #     type: string
    #     sql: |
    #       group_concat(UNIQUE(${TABLE}.hits.page.pagePath))
    #       GROUP BY ${TABLE}.fullVisitorId

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
      type: sum_distinct
      sql_distinct_key: ${uu_key} ;;
      sql: ${TABLE}.totals.newVisits ;;
    }

    measure: totals_visits {
      label: "Total Sessions"
      type: sum_distinct
      sql_distinct_key: ${uu_key} ;;
      sql: ${TABLE}.totals.visits ;;
    }

    measure: totals_social_visits {
      label: "Total Social Sessions"
      type: sum_distinct
      sql_distinct_key: ${uu_key} ;;
      sql: ${TABLE}.totals.visits ;;

      filters: {
        field: hits__social__has_social_source_referral
        value: "Yes"
      }
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
      drill_fields: [detail*]
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

    # ----- Sets of fields for drilling ------
    set: detail {
      fields: [
        hits__page__page_path,
        Unique_Users,
        totals_pageviews3
      ]
    }
  }
