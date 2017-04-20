view: adx {
  sql_table_name: ad_platform.adx ;;

  measure: ad_requests {
    type: sum
    sql: ${TABLE}.ad_requests ;;
  }

  dimension: ad_tag_name {
    type: string
    sql: ${TABLE}.ad_tag_name ;;
  }

  dimension: ad_unit_size_name {
    type: string
    sql: ${TABLE}.ad_unit_size_name ;;
  }

  dimension: advertiser_name {
    type: string
    sql: ${TABLE}.advertiser_name ;;
  }

  dimension: buyer_network_name {
    type: string
    sql: ${TABLE}.buyer_network_name ;;
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD') ;;
  }

  dimension: domain_name {
    type: string
    sql: ${TABLE}.domain_name ;;
  }

  dimension: dsp_name {
    type: string
    sql: ${TABLE}.dsp_name ;;
  }

  measure: earnings_gbp {
    label: "Earnings (GBP)"
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}."earnings..gbp."::float ;;
  }

  measure: individual_ad_impressions {
    type: sum
    sql: ${TABLE}.individual_ad_impressions ;;
  }

  measure: matched_ad_requests {
    type: sum
    sql: ${TABLE}.matched_ad_requests ;;
  }

  dimension: platform_type_name {
    type: string
    sql: ${TABLE}.platform_type_name ;;
  }

  dimension: rownum {
    hidden: yes
    type: string
    sql: ${TABLE}.rownum ;;
  }

  dimension: transaction_type_name {
    type: string
    sql: ${TABLE}.transaction_type_name ;;
  }

  dimension: url_channel_name {
    type: string
    sql: ${TABLE}.url_channel_name ;;
  }

  dimension: video_ad_format {
    type: string
    sql: ${TABLE}.video_ad_format ;;
  }

  dimension: video_ad_duration {
    type: string
    sql: ${TABLE}.video_ad_duration ;;
  }

  measure: video_ad_abandonment {
    type: average
    value_format: "0.00\%"
    description: "% of users that abandoned the video ad"
    sql: CASE
          WHEN ${TABLE}.video_ad_abandonment_ratio = 'NA' THEN '0'
          ELSE ${TABLE}.video_ad_abandonment_ratio::float*100
         END;;
  }

  measure: cost_per_click {
    label: "Cost Per Click (GBP)"
    description: "Revenue per click - revenueclicks"
    type: average
    value_format: "\£0.0000"
    sql: CASE
          WHEN ${TABLE}."cost_per_click..gbp." = 'NA' THEN '0'
          ELSE ${TABLE}."cost_per_click..gbp."::float
         END;;
  }

  dimension: Brand_Name {
    hidden: no
    label: "Brand Name"
    type: string
    sql: CASE
          WHEN ${TABLE}.url_channel_name LIKE '%kiss%' THEN 'Kiss'
          WHEN ${TABLE}.url_channel_name LIKE '%hits%' THEN 'The Hits'
          WHEN ${TABLE}.url_channel_name LIKE '%kerrang%' THEN 'Kerrang'
          WHEN ${TABLE}.url_channel_name LIKE '%magic%' THEN 'Magic'
          WHEN ${TABLE}.url_channel_name LIKE '%absolute-80s%' THEN 'Absolute Radio'
          WHEN ${TABLE}.url_channel_name LIKE '%absolute-classic-rock%' THEN 'Absolute Radio'
          WHEN ${TABLE}.url_channel_name LIKE '%absolute-radio-00s%' THEN 'Absolute Radio'
          WHEN ${TABLE}.url_channel_name LIKE '%absolute-radio-60s%' THEN 'Absolute Radio'
          WHEN ${TABLE}.url_channel_name LIKE '%absolute-radio-70s%' THEN 'Absolute Radio'
          WHEN ${TABLE}.url_channel_name LIKE '%absolute-radio-90s%' THEN 'Absolute Radio'
          WHEN ${TABLE}.url_channel_name LIKE '%absolute-radio%' THEN 'Absolute Radio'
          WHEN ${TABLE}.url_channel_name LIKE '%absolute%' THEN 'Absolute Radio'
          WHEN ${TABLE}.url_channel_name LIKE '%absoluteradio%' THEN 'Absolute Radio'
          WHEN ${TABLE}.url_channel_name LIKE '%aire-2%' THEN 'Aire'
          WHEN ${TABLE}.url_channel_name LIKE '%aire2%' THEN 'Aire'
          WHEN ${TABLE}.url_channel_name LIKE '%aire-3%' THEN 'Aire'
          WHEN ${TABLE}.url_channel_name LIKE '%aire3%' THEN 'Aire'
          WHEN ${TABLE}.url_channel_name LIKE '%aire%' THEN 'Aire'
          WHEN ${TABLE}.url_channel_name LIKE '%borders%' THEN 'Borders'
          WHEN ${TABLE}.url_channel_name LIKE '%cfm%' THEN 'CFM'
          WHEN ${TABLE}.url_channel_name LIKE '%city-2%' THEN 'City'
          WHEN ${TABLE}.url_channel_name LIKE '%city-3%' THEN 'City'
          WHEN ${TABLE}.url_channel_name LIKE '%city2%' THEN 'City'
          WHEN ${TABLE}.url_channel_name LIKE '%city3%' THEN 'City'
          WHEN ${TABLE}.url_channel_name LIKE '%city-talk%' THEN 'City'
          WHEN ${TABLE}.url_channel_name LIKE '%city%' THEN 'City'
          WHEN ${TABLE}.url_channel_name LIKE '%clyde-1%' THEN 'Clyde'
          WHEN ${TABLE}.url_channel_name LIKE '%clyde1%' THEN 'Clyde'
          WHEN ${TABLE}.url_channel_name LIKE '%citytalk%' THEN 'City'
          WHEN ${TABLE}.url_channel_name LIKE '%clyde-2%' THEN 'Clyde'
          WHEN ${TABLE}.url_channel_name LIKE '%clyde2%' THEN 'Clyde'
          WHEN ${TABLE}.url_channel_name LIKE '%clyde-3%' THEN 'Clyde'
          WHEN ${TABLE}.url_channel_name LIKE '%clyde3%' THEN 'Clyde'
          WHEN ${TABLE}.url_channel_name LIKE '%clyde%' THEN 'Clyde'
          WHEN ${TABLE}.url_channel_name LIKE '%cool-fm%' THEN 'Cool FM'
          WHEN ${TABLE}.url_channel_name LIKE '%coolfm%' THEN 'Cool FM'
          WHEN ${TABLE}.url_channel_name LIKE '%downtown%' THEN 'Downtown'
          WHEN ${TABLE}.url_channel_name LIKE '%downtown-country%' THEN 'Downtown'
          WHEN ${TABLE}.url_channel_name LIKE '%forth-2%' THEN 'Forth'
          WHEN ${TABLE}.url_channel_name LIKE '%forth2%' THEN 'Forth'
          WHEN ${TABLE}.url_channel_name LIKE '%forth-1%' THEN 'Forth'
          WHEN ${TABLE}.url_channel_name LIKE '%forth1%' THEN 'Forth'
          WHEN ${TABLE}.url_channel_name LIKE '%forth-3%' THEN 'Forth'
          WHEN ${TABLE}.url_channel_name LIKE '%forth%' THEN 'Forth'
          WHEN ${TABLE}.url_channel_name LIKE '%forth3%' THEN 'Forth'
          WHEN ${TABLE}.url_channel_name LIKE '%free-radio%' THEN 'Free'
          WHEN ${TABLE}.url_channel_name LIKE '%free%' THEN 'Free'
          WHEN ${TABLE}.url_channel_name LIKE '%free-80%' THEN 'Free'
          WHEN ${TABLE}.url_channel_name LIKE '%free-80s%' THEN 'Free'
          WHEN ${TABLE}.url_channel_name LIKE '%free-coventry%' THEN 'Free'
          WHEN ${TABLE}.url_channel_name LIKE '%free-cov%' THEN 'Free'
          WHEN ${TABLE}.url_channel_name LIKE '%freeradio%' THEN 'Free'
          WHEN ${TABLE}.url_channel_name LIKE '%gem-106%' THEN 'Gem'
          WHEN ${TABLE}.url_channel_name LIKE '%gem106%' THEN 'Gem'
          WHEN ${TABLE}.url_channel_name LIKE '%gem%' THEN 'Gem'
          WHEN ${TABLE}.url_channel_name LIKE '%hallam-2%' THEN 'Hallam'
          WHEN ${TABLE}.url_channel_name LIKE '%hallam2%' THEN 'Hallam'
          WHEN ${TABLE}.url_channel_name LIKE '%hallam-3%' THEN 'Hallam'
          WHEN ${TABLE}.url_channel_name LIKE '%hallam3%' THEN 'Hallam'
          WHEN ${TABLE}.url_channel_name LIKE '%hallam-fm%' THEN 'Hallam'
          WHEN ${TABLE}.url_channel_name LIKE '%hallam%' THEN 'Hallam'
          WHEN ${TABLE}.url_channel_name LIKE '%hallamfm%' THEN 'Hallam'
          WHEN ${TABLE}.url_channel_name LIKE '%planetradio.co.uk/heat%' THEN 'Heat Radio'
          WHEN ${TABLE}.url_channel_name LIKE '%key-2%' THEN 'Key'
          WHEN ${TABLE}.url_channel_name LIKE '%key2%' THEN 'Key'
          WHEN ${TABLE}.url_channel_name LIKE '%key-3%' THEN 'Key'
          WHEN ${TABLE}.url_channel_name LIKE '%key3%' THEN 'Key'
          WHEN ${TABLE}.url_channel_name LIKE '%key-103%' THEN 'Key'
          WHEN ${TABLE}.url_channel_name LIKE '%key%' THEN 'Key'
          WHEN ${TABLE}.url_channel_name LIKE '%key103%' THEN 'Key'
          WHEN ${TABLE}.url_channel_name LIKE '%kiss-fresh%' THEN 'Kiss'
          WHEN ${TABLE}.url_channel_name LIKE '%kisstory%' THEN 'Kiss'
          WHEN ${TABLE}.url_channel_name LIKE '%magic-chilled%' THEN 'Magic'
          WHEN ${TABLE}.url_channel_name LIKE '%mellow-magic%' THEN 'Magic'
          WHEN ${TABLE}.url_channel_name LIKE '%magic-mellow%' THEN 'Magic'
          WHEN ${TABLE}.url_channel_name LIKE '%magic-soul%' THEN 'Magic'
          WHEN ${TABLE}.url_channel_name LIKE '%metro-2%' THEN 'Metro'
          WHEN ${TABLE}.url_channel_name LIKE '%metro%' THEN 'Metro'
          WHEN ${TABLE}.url_channel_name LIKE '%metro-3%' THEN 'Metro'
          WHEN ${TABLE}.url_channel_name LIKE '%mfr-2%' THEN 'MFR'
          WHEN ${TABLE}.url_channel_name LIKE '%mfr-3%' THEN 'MFR'
          WHEN ${TABLE}.url_channel_name LIKE '%mfr%' THEN 'MFR'
          WHEN ${TABLE}.url_channel_name LIKE '%northsound-1%' THEN 'Northsound'
          WHEN ${TABLE}.url_channel_name LIKE '%northsound-2%' THEN 'Northsound'
          WHEN ${TABLE}.url_channel_name LIKE '%northsound%' THEN 'Northsound'
          WHEN ${TABLE}.url_channel_name LIKE '%planet-rock%' THEN 'Planet Rock'
          WHEN ${TABLE}.url_channel_name LIKE '%tfm%' THEN 'TFM'
          WHEN ${TABLE}.url_channel_name LIKE '%tfm-3%' THEN 'TFM'
          WHEN ${TABLE}.url_channel_name LIKE '%rock-fm%' THEN 'Rock FM'
          WHEN ${TABLE}.url_channel_name LIKE '%rockfm' THEN 'Rock FM'
          WHEN ${TABLE}.url_channel_name LIKE '%west%' THEN 'West FM'
          WHEN ${TABLE}.url_channel_name LIKE '%wave-105%' THEN 'Wave'
          WHEN ${TABLE}.url_channel_name LIKE '%wave%' THEN 'Wave'
          WHEN ${TABLE}.url_channel_name LIKE '%wave105%' THEN 'Wave'
          WHEN ${TABLE}.url_channel_name LIKE '%viking%' THEN 'Viking'
          WHEN ${TABLE}.url_channel_name LIKE '%viking-3%' THEN 'Viking'
          WHEN ${TABLE}.url_channel_name LIKE '%viking-2%' THEN 'Viking'
          WHEN ${TABLE}.url_channel_name LIKE '%tay%' THEN 'Tay FM'
          WHEN ${TABLE}.url_channel_name LIKE '%tay-2%' THEN 'Tay FM'
          WHEN ${TABLE}.url_channel_name LIKE '%westsound%' THEN 'Westsound'
          WHEN ${TABLE}.url_channel_name LIKE '%westsound-fm%' THEN 'Westsound'
          WHEN ${TABLE}.url_channel_name LIKE '%tfm-2%' THEN 'TFM'
          WHEN ${TABLE}.url_channel_name LIKE '%rock%' THEN 'Rock FM'
          WHEN ${TABLE}.url_channel_name LIKE '%tay-3%' THEN 'Tay FM'
          WHEN ${TABLE}.url_channel_name LIKE '%radioborders%' THEN 'Borders'
          WHEN ${TABLE}.url_channel_name LIKE '%free80s%' THEN 'Free'
          WHEN ${TABLE}.url_channel_name LIKE '%rock-fm-2%' THEN 'Rock FM'
          WHEN ${TABLE}.url_channel_name LIKE '%rock-fm-3%' THEN 'Rock FM'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.magic%' THEN 'Magic'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.planetrock%' THEN 'Planet Rock'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.coolfm%' THEN 'Cool FM'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.kerrangradio%' THEN 'Kerrang'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.forth1%' THEN 'Forth'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.wave105%' THEN 'Wave'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.mellowmagic%' THEN 'Magic'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.key103%' THEN 'Key'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.radiocity%' THEN 'City'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.magicchilled%' THEN 'Magic Chilled'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.metroradio%' THEN 'Metro'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.metro3radio%' THEN 'Metro'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.rockfm%' THEN 'Rock FM'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.heatworld%' THEN 'Heat Radio'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.hallamfm%' THEN 'Hallam'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.hallam3%' THEN 'Hallam'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.thehitsradio%' THEN 'The Hits'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.kissfmuk%' THEN 'Kiss'
          WHEN ${TABLE}.url_channel_name LIKE '%kisstory.kissfmuk%' THEN 'Kiss'
          WHEN ${TABLE}.url_channel_name LIKE '%kissfresh.kissfmuk%' THEN 'Kiss'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.northsound1%' THEN 'Northsound'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.downtown%' THEN 'Downtown'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.tayfm%' THEN 'Tay FM'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.mfr%' THEN 'MFR'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.westfm%' THEN 'West FM'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.vikingfm%' THEN 'Viking'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.cfmradio%' THEN 'CFM'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.tfmradio%' THEN 'TFM'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.downtowncountry%' THEN 'Downtown'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.radioborders%' THEN 'Borders'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.westsound%' THEN 'Westsound'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.tay2%' THEN 'Tay FM'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.hallam2%' THEN 'Hallam'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.radioaire2%' THEN 'Aire'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.northsound2%' THEN 'Northsound'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.key2radio%' THEN 'Key'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.viking2%' THEN 'Viking'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.metro2radio%' THEN 'Metro'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.tfm2%' THEN 'TFM'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.forth3%' THEN 'Forth'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.tay3%' THEN 'Tay FM'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.key3radio%' THEN 'Key'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.viking3%' THEN 'Viking'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.radioaire3%' THEN 'Aire'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.tfm3%' THEN 'TFM'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.clyde1%' THEN 'Clyde'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.clyde2%' THEN 'Clyde'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer.clyde3%' THEN 'Clyde'
          WHEN ${TABLE}.url_channel_name LIKE '%lifestyle.one/heat%' THEN 'Heat'
          WHEN ${TABLE}.url_channel_name LIKE '%lifestyle.one/closer%' THEN 'Closer'
          WHEN ${TABLE}.url_channel_name LIKE '%lifestyle.one/grazia%' THEN 'Grazia'
          WHEN ${TABLE}.url_channel_name LIKE '%parkers.co.uk%' THEN 'Parkers'
          WHEN ${TABLE}.url_channel_name LIKE '%motorcyclenews.com%' THEN 'Motorcyclenews'
          WHEN ${TABLE}.url_channel_name LIKE '%empireonline.com%' THEN 'Empire'
          WHEN ${TABLE}.url_channel_name LIKE '%motherandbaby.co.uk%' THEN 'Mother & Baby'
          WHEN ${TABLE}.url_channel_name LIKE '%carmagazine.co.uk%' THEN 'Car Magazine'
          WHEN ${TABLE}.url_channel_name LIKE '%classiccarsforsale.co.uk%' THEN 'Classic Cars for Sale'
          WHEN ${TABLE}.url_channel_name LIKE '%thedebrief.co.uk%' THEN 'The Debrief'
          WHEN ${TABLE}.url_channel_name LIKE '%todaysgolfer.co.uk%' THEN 'Todays Golfer'
          WHEN ${TABLE}.url_channel_name LIKE '%freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.url_channel_name LIKE '%gem106.orionplayer.co.uk' THEN 'Gem'
          WHEN ${TABLE}.url_channel_name LIKE '%planetradio.co.uk%' THEN 'Planet Radio'
          WHEN ${TABLE}.url_channel_name LIKE '%lifestyle.one%' THEN 'Todays Golfer'
          WHEN ${TABLE}.url_channel_name LIKE '%birmingham.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.url_channel_name LIKE '%coventry.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.url_channel_name LIKE '%blackcountry.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.url_channel_name LIKE '%shropshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.url_channel_name LIKE '%worcestershire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.url_channel_name LIKE '%80s.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.url_channel_name LIKE '%warwickshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.url_channel_name LIKE '%herefordshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.url_channel_name LIKE '%staffordshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplay.no%' THEN 'RadioPlay General'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplay.de%' THEN 'RadioPlay General'
          WHEN ${TABLE}.url_channel_name LIKE '%foodtolovemagazine%' THEN 'Food To Love'
          WHEN ${TABLE}.url_channel_name LIKE '%fateandfortunemagazine%' THEN 'Fate and Fortune'
          WHEN ${TABLE}.url_channel_name LIKE '%spiritanddestiny%' THEN 'Spirit and Destiny'
          WHEN ${TABLE}.url_channel_name LIKE '%am-online%' THEN 'AM Online'
          WHEN ${TABLE}.url_channel_name LIKE '%anglingtimes%' THEN 'Angling Times'
          WHEN ${TABLE}.url_channel_name LIKE '%bikemagazine%' THEN 'Bike Magazine'
          WHEN ${TABLE}.url_channel_name LIKE '%birdwatching%' THEN 'Bird Watching'
          WHEN ${TABLE}.url_channel_name LIKE '%yours%' THEN 'Yours'
          WHEN ${TABLE}.url_channel_name LIKE '%yourhorse%' THEN 'Your Horse'
          WHEN ${TABLE}.url_channel_name LIKE '%trailrunningmag%' THEN 'Trail Running'
          WHEN ${TABLE}.url_channel_name LIKE '%topsante%' THEN 'Top Sante'
          WHEN ${TABLE}.url_channel_name LIKE '%steamrailway%' THEN 'Steam Railway'
          WHEN ${TABLE}.url_channel_name LIKE '%ride%' THEN 'Ride'
          WHEN ${TABLE}.url_channel_name LIKE '%railmagazine%' THEN 'Rail Magazine'
          WHEN ${TABLE}.url_channel_name LIKE '%practicalsportsbikesmag%' THEN 'Practical Sports Bikes'
          WHEN ${TABLE}.url_channel_name LIKE '%practicalphotography%' THEN 'Practical Photography'
          WHEN ${TABLE}.url_channel_name LIKE '%practicalfishkeeping%' THEN 'Practical Fishkeeping'
          WHEN ${TABLE}.url_channel_name LIKE '%practicalclassics%' THEN 'Practical Classics'
          WHEN ${TABLE}.url_channel_name LIKE '%petproductmarketing%' THEN 'Pet Product Marketing'
          WHEN ${TABLE}.url_channel_name LIKE '%performancebikes%' THEN 'Performance Bikes'
          WHEN ${TABLE}.url_channel_name LIKE '%moderngardensmagazine%' THEN 'Modern Gardens'
          WHEN ${TABLE}.url_channel_name LIKE '%model-rail%' THEN 'Model Rail'
          WHEN ${TABLE}.url_channel_name LIKE '%mcnsport%' THEN 'MCN Sports'
          WHEN ${TABLE}.url_channel_name LIKE '%lro.com%' THEN 'Landrover Owner'
          WHEN ${TABLE}.url_channel_name LIKE '%landscapemagazine%' THEN 'Landscape'
          WHEN ${TABLE}.url_channel_name LIKE '%horsedeals%' THEN 'Horse Deals'
          WHEN ${TABLE}.url_channel_name LIKE '%gofishing%' THEN 'Go Fishing'
          WHEN ${TABLE}.url_channel_name LIKE '%gardennewsmagazine%' THEN 'Garden News'
          WHEN ${TABLE}.url_channel_name LIKE '%gardenanswersmagazine%' THEN 'Garden Answers'
          WHEN ${TABLE}.url_channel_name LIKE '%fleetnews%' THEN 'Fleetnews'
          WHEN ${TABLE}.url_channel_name LIKE '%commercialfleet%' THEN 'Commercial Fleet'
          WHEN ${TABLE}.url_channel_name LIKE '%classiccarweekly%' THEN 'Classic Car Weekly'
          WHEN ${TABLE}.url_channel_name LIKE '%classiccarsmagazine%' THEN 'Classic Cars'
          WHEN ${TABLE}.url_channel_name LIKE '%classicbike%' THEN 'Classic Bikes'
          WHEN ${TABLE}.url_channel_name LIKE '%carmechanicsmag%' THEN 'Car Mechanics'
          ELSE ${TABLE}.url_channel_name
        END
         ;;
  }

  dimension: Brand_Platform {
    hidden: no
    label: "Radioplayer/Website"
    type: string
    sql: CASE
          WHEN ${TABLE}.url_channel_name LIKE '%kisstory.kissfmuk%' THEN 'Radioplayer'
          WHEN ${TABLE}.url_channel_name LIKE '%kissfresh.kissfmuk%' THEN 'Radioplayer'
          WHEN ${TABLE}.url_channel_name LIKE '%radioplayer%' THEN 'Radioplayer'
          WHEN ${TABLE}.url_channel_name LIKE '%/player/' THEN 'Radioplayer'
          ELSE 'Website'
        END
         ;;
  }


  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      domain_name,
      ad_tag_name,
      ad_unit_size_name,
      advertiser_name,
      buyer_network_name,
      country_name,
      dsp_name,
      platform_type_name,
      transaction_type_name,
      url_channel_name
    ]
  }
}
