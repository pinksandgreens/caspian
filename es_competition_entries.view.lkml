view: es_competition_entries {
  label: "2b. Competition Entries"
  sql_table_name: publications.es_competition_entries ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    hidden: yes
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_name {
    hidden: yes
    label: "Account Name"
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: action {
    hidden: yes
    type: string
    sql: ${TABLE}.action ;;
  }

  dimension: channel {
    label: "Entry Channel"
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: competition_id {
    hidden: yes
    type: string
    sql: ${TABLE}.competition_id ;;
  }

  dimension: couponcode {
    hidden: yes
    label: "Coupon Code Used"
    type: string
    sql: ${TABLE}.couponcode ;;
  }

  dimension_group: created {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_date ;;
  }

  dimension_group: date_created {
    label: "Competition - Created"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_created ;;
  }

  dimension_group: date_entered {
    label: "Entry"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_entered ;;
  }

  dimension: entry_status {
    hidden: yes
    type: string
    sql: ${TABLE}.entry_status ;;
  }

  dimension: entrytype {
    hidden: yes
    type: string
    sql: ${TABLE}.entrytype ;;
  }

  dimension: flags {
    hidden: yes
    type: string
    sql: ${TABLE}.flags ;;
  }

  dimension: ip {
    hidden: yes
    type: string
    sql: ${TABLE}.ip ;;
  }

  dimension: medium {
    hidden: yes
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: mode {
    hidden: yes
    type: string
    sql: ${TABLE}.mode ;;
  }

  dimension: network {
    label: "Entry Method"
    type: string
    sql: ${TABLE}.network ;;
  }

  dimension: quizcategory {
    label: "Quiz Category"
    hidden: no
    type: string
    sql: ${TABLE}.quizcategory ;;
  }

  dimension: quizscore {
    hidden: yes
    type: number
    sql: ${TABLE}.quizscore ;;
  }

  dimension: referrals {
    hidden: yes
    type: number
    sql: ${TABLE}.referrals ;;
  }

  dimension: shares {
    hidden: yes
    type: number
    sql: ${TABLE}.shares ;;
  }

  dimension: source_user_avatar {
    hidden: yes
    type: string
    sql: ${TABLE}.source_user_avatar ;;
  }

  dimension: source_user_link {
    hidden: yes
    type: string
    sql: ${TABLE}.source_user_link ;;
  }

  dimension: source_user_name {
    hidden: yes
    type: string
    sql: ${TABLE}.source_user_name ;;
  }

  dimension: t_and_c {
    hidden: yes
    type: yesno
    sql: ${TABLE}.t_and_c ;;
  }

  dimension: timezone {
    hidden: yes
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: ugccomment {
    hidden: yes
    type: string
    sql: ${TABLE}.ugccomment ;;
  }

  dimension: ugcimage {
    hidden: yes
    type: string
    sql: ${TABLE}.ugcimage ;;
  }

  dimension: ugcoriginlink {
    hidden: yes
    type: string
    sql: ${TABLE}.ugcoriginlink ;;
  }

  dimension: ugcthumbnail {
    hidden: yes
    type: string
    sql: ${TABLE}.ugcthumbnail ;;
  }

  dimension_group: updated {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_date ;;
  }

  dimension: user_id {
    hidden: yes
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: useragent {
    label: "User Device Info - TESTING"
    hidden: yes
    type: string
    sql: ${TABLE}.useragent ;;
  }

  ########### Stopped using this.
  #sql: |
  #      CASE
  #             WHEN ${TABLE}.useragent LIKE '%Mobi%' THEN 'Mobile'
  #             WHEN ${TABLE}.useragent LIKE '%Tablet%' THEN 'Tablet'
  #             WHEN ${TABLE}.useragent LIKE '%Mobile Safari%' THEN 'Mobile'
  #             WHEN ${TABLE}.useragent LIKE '%Android%' THEN 'Mobile'
  #             WHEN ${TABLE}.useragent LIKE '%iPhone%' THEN 'Mobile'
  #             WHEN ${TABLE}.useragent LIKE '%BB10%' THEN 'Mobile'
  #             WHEN ${TABLE}.useragent LIKE '%Windows%' THEN 'Desktop'
  #             WHEN ${TABLE}.useragent LIKE '%MSIE%' THEN 'Desktop'
  #             WHEN ${TABLE}.useragent LIKE '%Macintosh%' THEN 'Desktop'
  #             WHEN ${TABLE}.useragent LIKE '%X11%' THEN 'Desktop'
  #             WHEN ${TABLE}.useragent LIKE '%iPad%' THEN 'Tablet'
  #             WHEN ${TABLE}.useragent LIKE '%Ubuntu%' THEN 'Desktop'
  #             WHEN ${TABLE}.useragent LIKE '%PlayStation%' THEN 'Console'
  #             WHEN ${TABLE}.useragent LIKE '%Nintendo%' THEN 'Console'
  #             WHEN ${TABLE}.useragent LIKE '%PlayBook%' THEN 'Tablet'
  #             WHEN ${TABLE}.useragent LIKE '%Presto%' THEN 'Desktop'
  #             WHEN ${TABLE}.useragent LIKE '%Linux; Linux%' THEN 'Desktop'
  #             WHEN ${TABLE}.useragent LIKE '%Linux; NetCast%' THEN 'Desktop'
  #             WHEN ${TABLE}.useragent LIKE '%Linux; U%' THEN 'Desktop'
  #       END

  dimension: device_type {
    label: "User Device Type"
    hidden: no
    type: string
    sql: CASE
       WHEN (${useragent} LIKE '%iphone%' OR ${useragent} LIKE '%iPhone%' OR ${useragent} LIKE '%Windows mobile%' OR ${useragent} LIKE '%Windows phone%' OR ${useragent} LIKE '%Windows Phone%' OR ${useragent} LIKE '%Nexus 5%' OR ${useragent} LIKE '%GTI-9300%' OR ${useragent} LIKE '%Nokia%' OR ${useragent} LIKE '%SGH-M919V%' OR ${useragent} LIKE '%SCH-%' OR ${useragent} LIKE '%Mobi%' OR ${useragent} LIKE '%Opera mini%') AND (${useragent} NOT LIKE '%iPad%') THEN 'Mobile'
       WHEN ((${useragent} LIKE '%Windows%' OR ${useragent} LIKE '%WOW64%' OR ${useragent} LIKE '%Intel Mac OS%' OR ${useragent} LIKE '%Windows NT 6.1; Trident/7.0%' OR ${useragent} LIKE '%Media Center PC%') AND (${useragent} NOT LIKE '%iPad%')) THEN 'Desktop'
       WHEN (${useragent} LIKE '%Tablet PC%' OR ${useragent} LIKE '%Touch%' OR ${useragent} LIKE '%MyPhone%' OR ${useragent} LIKE '%iPad%' OR ${useragent} LIKE '%ipad%' OR ${useragent} LIKE '%Tablet%') THEN 'Tablet'
       ELSE 'Unknown'
      END
       ;;
  }

  dimension: browser {
    label: "User Web Browser"
    hidden: no
    type: string
    sql: CASE
      WHEN ${TABLE}.useragent LIKE '%Firefox%' THEN 'Firefox'
      WHEN ${TABLE}.useragent LIKE '%Chrome%' THEN 'Chrome'
      WHEN ${TABLE}.useragent LIKE '%Safari%' THEN 'Safari'
      WHEN ${TABLE}.useragent LIKE '%MSIE%' THEN 'Internet Explorer'
      WHEN ${TABLE}.useragent LIKE '%AppleWebKit%' THEN 'Safari'
      WHEN ${TABLE}.useragent LIKE '%rv%' THEN 'Internet Explorer'
      WHEN ${TABLE}.useragent LIKE '%Opera%' THEN 'Opera'
      ELSE 'Other/Unknown'
END
 ;;
  }

  dimension: operating_system {
    label: "User Operating System"
    hidden: no
    type: string
    sql: CASE
      WHEN ${TABLE}.useragent LIKE '%Windows%' THEN 'Windows'
      WHEN ${TABLE}.useragent LIKE '%Macintosh%' THEN 'Mac OS'
      WHEN ${TABLE}.useragent LIKE '%Presto%' THEN 'Linux'
      WHEN ${TABLE}.useragent LIKE '%Linux; Linux%' THEN 'Linux'
      WHEN ${TABLE}.useragent LIKE '%Linux; NetCast%' THEN 'Linux'
      WHEN ${TABLE}.useragent LIKE '%Linux; U%' THEN 'Linux'
      WHEN ${TABLE}.useragent LIKE '%Ubuntu%' THEN 'Linux'
      WHEN ${TABLE}.useragent LIKE '%Mac OS X%' THEN 'Mac OS'
      WHEN ${TABLE}.useragent LIKE '%Android%' THEN 'Android'
      WHEN ${TABLE}.useragent LIKE '%CrOS%' THEN 'Chrome OS'
      WHEN ${TABLE}.useragent LIKE '%X11%' THEN 'Mac OS'
      WHEN ${TABLE}.useragent LIKE '%PlayStation%' THEN 'Console'
      WHEN ${TABLE}.useragent LIKE '%Nintendo%' THEN 'Console'
      WHEN ${TABLE}.useragent LIKE '%AppleWebKit%' THEN 'Mac OS'
      WHEN ${TABLE}.useragent LIKE '%iPhone%' THEN 'Mac OS'
      ELSE 'Other/Unknown'
END
 ;;
  }

  measure: entries_count {
    label: "Entries Count"
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [comp_drill_set_1*]
  }

  #  - dimension: entries_count_drill
  #    type: count_distinct
  #    hidden: true
  #    sql: ${id}

  measure: competitions_count {
    label: "Competitions Count"
    type: count_distinct
    sql: ${TABLE}.competition_id ;;
  }

  # Meant to be a measure, but some updates and deprication on Looker fucked this.
  #  - dimension: entries_count_banding
  #    hidden: TRUE
  #    label: 'Entries Count Banding'
  #    type: tier
  #    tiers: [1,4,9,14,19,29]
  #    sql: ${entries_count}
  #    style: integer



  measure: avg_entries_per_competition {
    hidden: yes
    label: "Average Entries per Competition"
    type: number
    sql: ${entries_count}/${competitions_count} ;;
    drill_fields: [comp_drill_set_1*]
  }

  # Takes entries count and divides by estimated mean, >1 above average, <1 below average) formats by colour
  measure: success_metric {
    label: "Success Metric"
    type: number
    hidden: yes
    sql: ${es_competition_entries.entries_count}/1814.24 ;;
    drill_fields: [comp_drill_set_1*]
    html: {% if value > 1 %}
      <font color="darkgreen">{{ rendered_value }}</font>
      {% elsif value < 1 %}
        <font color="red">{{ rendered_value }}</font>
      {% else %}
        <font color="black">{{ rendered_value }}</font>
      {% endif %}
      ;;
  }

  set: comp_drill_set_1 {
    fields: [es_competitions.name, es_competitions.ref_taxonomy_1, es_competitions.ref_campaign_aim, es_competitions.ref_campaign_stakeholder, es_competition_entries.entries_count]
  }
}

#  sets:
#    comp_drill_set_1:
#      - es_competitions.name
#      - es_competitions.brand
#      - es_users.created_week
#      - es_users.email
#      - es_users.optin
#      - es_competition_entries.date_entered
#      - es_competitions.ref_campaign_aim
#      - es_competitions.ref_campaign_stakeholder
#      - es_competitions.ref_taxonomy_1
#      - es_competition_entries.entires_count
