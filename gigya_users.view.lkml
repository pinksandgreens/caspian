view: gigya_users {
  label: "2a. Registered Users"
  sql_table_name: publications.gigya_users ;;

  dimension: address {
    hidden: yes
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: address2 {
    hidden: yes
    type: string
    sql: ${TABLE}.address2 ;;
  }

  dimension: address3 {
    hidden: yes
    type: string
    sql: ${TABLE}.address3 ;;
  }

  dimension: age {
    hidden: yes
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: email_optin {
    type: yesno
    sql: ${TABLE}.baueremailoptin ;;
  }

  dimension: bauerphoneoptin {
    hidden: yes
    type: yesno
    sql: ${TABLE}.bauerphoneoptin ;;
  }

  dimension: bauerpostaloptin {
    hidden: yes
    type: yesno
    sql: ${TABLE}.bauerpostaloptin ;;
  }

  dimension: bauersmsoptin {
    hidden: yes
    type: yesno
    sql: ${TABLE}.bauersmsoptin ;;
  }

  dimension: bio {
    hidden: yes
    type: string
    sql: ${TABLE}.bio ;;
  }

  dimension: birthday {
    hidden: yes
    type: number
    sql: ${TABLE}.birthday ;;
  }

  dimension: birthmonth {
    hidden: yes
    type: number
    sql: ${TABLE}.birthmonth ;;
  }

  dimension: birthyear {
    hidden: yes
    type: number
    sql: ${TABLE}.birthyear ;;
  }

  dimension: city {
    hidden: yes
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    hidden: yes
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created ;;
  }

  dimension: created_timestamp {
    hidden: yes
    type: number
    sql: ${TABLE}.created_timestamp ;;
  }

  dimension_group: ddw_updated {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.ddw_updated_date ;;
  }

  dimension: education_level {
    hidden: yes
    type: string
    sql: ${TABLE}.education_level ;;
  }

  dimension: email {
    hidden: yes
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    hidden: yes
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: followerscount {
    hidden: yes
    type: number
    sql: ${TABLE}.followerscount ;;
  }

  dimension: followingcount {
    hidden: yes
    type: number
    sql: ${TABLE}.followingcount ;;
  }

  dimension: location_test {
    label: "Latitude/Longitude Location"
    type: location
    sql_latitude: ROUND(${TABLE}.location_lat,1) ;;
    sql_longitude: ROUND(${TABLE}.location_long,1) ;;
  }

  dimension: gender {
    hidden: yes
    type: string

    case: {
      when: {
        sql: ${TABLE}.gender = 'f' or ${TABLE}.gender = 'F' ;;
        label: "female"
      }

      when: {
        sql: ${TABLE}.gender = 'm' or ${TABLE}.gender = 'M' ;;
        label: "male"
      }

      else: "unknown"
    }
  }

  dimension: gigya_id {
    label: "User ID"
    type: string
    primary_key: yes
    sql: ${TABLE}.gigya_id ;;
  }

  dimension: has_been_processed {
    hidden: yes
    type: yesno
    sql: ${TABLE}.has_been_processed ;;
  }

  dimension: home_country_iso_code {
    hidden: yes
    type: string
    sql: ${TABLE}.home_country_iso_code ;;
  }

  dimension: hometown {
    hidden: yes
    type: string
    sql: ${TABLE}.hometown ;;
  }

  dimension: individual_id {
    label: "Individual ID"
    type: number
    sql: ${TABLE}.individual_id ;;
  }

  dimension: industry {
    hidden: yes
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: interestedin {
    hidden: yes
    type: string
    sql: ${TABLE}.interestedin ;;
  }

  dimension: irank {
    hidden: yes
    type: number
    sql: ${TABLE}.irank ;;
  }

  dimension: is_active {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_lockedout {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_lockedout ;;
  }

  dimension: is_registered {
    label: "Is Registered on Gigya"
    type: yesno
    sql: ${TABLE}.is_registered ;;
  }

  dimension: is_verified {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_verified ;;
  }

  dimension_group: last_login {
    label: "Last Login"
    hidden: no
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_login ;;
  }

  dimension: last_name {
    hidden: yes
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension_group: last_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: last_updated_timestamp {
    hidden: yes
    type: number
    sql: ${TABLE}.last_updated_timestamp ;;
  }

  dimension: locale {
    hidden: yes
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: location_city {
    hidden: yes
    type: string
    sql: ${TABLE}.location_city ;;
  }

  dimension: location_country {
    hidden: yes
    type: string
    sql: ${TABLE}.location_country ;;
  }

  dimension: location_lat {
    hidden: yes
    type: number
    sql: ${TABLE}.location_lat ;;
  }

  dimension: location_long {
    hidden: yes
    type: number
    sql: ${TABLE}.location_long ;;
  }

  dimension: location_state {
    hidden: yes
    type: string
    sql: ${TABLE}.location_state ;;
  }

  dimension: mobile_country_iso_code {
    hidden: yes
    type: string
    sql: ${TABLE}.mobile_country_iso_code ;;
  }

  dimension: name {
    hidden: yes
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: nickname {
    hidden: yes
    type: string
    sql: ${TABLE}.nickname ;;
  }

  dimension_group: oldest_data_updated {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.oldest_data_updated ;;
  }

  dimension: oldest_data_updated_timestamp {
    hidden: yes
    type: number
    sql: ${TABLE}.oldest_data_updated_timestamp ;;
  }

  dimension: photourl {
    hidden: yes
    type: string
    sql: ${TABLE}.photourl ;;
  }

  dimension: political_view {
    hidden: yes
    type: string
    sql: ${TABLE}.political_view ;;
  }

  dimension: professional_headline {
    label: "Job Title"
    type: string
    sql: ${TABLE}.professional_headline ;;
  }

  dimension: profile_url {
    hidden: yes
    type: string
    sql: ${TABLE}.profile_url ;;
  }

  dimension: proxy_email {
    hidden: yes
    type: string
    sql: ${TABLE}.proxy_email ;;
  }

  dimension_group: registered {
    label: "Registered"
    hidden: no
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.registered ;;
  }

  dimension: registered_timestamp {
    hidden: yes
    type: number
    sql: ${TABLE}.registered_timestamp ;;
  }

  dimension: regsource {
    hidden: yes
    type: string
    sql: ${TABLE}.regsource ;;
  }

  dimension: relationship_status {
    hidden: yes
    type: string
    sql: ${TABLE}.relationship_status ;;
  }

  dimension: religion {
    hidden: yes
    type: string
    sql: ${TABLE}.religion ;;
  }

  dimension: social_providers {
    label: "Social Providers"
    type: string
    sql: ${TABLE}.social_providers ;;
  }

  dimension: state {
    label: "County"
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: thirdpartyemailoptin {
    hidden: yes
    type: yesno
    sql: ${TABLE}.thirdpartyemailoptin ;;
  }

  dimension: thirdpartyphoneoptin {
    hidden: yes
    type: yesno
    sql: ${TABLE}.thirdpartyphoneoptin ;;
  }

  dimension: thirdpartypostaloptin {
    hidden: yes
    type: yesno
    sql: ${TABLE}.thirdpartypostaloptin ;;
  }

  dimension: thirdpartysmsoptin {
    hidden: yes
    type: yesno
    sql: ${TABLE}.thirdpartysmsoptin ;;
  }

  dimension: thumbnailurl {
    hidden: yes
    type: string
    sql: ${TABLE}.thumbnailurl ;;
  }

  dimension: timezone {
    hidden: yes
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: title {
    hidden: yes
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: username {
    hidden: yes
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: verified {
    hidden: yes
    type: yesno
    sql: ${TABLE}.verified ;;
  }

  dimension: verified_timestamp {
    hidden: yes
    type: number
    sql: ${TABLE}.verified_timestamp ;;
  }

  dimension: work_country_iso_code {
    hidden: yes
    type: string
    sql: ${TABLE}.work_country_iso_code ;;
  }

  dimension: zipcode {
    hidden: yes
    type: string
    sql: ${TABLE}.zipcode ;;
  }

  dimension: logged_in_date_banding {
    label: "Last Logged In - Date Banding"
    type: string
    sql: CASE
        WHEN DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) = 0 THEN '6) Today'
        WHEN DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) > 0 AND DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) <= 7 THEN '5) 1-7 days'
        WHEN DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) > 7 AND DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) <= 30 THEN '4) 8-30 days'
        WHEN DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) > 30 AND DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) <= 90 THEN '3) 1-3 months'
        WHEN DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) > 90 AND DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) <= 180 THEN '2) 3-6 months'
        WHEN DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) > 180 AND DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) <= 365 THEN '1) 6-12 months'
        ELSE 'Unknown'
      END
       ;;
  }

  dimension: active_user {
    label: "Is Active User (~3 months)"
    type: yesno
    sql: DATEDIFF('month', ${TABLE}.last_login, CURRENT_DATE) >= 0  AND DATEDIFF('month', ${TABLE}.last_login, CURRENT_DATE) <= 3 ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [first_name, last_name, name, nickname, username]
  }

  measure: users_count {
    label: "Registered Users Count"
    type: count_distinct
    sql: ${TABLE}.email ;;
  }
}
