view: social_youtube_advanced {
  sql_table_name: publications.social_youtube_advanced ;;

  measure: ad_impressions {
    type: sum
    sql: ${TABLE}.adimpressions ;;
    drill_fields: [post_details*]
  }

  measure: number_of_videos {
    type: count_distinct
    sql: ${TABLE}.video_id ;;
    drill_fields: [post_details*]
  }


  measure: annotation_clickable_impressions {
    type: sum
    sql: ${TABLE}.annotationclickableimpressions ;;
  }

  measure: annotation_clicks {
    type: sum
    sql: ${TABLE}.annotationclicks ;;
  }

  measure: annotation_click_through_rate {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}.annotationclickthroughrate::float*100;;
  }

  measure: annotation_closable_impressions {
    type: sum
    sql: ${TABLE}.annotationclosableimpressions ;;
  }

  measure: annotation_closerate {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}.annotationcloserate::float*100 ;;
  }

  measure: annotation_closes {
    type: sum
    sql: ${TABLE}.annotationcloses ;;
  }

  measure: annotation_impressions {
    type: sum
    sql: ${TABLE}.annotationimpressions ;;
  }

  measure: average_view_duration {
    label: "Average View Duration (Seconds)"
    type: average
    value_format: "0.00"
    sql: ${TABLE}.averageviewduration::float ;;
    drill_fields: [post_details*]
  }

  measure: average_view_percentage {
    type: average
    value_format: "0.00\%"
    sql: ${TABLE}.averageviewpercentage::float ;;
    drill_fields: [post_details*]
  }

  dimension: brand {
    type: string
    sql:
      CASE
        WHEN ${TABLE}.brand LIKE '%boxes?%' THEN 'Absolute Radio'
        WHEN ${TABLE}.brand='Clyde 1' THEN 'Clyde 1'
        WHEN ${TABLE}.brand='967WestFM' THEN 'West FM'
        WHEN ${TABLE}.brand='Radio Aire' THEN 'Aire'
        WHEN ${TABLE}.brand='Cool FM' THEN 'Cool FM'
        WHEN ${TABLE}.brand='Absolute Radio' THEN 'Absolute Radio'
        WHEN ${TABLE}.brand='Mother&Baby' THEN 'Mother&Baby'
        WHEN ${TABLE}.brand='BIKEmagazineUK' THEN 'Bike Magazine'
        WHEN ${TABLE}.brand='CARmagazineTV' THEN 'Car Magazine'
        WHEN ${TABLE}.brand='CFMRadio' THEN 'CFM Radio'
        WHEN ${TABLE}.brand='Radio City Talk' THEN 'Radio City Talk'
        WHEN ${TABLE}.brand='Closer' THEN 'Closer'
        WHEN ${TABLE}.brand='Empire Magazine' THEN 'Empire Magazine'
        WHEN ${TABLE}.brand='FHM' THEN 'FHM'
        WHEN ${TABLE}.brand='Fleet News' THEN 'Fleet News'
        WHEN ${TABLE}.brand='Forth 1' THEN 'Forth 1'
        WHEN ${TABLE}.brand='Wave 105 (GPW Archive)' THEN 'Wave 105 (GPW Archive)'
        WHEN ${TABLE}.brand='Gem 106' THEN 'Gem 106'
        WHEN ${TABLE}.brand='GoFishingOnline' THEN 'Go Fishing'
        WHEN ${TABLE}.brand='GoThinkBig' THEN 'GoThinkBig'
        WHEN ${TABLE}.brand='Grazia UK' THEN 'Grazia'
        WHEN ${TABLE}.brand='hallamfm' THEN 'hallamfm'
        WHEN ${TABLE}.brand='heat, heatworld & heat Radio' THEN 'Heat'
        WHEN ${TABLE}.brand='HighStreetHoney' THEN 'HighStreetHoney'
        WHEN ${TABLE}.brand='KerrangPodcast' THEN 'KerrangPodcast'
        WHEN ${TABLE}.brand='Kerrang! Radio' THEN 'Kerrang! Radio'
        WHEN ${TABLE}.brand='Key103' THEN 'Key103'
        WHEN ${TABLE}.brand='KISS FM UK' THEN 'KISS FM'
        WHEN ${TABLE}.brand='Land Rover Owner International' THEN 'LRO'
        WHEN ${TABLE}.brand='Magic Radio' THEN 'Magic Radio'
        WHEN ${TABLE}.brand='MATCH Magazine' THEN 'MATCH Magazine'
        WHEN ${TABLE}.brand='metroradiouk' THEN 'metroradiouk'
        WHEN ${TABLE}.brand='MorayFirthRadio' THEN 'MorayFirthRadio'
        WHEN ${TABLE}.brand='MCN - Motorcyclenews.com' THEN 'MCN'
        WHEN ${TABLE}.brand='Northsound 1' THEN 'Northsound 1'
        WHEN ${TABLE}.brand='Parkers' THEN 'Parkers'
        WHEN ${TABLE}.brand='Planet Rock' THEN 'Planet Rock'
        WHEN ${TABLE}.brand='PracticalClassics' THEN 'Practical Classics'
        WHEN ${TABLE}.brand='practicalfishkeeping' THEN 'Practical Fishkeeping'
        WHEN ${TABLE}.brand='Q4music' THEN 'Q4music'
        WHEN ${TABLE}.brand='Radio City 96.7' THEN 'Radio City 96.7'
        WHEN ${TABLE}.brand='RAILmagazineOnline' THEN 'RAILmagazineOnline'
        WHEN ${TABLE}.brand='rockfm974' THEN 'rockfm974'
        WHEN ${TABLE}.brand='tfmradio' THEN 'tfmradio'
        WHEN ${TABLE}.brand='The Debrief' THEN 'The Debrief'
        WHEN ${TABLE}.brand='The Hits Official' THEN 'The Hits Official'
        WHEN ${TABLE}.brand='Trail magazine' THEN 'Trail Magazine'
        WHEN ${TABLE}.brand='vikingfmvideos' THEN 'vikingfmvideos'
        WHEN ${TABLE}.brand='Wave 105' THEN 'Wave 105'
        WHEN ${TABLE}.brand='YourHorseOnline' THEN 'YourHorseOnline'
        WHEN ${TABLE}.brand='zootoday' THEN 'zootoday'
        WHEN ${TABLE}.brand='Practical Photography magazine' THEN 'Practical Photography Magazine'
        WHEN ${TABLE}.brand='TV Choice' THEN 'TV Choice'
      END;;
  }

  measure: card_click_rate {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}.cardclickrate::float*100  ;;
  }

  measure: card_clicks {
    type: sum
    sql: ${TABLE}.cardclicks ;;
  }

  measure: card_impressions {
    type: sum
    sql: ${TABLE}.cardimpressions ;;
  }

  measure: card_teaser_clickrate {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}.cardteaserclickrate::float*100 ;;
  }

  measure: card_teaser_clicks {
    type: sum
    sql: ${TABLE}.cardteaserclicks ;;
  }

  measure: card_teaser_impressions {
    type: sum
    sql: ${TABLE}.cardteaserimpressions ;;
  }

  measure: comments {
    type: sum
    sql: ${TABLE}.comments ;;
  }

  measure: cpm {
    type: average
    value_format_name: gbp
    sql: ${TABLE}.cpm::float ;;
  }

#   dimension: day {
#     type: string
#     sql: ${TABLE}.day ;;
#   }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}.day,'YYYY-MM-DD') ;;
  }

  dimension_group: created {
    type: time
    label: "Created"
    timeframes: []
    convert_tz: no
    sql: TO_TIMESTAMP(${TABLE}.published_date,'YYYY/MM/DD HH24:MI:SS');;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  measure: dislikes {
    type: sum
    sql: ${TABLE}.dislikes ;;
  }

  measure: estimated_adrevenue {
    type: sum
    value_format_name: gbp
    sql: ${TABLE}.estimatedadrevenue::float ;;
  }

  measure: estimated_minutes_watched {
    label: "Est. Total Minutes Watched"
    type: sum
    sql: ${TABLE}.estimatedminuteswatched ;;
  }

  measure: estimated_red_partner_revenue {
    type: sum
    value_format_name: gbp
    sql: ${TABLE}.estimatedredpartnerrevenue::float ;;
  }

  measure: estimated_revenue {
    type: sum
    value_format_name: gbp
    sql: ${TABLE}.estimatedrevenue::float ;;
    drill_fields: [post_details*]
  }

  measure: gross_revenue {
    type: sum
    value_format_name: gbp
    sql: ${TABLE}.grossrevenue::float ;;
    drill_fields: [post_details*]
  }

  measure: likes {
    type: sum
    sql: ${TABLE}.likes ;;
    drill_fields: [post_details*]
  }

  dimension: link {
    label: "Link"
    hidden: no
    type: string
    sql: ${TABLE}.link ;;
    html: <a href="{{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>
      ;;
  }

  dimension: link_without_hyperlink {
    label: "URL"
    hidden: no
    type: string
    sql: ${TABLE}.link ;;

  }

  dimension: watch_url {
    label: "Absolute Video URL"
    hidden: no
    type: yesno
    description: "This means that the video was watched on YouTube from the video's specific page. It's the precise URL where you can watch the video on YouTube"
    sql: ${TABLE}.link LIKE '%watch?%';;
  }

  dimension: external_url {
    label: "External URL"
    hidden: no
    type: yesno
    sql: ${TABLE}.link NOT LIKE '%youtube%';;
  }

  dimension: channel_url {
    label: "Channel Page URL"
    hidden: no
    type: yesno
    sql: ${TABLE}.link LIKE '%1025Clyde1%' OR ${TABLE}.link LIKE '%967WestFM%' OR ${TABLE}.link LIKE '%96radioaire%' OR ${TABLE}.link LIKE '%974coolfm%' OR ${TABLE}.link LIKE '%ABSOLUTERADIO%' OR ${TABLE}.link LIKE '%askamum%' OR ${TABLE}.link LIKE '%BIKEmagazineUK%' OR ${TABLE}.link LIKE '%CARmagazineTV%' OR ${TABLE}.link LIKE '%CFMRadio%' OR ${TABLE}.link LIKE '%CityTalk105%' OR ${TABLE}.link LIKE '%CloserOnline%' OR ${TABLE}.link LIKE '%Empiremagazine%' OR ${TABLE}.link LIKE '%fhmweb%' OR ${TABLE}.link LIKE '%fleetnews%' OR ${TABLE}.link LIKE '%ForthOne973%' OR ${TABLE}.link LIKE '%GaryParkerWave%' OR ${TABLE}.link LIKE '%gem106official%' OR ${TABLE}.link LIKE '%GoFishingOnline%' OR ${TABLE}.link LIKE '%gothinkbig%' OR ${TABLE}.link LIKE '%Grazia%' OR ${TABLE}.link LIKE '%hallamfmradio%' OR ${TABLE}.link LIKE '%heatworld%' OR ${TABLE}.link LIKE '%HighStreetHoney%' OR ${TABLE}.link LIKE '%KerrangPodcast%' OR ${TABLE}.link LIKE '%Kerrangradio%' OR ${TABLE}.link LIKE '%Key103%' OR ${TABLE}.link LIKE '%KissFMUK%' OR ${TABLE}.link LIKE '%LandRoverOwner%' OR ${TABLE}.link LIKE '%magicfm1054%' OR ${TABLE}.link LIKE '%matchymovie%' OR ${TABLE}.link LIKE '%metroradiouk%' OR ${TABLE}.link LIKE '%MorayFirthRadio%' OR ${TABLE}.link LIKE '%motorcyclenewsdotcom%' OR ${TABLE}.link LIKE '%Nsound1%' OR ${TABLE}.link LIKE '%ParkersTV%' OR ${TABLE}.link LIKE '%PlanetRockRadio%' OR ${TABLE}.link LIKE '%PracticalClassics%' OR ${TABLE}.link LIKE '%practicalfishkeeping%' OR ${TABLE}.link LIKE '%Q4music%' OR ${TABLE}.link LIKE '%radiocity967%' OR ${TABLE}.link LIKE '%RAILmagazineOnline%' OR ${TABLE}.link LIKE '%rockfm974%' OR ${TABLE}.link LIKE '%tfmradio%' OR ${TABLE}.link LIKE '%TheDebriefUK%' OR ${TABLE}.link LIKE '%thehitsradioonline%' OR ${TABLE}.link LIKE '%todaysgolfer%' OR ${TABLE}.link LIKE '%trailmagazine%' OR ${TABLE}.link LIKE '%vikingfmvideos%' OR ${TABLE}.link LIKE '%Wave105radio%' OR ${TABLE}.link LIKE '%YourHorseOnline%' OR ${TABLE}.link LIKE '%zootoday%';;
  }



  measure: monetized_playbacks {
    type: sum
    sql: ${TABLE}.monetizedplaybacks ;;
  }

  measure: playback_based_cpm {
    type: average
    value_format_name: gbp
    sql: ${TABLE}.playbackbasedcpm::float ;;
  }

  measure: shares {
    type: sum
    sql: ${TABLE}.shares ;;
    drill_fields: [post_details*]
  }

  measure: subscribers_gained {
    type: sum
    sql: ${TABLE}.subscribersgained ;;
  }

  measure: subscribers_lost {
    type: sum
    sql: ${TABLE}.subscriberslost ;;
  }

  dimension: image_filewow {
    hidden: yes
    sql: ${TABLE}.thumbnail ;;
  }

  dimension: image_filelike2 {
    label: "Thumbnail"
    hidden: no
    sql: ${image_filewow} ;;
    html: <img src="{{ value }}" width="40" 0height="40"/>;;
  }


  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: video_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.video_id ;;
  }

  measure: videos_added_to_playlists {
    type: sum
    sql: ${TABLE}.videosaddedtoplaylists ;;
  }

  measure: videos_removed_from_playlists {
    type: sum
    sql: ${TABLE}.videosremovedfromplaylists ;;
  }

  measure: views {
    type: sum
    sql: ${TABLE}.views ;;
    drill_fields: [post_details*]
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [post_details*]
  }

  dimension: chart_date {
    sql:  TO_CHAR(${date_date},'MON YYYY') ;;
    #sql: CONCAT(EXTRACT(month, ${date_month}), ' ', EXTRACT(year, ${date_year})) ;;
  }

  set: post_details {
    fields: [
      brand,
      title,
      link,
      image_filelike2,
      views,
      shares,
      comments,
      average_view_duration,
      average_view_percentage,
      subscribers_gained,
      ad_impressions,
      gross_revenue
      ]
    }

    dimension: 30_day_buckets  {
      type: number
      hidden: no
      label: "30 day YT Buckets"
      description: "1 = Past 30 Days, 2 = Past 31 - 60 Days, 0 = Everything Else"
      sql:  CASE
                WHEN datediff(day, cast(${TABLE}.day as DATE), (current_date - 3)) BETWEEN 0 AND 29 THEN 1
                WHEN datediff(day, cast(${TABLE}.day as DATE), (current_date - 3)) BETWEEN 30 AND 59 THEN 2
              ELSE 0
            END ;;
    }

  }
