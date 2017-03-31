view: ga_sessions_20161005 {
  sql_table_name: ( SELECT * FROM {% table_date_range date_filter 74005709.ga_sessions_ %},
   {% table_date_range date_filter 74005709.ga_sessions_intraday_ %}) ;;

      filter: date_filter {
        type: date
      }


label: "In Touch Weekly"

  dimension: channel_grouping {
    type: string
    sql: ${TABLE}.channelGrouping ;;
  }

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

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
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
    sql: ${TABLE}.geoNetwork.latitude ;;
  }

  dimension: geo_network__longitude {
    type: string
    sql: ${TABLE}.geoNetwork.longitude ;;
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
    sql: ${TABLE}.hits.item.itemQuantity ;;
    fanout_on: "hits"
  }

  dimension: hits__item__item_revenue {
    type: number
    sql: ${TABLE}.hits.item.itemRevenue ;;
    fanout_on: "hits"
  }

  dimension: hits__item__local_item_revenue {
    type: number
    sql: ${TABLE}.hits.item.localItemRevenue ;;
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
    sql: ${TABLE}.hits.product.localProductRevenue ;;
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
    sql: ${TABLE}.hits.product.productRevenue ;;
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

  dimension: hits__publisher__ads_clicked {
    type: number
    sql: ${TABLE}.hits.publisher.adsClicked ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__ads_pages_viewed {
    type: number
    sql: ${TABLE}.hits.publisher.adsPagesViewed ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__ads_revenue {
    type: number
    sql: ${TABLE}.hits.publisher.adsRevenue ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__ads_units_matched {
    type: number
    sql: ${TABLE}.hits.publisher.adsUnitsMatched ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__ads_units_viewed {
    type: number
    sql: ${TABLE}.hits.publisher.adsUnitsViewed ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__ads_viewed {
    type: number
    sql: ${TABLE}.hits.publisher.adsViewed ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adsense_backfill_dfp_clicks {
    type: number
    sql: ${TABLE}.hits.publisher.adsenseBackfillDfpClicks ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adsense_backfill_dfp_impressions {
    type: number
    sql: ${TABLE}.hits.publisher.adsenseBackfillDfpImpressions ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adsense_backfill_dfp_matched_queries {
    type: number
    sql: ${TABLE}.hits.publisher.adsenseBackfillDfpMatchedQueries ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adsense_backfill_dfp_measurable_impressions {
    type: number
    sql: ${TABLE}.hits.publisher.adsenseBackfillDfpMeasurableImpressions ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adsense_backfill_dfp_pages_viewed {
    type: number
    sql: ${TABLE}.hits.publisher.adsenseBackfillDfpPagesViewed ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adsense_backfill_dfp_queries {
    type: number
    sql: ${TABLE}.hits.publisher.adsenseBackfillDfpQueries ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adsense_backfill_dfp_revenue_cpc {
    type: number
    sql: ${TABLE}.hits.publisher.adsenseBackfillDfpRevenueCpc ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adsense_backfill_dfp_revenue_cpm {
    type: number
    sql: ${TABLE}.hits.publisher.adsenseBackfillDfpRevenueCpm ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adsense_backfill_dfp_viewable_impressions {
    type: number
    sql: ${TABLE}.hits.publisher.adsenseBackfillDfpViewableImpressions ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adx_backfill_dfp_clicks {
    type: number
    sql: ${TABLE}.hits.publisher.adxBackfillDfpClicks ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adx_backfill_dfp_impressions {
    type: number
    sql: ${TABLE}.hits.publisher.adxBackfillDfpImpressions ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adx_backfill_dfp_matched_queries {
    type: number
    sql: ${TABLE}.hits.publisher.adxBackfillDfpMatchedQueries ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adx_backfill_dfp_measurable_impressions {
    type: number
    sql: ${TABLE}.hits.publisher.adxBackfillDfpMeasurableImpressions ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adx_backfill_dfp_pages_viewed {
    type: number
    sql: ${TABLE}.hits.publisher.adxBackfillDfpPagesViewed ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adx_backfill_dfp_queries {
    type: number
    sql: ${TABLE}.hits.publisher.adxBackfillDfpQueries ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adx_backfill_dfp_revenue_cpc {
    type: number
    sql: ${TABLE}.hits.publisher.adxBackfillDfpRevenueCpc ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adx_backfill_dfp_revenue_cpm {
    type: number
    sql: ${TABLE}.hits.publisher.adxBackfillDfpRevenueCpm ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adx_backfill_dfp_viewable_impressions {
    type: number
    sql: ${TABLE}.hits.publisher.adxBackfillDfpViewableImpressions ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adx_clicks {
    type: number
    sql: ${TABLE}.hits.publisher.adxClicks ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adx_impressions {
    type: number
    sql: ${TABLE}.hits.publisher.adxImpressions ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adx_matched_queries {
    type: number
    sql: ${TABLE}.hits.publisher.adxMatchedQueries ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adx_measurable_impressions {
    type: number
    sql: ${TABLE}.hits.publisher.adxMeasurableImpressions ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adx_pages_viewed {
    type: number
    sql: ${TABLE}.hits.publisher.adxPagesViewed ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adx_queries {
    type: number
    sql: ${TABLE}.hits.publisher.adxQueries ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adx_revenue {
    type: number
    sql: ${TABLE}.hits.publisher.adxRevenue ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__adx_viewable_impressions {
    type: number
    sql: ${TABLE}.hits.publisher.adxViewableImpressions ;;
    fanout_on: "hits"
  }

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

  dimension: hits__publisher__dfp_clicks {
    type: number
    sql: ${TABLE}.hits.publisher.dfpClicks ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__dfp_impressions {
    type: number
    sql: ${TABLE}.hits.publisher.dfpImpressions ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__dfp_matched_queries {
    type: number
    sql: ${TABLE}.hits.publisher.dfpMatchedQueries ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__dfp_measurable_impressions {
    type: number
    sql: ${TABLE}.hits.publisher.dfpMeasurableImpressions ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__dfp_network_id {
    type: string
    sql: ${TABLE}.hits.publisher.dfpNetworkId ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__dfp_pages_viewed {
    type: number
    sql: ${TABLE}.hits.publisher.dfpPagesViewed ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__dfp_queries {
    type: number
    sql: ${TABLE}.hits.publisher.dfpQueries ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__dfp_revenue_cpc {
    type: number
    sql: ${TABLE}.hits.publisher.dfpRevenueCpc ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__dfp_revenue_cpm {
    type: number
    sql: ${TABLE}.hits.publisher.dfpRevenueCpm ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__dfp_viewable_impressions {
    type: number
    sql: ${TABLE}.hits.publisher.dfpViewableImpressions ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__measurable_ads_viewed {
    type: number
    sql: ${TABLE}.hits.publisher.measurableAdsViewed ;;
    fanout_on: "hits"
  }

  dimension: hits__publisher__viewable_ads_viewed {
    type: number
    sql: ${TABLE}.hits.publisher.viewableAdsViewed ;;
    fanout_on: "hits"
  }

  dimension: hits__referer {
    type: string
    sql: ${TABLE}.hits.referer ;;
    fanout_on: "hits"
  }

  dimension: hits__refund__local_refund_amount {
    type: number
    sql: ${TABLE}.hits.refund.localRefundAmount ;;
    fanout_on: "hits"
  }

  dimension: hits__refund__refund_amount {
    type: number
    sql: ${TABLE}.hits.refund.refundAmount ;;
    fanout_on: "hits"
  }

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
    sql: ${TABLE}.hits.transaction.localTransactionRevenue ;;
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
    sql: ${TABLE}.hits.transaction.transactionRevenue ;;
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

  dimension: totals__bounces {
    type: number
    sql: ${TABLE}.totals.bounces ;;
  }

  dimension: totals__hits {
    type: number
    sql: ${TABLE}.totals.hits ;;
  }

  dimension: totals__new_visits {
    type: number
    sql: ${TABLE}.totals.newVisits ;;
  }

  dimension: totals__pageviews {
    type: number
    sql: ${TABLE}.totals.pageviews ;;
  }

  dimension: totals__screenviews {
    type: number
    sql: ${TABLE}.totals.screenviews ;;
  }

  dimension: totals__time_on_screen {
    type: number
    sql: ${TABLE}.totals.timeOnScreen ;;
  }

  dimension: totals__time_on_site {
    type: number
    sql: ${TABLE}.totals.timeOnSite ;;
  }

  dimension: totals__total_transaction_revenue {
    type: number
    sql: ${TABLE}.totals.totalTransactionRevenue ;;
  }

  dimension: totals__transaction_revenue {
    type: number
    sql: ${TABLE}.totals.transactionRevenue ;;
  }

  dimension: totals__transactions {
    type: number
    sql: ${TABLE}.totals.transactions ;;
  }

  dimension: totals__unique_screenviews {
    type: number
    sql: ${TABLE}.totals.uniqueScreenviews ;;
  }

  dimension: totals__visits {
    type: number
    sql: ${TABLE}.totals.visits ;;
  }

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
    type: number
    sql: ${TABLE}.visitId ;;
  }

  dimension: visit_number {
    type: number
    sql: ${TABLE}.visitNumber ;;
  }

  dimension: visit_start_time {
    type: number
    sql: ${TABLE}.visitStartTime ;;
  }

  dimension: visitor_id {
    type: number
    sql: ${TABLE}.visitorId ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      hits__app_info__landing_screen_name,
      hits__app_info__exit_screen_name,
      hits__app_info__app_name,
      hits__app_info__name,
      hits__app_info__screen_name,
      hits__custom_variables__custom_var_name,
      hits__source_property_info__source_property_display_name,
      hits__item__product_name,
      hits__product__product_list_name,
      hits__product__v2_product_name,
      hits__page__hostname,
      hits__promotion__promo_name,
      device__mobile_device_marketing_name
    ]
  }
}
