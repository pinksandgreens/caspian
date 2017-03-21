view: jr_lifestyle_audience {
  label: "Lifestyle"

  derived_table: {
    sql: SELECT
        REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
        REGEXP_EXTRACT(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+') AS Section_Category,
        fullvisitorID as Visitor,
        device.isMobile AS MobileFlag,
        device.mobileDeviceBranding AS Mobile_Brand,
        device.mobileDeviceMarketingName AS Mobile_Name,
        device.mobileDeviceModel AS Mobile_Model
      FROM
        {% table_date_range jr_lifestyle_audience.TP1 114668488.ga_sessions_ %},{% table_date_range jr_lifestyle_audience.TP1 114668488.ga_sessions_intraday_ %}
      WHERE {% condition jr_lifestyle_audience.brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %}
      AND geoNetwork.country = 'United Kingdom' AND device.mobileDeviceModel != '(not set)'

       ;;
  }


  filter: TP1 {
    label: "1. Last Month"
    hidden: yes
    type: date
  }

  filter: brand_filter {
    hidden: yes
    label: "Brand"
  }

  dimension:  Mobile_Model {
    hidden: yes
    view_label: "Audience"
    group_label: "Audience Dimensions"
    label: "Mobile: Model Name"
    sql: ${TABLE}.Mobile_Model ;;
    description: "Mobile Model Name"

  }

#   dimension: Visitor {
#     view_label: "Content"
#     group_label: "Article Dimensions"
#     label: "Site Category"
#     sql: ${TABLE}.Visitor ;;
#     description: "Visitors"
#   }

}
