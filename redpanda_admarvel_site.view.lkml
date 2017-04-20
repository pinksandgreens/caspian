view: admarvel_site {
  sql_table_name: ad_platform.admarvel_site ;;

  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
  }

  measure: ctr {
    type: average
    value_format: "0.0000"
    sql: ${TABLE}.ctr::float ;;
  }

  dimension_group: date {
    label: ""
    type: time
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}.date,'MM-DD-YYYY') ;;
  }

  measure: ecpm {
    type: average
    value_format: "0.0000"
    sql: ${TABLE}.ecpm::float ;;
  }

  measure: fill_rate {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}."fill.rate"::float ;;
  }

  measure: impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
  }

  dimension: publisher_id {
    type: string
    sql: ${TABLE}."publisher.id" ;;
  }

  dimension: publisher_name {
    type: string
    sql: ${TABLE}."publisher.name" ;;
  }

  measure: requests {
    type: sum
    sql: ${TABLE}.requests ;;
  }

  measure: revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.revenue::float ;;
  }

  dimension: rownum {
    hidden: yes
    type: string
    sql: ${TABLE}.rownum ;;
  }

  dimension: site_id {
    type: string
    sql: ${TABLE}."site.id" ;;
  }

  dimension: site_name {
    label: "Site Name - Full"
    type: string
    sql: ${TABLE}."site.name" ;;
  }

  dimension: market {
    type: string
    sql: SPLIT_PART(${TABLE}."site.name", '-', 1) ;;
  }

  dimension: brand {
    type: string
    sql: SPLIT_PART(${TABLE}."site.name", '-', 2) ;;
  }


  dimension: Brand_Name {
    hidden: no
    label: "Brand Name"
    type: string
    sql: CASE
          WHEN LOWER(${brand}) LIKE '%kiss%' THEN 'Kiss'
          WHEN LOWER(${brand}) LIKE '%hits%' THEN 'The Hits'
          WHEN LOWER(${brand}) LIKE '%kerrang!%' THEN 'Kerrang Magazine'
          WHEN LOWER(${brand}) LIKE '%magic%' THEN 'Magic'
          WHEN LOWER(${brand}) LIKE '%absolute-80s%' THEN 'Absolute Radio'
          WHEN LOWER(${brand}) LIKE '%absolute-classic-rock%' THEN 'Absolute Radio'
          WHEN LOWER(${brand}) LIKE '%absolute-radio-00s%' THEN 'Absolute Radio'
          WHEN LOWER(${brand}) LIKE '%absolute-radio-60s%' THEN 'Absolute Radio'
          WHEN LOWER(${brand}) LIKE '%absolute-radio-70s%' THEN 'Absolute Radio'
          WHEN LOWER(${brand}) LIKE '%absolute-radio-90s%' THEN 'Absolute Radio'
          WHEN LOWER(${brand}) LIKE '%absolute-radio%' THEN 'Absolute Radio'
          WHEN LOWER(${brand}) LIKE '%absolute%' THEN 'Absolute Radio'
          WHEN LOWER(${brand}) LIKE '%absoluteradio%' THEN 'Absolute Radio'
          WHEN LOWER(${brand}) LIKE '%aire-2%' THEN 'Aire'
          WHEN LOWER(${brand}) LIKE '%aire2%' THEN 'Aire'
          WHEN LOWER(${brand}) LIKE '%aire-3%' THEN 'Aire'
          WHEN LOWER(${brand}) LIKE '%aire3%' THEN 'Aire'
          WHEN LOWER(${brand}) LIKE '%aire%' THEN 'Aire'
          WHEN LOWER(${brand}) LIKE '%borders%' THEN 'Borders'
          WHEN LOWER(${brand}) LIKE '%cfm%' THEN 'CFM'
          WHEN LOWER(${brand}) LIKE '%city-2%' THEN 'City'
          WHEN LOWER(${brand}) LIKE '%city-3%' THEN 'City'
          WHEN LOWER(${brand}) LIKE '%city2%' THEN 'City'
          WHEN LOWER(${brand}) LIKE '%city3%' THEN 'City'
          WHEN LOWER(${brand}) LIKE '%city-talk%' THEN 'City'
          WHEN LOWER(${brand}) LIKE '%city%' THEN 'City'
          WHEN LOWER(${brand}) LIKE '%clyde-1%' THEN 'Clyde'
          WHEN LOWER(${brand}) LIKE '%clyde1%' THEN 'Clyde'
          WHEN LOWER(${brand}) LIKE '%citytalk%' THEN 'City'
          WHEN LOWER(${brand}) LIKE '%clyde-2%' THEN 'Clyde'
          WHEN LOWER(${brand}) LIKE '%clyde2%' THEN 'Clyde'
          WHEN LOWER(${brand}) LIKE '%clyde-3%' THEN 'Clyde'
          WHEN LOWER(${brand}) LIKE '%clyde3%' THEN 'Clyde'
          WHEN LOWER(${brand}) LIKE '%clyde%' THEN 'Clyde'
          WHEN LOWER(${brand}) LIKE '%cool fm%' THEN 'Cool FM'
          WHEN LOWER(${brand}) LIKE '%coolfm%' THEN 'Cool FM'
          WHEN LOWER(${brand}) LIKE '%downtown%' THEN 'Downtown'
          WHEN LOWER(${brand}) LIKE '%downtown-country%' THEN 'Downtown'
          WHEN LOWER(${brand}) LIKE '%forth-2%' THEN 'Forth'
          WHEN LOWER(${brand}) LIKE '%forth2%' THEN 'Forth'
          WHEN LOWER(${brand}) LIKE '%forth-1%' THEN 'Forth'
          WHEN LOWER(${brand}) LIKE '%forth1%' THEN 'Forth'
          WHEN LOWER(${brand}) LIKE '%forth-3%' THEN 'Forth'
          WHEN LOWER(${brand}) LIKE '%forth%' THEN 'Forth'
          WHEN LOWER(${brand}) LIKE '%forth3%' THEN 'Forth'
          WHEN LOWER(${brand}) LIKE '%free-radio%' THEN 'Free'
          WHEN LOWER(${brand}) LIKE '%free%' THEN 'Free'
          WHEN LOWER(${brand}) LIKE '%free-80%' THEN 'Free'
          WHEN LOWER(${brand}) LIKE '%free-80s%' THEN 'Free'
          WHEN LOWER(${brand}) LIKE '%free-coventry%' THEN 'Free'
          WHEN LOWER(${brand}) LIKE '%free-cov%' THEN 'Free'
          WHEN LOWER(${brand}) LIKE '%freeradio%' THEN 'Free'
          WHEN LOWER(${brand}) LIKE '%gem-106%' THEN 'Gem'
          WHEN LOWER(${brand}) LIKE '%gem106%' THEN 'Gem'
          WHEN LOWER(${brand}) LIKE '%gem%' THEN 'Gem'
          WHEN LOWER(${brand}) LIKE '%hallam-2%' THEN 'Hallam'
          WHEN LOWER(${brand}) LIKE '%hallam2%' THEN 'Hallam'
          WHEN LOWER(${brand}) LIKE '%hallam-3%' THEN 'Hallam'
          WHEN LOWER(${brand}) LIKE '%hallam3%' THEN 'Hallam'
          WHEN LOWER(${brand}) LIKE '%hallam-fm%' THEN 'Hallam'
          WHEN LOWER(${brand}) LIKE '%hallam%' THEN 'Hallam'
          WHEN LOWER(${brand}) LIKE '%hallamfm%' THEN 'Hallam'
          WHEN LOWER(${brand}) LIKE '%heat%' THEN 'Heat'
          WHEN LOWER(${brand}) LIKE '%key-2%' THEN 'Key'
          WHEN LOWER(${brand}) LIKE '%key2%' THEN 'Key'
          WHEN LOWER(${brand}) LIKE '%key-3%' THEN 'Key'
          WHEN LOWER(${brand}) LIKE '%key3%' THEN 'Key'
          WHEN LOWER(${brand}) LIKE '%key-103%' THEN 'Key'
          WHEN LOWER(${brand}) LIKE '%key%' THEN 'Key'
          WHEN LOWER(${brand}) LIKE '%key103%' THEN 'Key'
          WHEN LOWER(${brand}) LIKE '%kiss-fresh%' THEN 'Kiss'
          WHEN LOWER(${brand}) LIKE '%kisstory%' THEN 'Kiss'
          WHEN LOWER(${brand}) LIKE '%magic-chilled%' THEN 'Magic'
          WHEN LOWER(${brand}) LIKE '%mellow-magic%' THEN 'Magic'
          WHEN LOWER(${brand}) LIKE '%magic-mellow%' THEN 'Magic'
          WHEN LOWER(${brand}) LIKE '%magic-soul%' THEN 'Magic'
          WHEN LOWER(${brand}) LIKE '%metro-2%' THEN 'Metro'
          WHEN LOWER(${brand}) LIKE '%metro%' THEN 'Metro'
          WHEN LOWER(${brand}) LIKE '%metro-3%' THEN 'Metro'
          WHEN LOWER(${brand}) LIKE '%mfr-2%' THEN 'MFR'
          WHEN LOWER(${brand}) LIKE '%mfr-3%' THEN 'MFR'
          WHEN LOWER(${brand}) LIKE '%mfr%' THEN 'MFR'
          WHEN LOWER(${brand}) LIKE '%northsound-1%' THEN 'Northsound'
          WHEN LOWER(${brand}) LIKE '%northsound-2%' THEN 'Northsound'
          WHEN LOWER(${brand}) LIKE '%northsound%' THEN 'Northsound'
          WHEN LOWER(${brand}) LIKE '%planet rock%' THEN 'Planet Rock'
          WHEN LOWER(${brand}) LIKE '%tfm%' THEN 'TFM'
          WHEN LOWER(${brand}) LIKE '%tfm-3%' THEN 'TFM'
          WHEN LOWER(${brand}) LIKE '%rock fm%' THEN 'Rock FM'
          WHEN LOWER(${brand}) LIKE '%rockfm' THEN 'Rock FM'
          WHEN LOWER(${brand}) LIKE '%west%' THEN 'West FM'
          WHEN LOWER(${brand}) LIKE '%wave-105%' THEN 'Wave'
          WHEN LOWER(${brand}) LIKE '%wave%' THEN 'Wave'
          WHEN LOWER(${brand}) LIKE '%wave105%' THEN 'Wave'
          WHEN LOWER(${brand}) LIKE '%viking%' THEN 'Viking'
          WHEN LOWER(${brand}) LIKE '%viking-3%' THEN 'Viking'
          WHEN LOWER(${brand}) LIKE '%viking-2%' THEN 'Viking'
          WHEN LOWER(${brand}) LIKE '%tay%' THEN 'Tay FM'
          WHEN LOWER(${brand}) LIKE '%tay-2%' THEN 'Tay FM'
          WHEN LOWER(${brand}) LIKE '%west sound%' THEN 'Westsound'
          WHEN LOWER(${brand}) LIKE '%westsound-fm%' THEN 'Westsound'
          WHEN LOWER(${brand}) LIKE '%tfm-2%' THEN 'TFM'
          WHEN LOWER(${brand}) LIKE '%rock%' THEN 'Rock FM'
          WHEN LOWER(${brand}) LIKE '%tay-3%' THEN 'Tay FM'
          WHEN LOWER(${brand}) LIKE '%radioborders%' THEN 'Borders'
          WHEN LOWER(${brand}) LIKE '%free80s%' THEN 'Free'
          WHEN LOWER(${brand}) LIKE '%rock-fm-2%' THEN 'Rock FM'
          WHEN LOWER(${brand}) LIKE '%rock-fm-3%' THEN 'Rock FM'
          WHEN LOWER(${brand}) LIKE '%radioplayer.magic%' THEN 'Magic'
          WHEN LOWER(${brand}) LIKE '%radioplayer.planetrock%' THEN 'Planet Rock'
          WHEN LOWER(${brand}) LIKE '%radioplayer.coolfm%' THEN 'Cool FM'
          WHEN LOWER(${brand}) LIKE '%kerrang radio%' THEN 'Kerrang'
          WHEN LOWER(${brand}) LIKE '%radioplayer.forth1%' THEN 'Forth'
          WHEN LOWER(${brand}) LIKE '%radioplayer.wave105%' THEN 'Wave'
          WHEN LOWER(${brand}) LIKE '%radioplayer.mellowmagic%' THEN 'Magic'
          WHEN LOWER(${brand}) LIKE '%radioplayer.key103%' THEN 'Key'
          WHEN LOWER(${brand}) LIKE '%radioplayer.radiocity%' THEN 'City'
          WHEN LOWER(${brand}) LIKE '%radioplayer.magicchilled%' THEN 'Magic Chilled'
          WHEN LOWER(${brand}) LIKE '%radioplayer.metroradio%' THEN 'Metro'
          WHEN LOWER(${brand}) LIKE '%radioplayer.metro3radio%' THEN 'Metro'
          WHEN LOWER(${brand}) LIKE '%radioplayer.rockfm%' THEN 'Rock FM'
          WHEN LOWER(${brand}) LIKE '%heat radio%' THEN 'Heat Radio'
          WHEN LOWER(${brand}) LIKE '%radioplayer.hallamfm%' THEN 'Hallam'
          WHEN LOWER(${brand}) LIKE '%radioplayer.hallam3%' THEN 'Hallam'
          WHEN LOWER(${brand}) LIKE '%radioplayer.thehitsradio%' THEN 'The Hits'
          WHEN LOWER(${brand}) LIKE '%radioplayer.kissfmuk%' THEN 'Kiss'
          WHEN LOWER(${brand}) LIKE '%kisstory.kissfmuk%' THEN 'Kiss'
          WHEN LOWER(${brand}) LIKE '%kissfresh.kissfmuk%' THEN 'Kiss'
          WHEN LOWER(${brand}) LIKE '%radioplayer.northsound1%' THEN 'Northsound'
          WHEN LOWER(${brand}) LIKE '%downtown%' THEN 'Downtown'
          WHEN LOWER(${brand}) LIKE '%radioplayer.tayfm%' THEN 'Tay FM'
          WHEN LOWER(${brand}) LIKE '%radioplayer.mfr%' THEN 'MFR'
          WHEN LOWER(${brand}) LIKE '%radioplayer.westfm%' THEN 'West FM'
          WHEN LOWER(${brand}) LIKE '%radioplayer.vikingfm%' THEN 'Viking'
          WHEN LOWER(${brand}) LIKE '%radioplayer.cfmradio%' THEN 'CFM'
          WHEN LOWER(${brand}) LIKE '%radioplayer.tfmradio%' THEN 'TFM'
          WHEN LOWER(${brand}) LIKE '%radioplayer.downtowncountry%' THEN 'Downtown'
          WHEN LOWER(${brand}) LIKE '%radioplayer.radioborders%' THEN 'Borders'
          WHEN LOWER(${brand}) LIKE '%radioplayer.westsound%' THEN 'Westsound'
          WHEN LOWER(${brand}) LIKE '%radioplayer.tay2%' THEN 'Tay FM'
          WHEN LOWER(${brand}) LIKE '%radioplayer.hallam2%' THEN 'Hallam'
          WHEN LOWER(${brand}) LIKE '%radioplayer.radioaire2%' THEN 'Aire'
          WHEN LOWER(${brand}) LIKE '%radioplayer.northsound2%' THEN 'Northsound'
          WHEN LOWER(${brand}) LIKE '%radioplayer.key2radio%' THEN 'Key'
          WHEN LOWER(${brand}) LIKE '%radioplayer.viking2%' THEN 'Viking'
          WHEN LOWER(${brand}) LIKE '%radioplayer.metro2radio%' THEN 'Metro'
          WHEN LOWER(${brand}) LIKE '%radioplayer.tfm2%' THEN 'TFM'
          WHEN LOWER(${brand}) LIKE '%forth%' THEN 'Forth'
          WHEN LOWER(${brand}) LIKE '%radioplayer.tay3%' THEN 'Tay FM'
          WHEN LOWER(${brand}) LIKE '%radioplayer.key3radio%' THEN 'Key'
          WHEN LOWER(${brand}) LIKE '%radioplayer.viking3%' THEN 'Viking'
          WHEN LOWER(${brand}) LIKE '%radioplayer.radioaire3%' THEN 'Aire'
          WHEN LOWER(${brand}) LIKE '%radioplayer.tfm3%' THEN 'TFM'
          WHEN LOWER(${brand}) LIKE '%radioplayer.clyde1%' THEN 'Clyde'
          WHEN LOWER(${brand}) LIKE '%radioplayer.clyde2%' THEN 'Clyde'
          WHEN LOWER(${brand}) LIKE '%radioplayer.clyde3%' THEN 'Clyde'
          WHEN LOWER(${brand}) LIKE '%lifestyle.one/heat%' THEN 'Heat'
          WHEN LOWER(${brand}) LIKE '%lifestyle.one/closer%' THEN 'Closer'
          WHEN LOWER(${brand}) LIKE '%lifestyle.one/grazia%' THEN 'Grazia'
          WHEN LOWER(${brand}) LIKE '%parkers%' THEN 'Parkers'
          WHEN LOWER(${brand}) LIKE '%motorcyclenews.com%' THEN 'Motorcyclenews'
          WHEN LOWER(${brand}) LIKE '%empireonline.com%' THEN 'Empire'
          WHEN LOWER(${brand}) LIKE '%motherandbaby.co.uk%' THEN 'Mother & Baby'
          WHEN LOWER(${brand}) LIKE '%car%' THEN 'Car Magazine'
          WHEN LOWER(${brand}) LIKE '%classiccarsforsale.co.uk%' THEN 'Classic Cars for Sale'
          WHEN LOWER(${brand}) LIKE '%thedebrief.co.uk%' THEN 'The Debrief'
          WHEN LOWER(${brand}) LIKE '%todaysgolfer.co.uk%' THEN 'Todays Golfer'
          WHEN LOWER(${brand}) LIKE '%freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${brand}) LIKE '%gem106.orionplayer.co.uk' THEN 'Gem'
          WHEN LOWER(${brand}) LIKE '%planetradio.co.uk%' THEN 'Planet Radio'
          WHEN LOWER(${brand}) LIKE '%lifestyle.one%' THEN 'Todays Golfer'
          WHEN LOWER(${brand}) LIKE '%birmingham.freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${brand}) LIKE '%coventry.freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${brand}) LIKE '%blackcountry.freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${brand}) LIKE '%shropshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${brand}) LIKE '%worcestershire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${brand}) LIKE '%80s.freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${brand}) LIKE '%warwickshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${brand}) LIKE '%herefordshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${brand}) LIKE '%staffordshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${brand}) LIKE '%radioplay.no%' THEN 'RadioPlay General'
          WHEN LOWER(${brand}) LIKE '%radioplay.de%' THEN 'RadioPlay General'
          WHEN LOWER(${brand}) LIKE '%foodtolovemagazine%' THEN 'Food To Love'
          WHEN LOWER(${brand}) LIKE '%fateandfortunemagazine%' THEN 'Fate and Fortune'
          WHEN LOWER(${brand}) LIKE '%spiritanddestiny%' THEN 'Spirit and Destiny'
          WHEN LOWER(${brand}) LIKE '%am online%' THEN 'AM Online'
          WHEN LOWER(${brand}) LIKE '%anglingtimes%' THEN 'Angling Times'
          WHEN LOWER(${brand}) LIKE '%bikemagazine%' THEN 'Bike Magazine'
          WHEN LOWER(${brand}) LIKE '%birdwatching%' THEN 'Bird Watching'
          WHEN LOWER(${brand}) LIKE '%yours%' THEN 'Yours'
          WHEN LOWER(${brand}) LIKE '%yourhorse%' THEN 'Your Horse'
          WHEN LOWER(${brand}) LIKE '%trailrunningmag%' THEN 'Trail Running'
          WHEN LOWER(${brand}) LIKE '%topsante%' THEN 'Top Sante'
          WHEN LOWER(${brand}) LIKE '%steamrailway%' THEN 'Steam Railway'
          WHEN LOWER(${brand}) LIKE '%ride%' THEN 'Ride'
          WHEN LOWER(${brand}) LIKE '%rail%' THEN 'Rail Magazine'
          WHEN LOWER(${brand}) LIKE '%practicalsportsbikesmag%' THEN 'Practical Sports Bikes'
          WHEN LOWER(${brand}) LIKE '%practicalphotography%' THEN 'Practical Photography'
          WHEN LOWER(${brand}) LIKE '%practicalfishkeeping%' THEN 'Practical Fishkeeping'
          WHEN LOWER(${brand}) LIKE '%practicalclassics%' THEN 'Practical Classics'
          WHEN LOWER(${brand}) LIKE '%petproductmarketing%' THEN 'Pet Product Marketing'
          WHEN LOWER(${brand}) LIKE '%performancebikes%' THEN 'Performance Bikes'
          WHEN LOWER(${brand}) LIKE '%moderngardensmagazine%' THEN 'Modern Gardens'
          WHEN LOWER(${brand}) LIKE '%model-rail%' THEN 'Model Rail'
          WHEN LOWER(${brand}) LIKE '%mcnsport%' THEN 'MCN Sports'
          WHEN LOWER(${brand}) LIKE '%lro.com%' THEN 'Landrover Owner'
          WHEN LOWER(${brand}) LIKE '%landscapemagazine%' THEN 'Landscape'
          WHEN LOWER(${brand}) LIKE '%horsedeals%' THEN 'Horse Deals'
          WHEN LOWER(${brand}) LIKE '%gofishing%' THEN 'Go Fishing'
          WHEN LOWER(${brand}) LIKE '%gardennewsmagazine%' THEN 'Garden News'
          WHEN LOWER(${brand}) LIKE '%gardenanswersmagazine%' THEN 'Garden Answers'
          WHEN LOWER(${brand}) LIKE '%fleetnews%' THEN 'Fleetnews'
          WHEN LOWER(${brand}) LIKE '%commercial fleet%' THEN 'Commercial Fleet'
          WHEN LOWER(${brand}) LIKE '%classiccarweekly%' THEN 'Classic Car Weekly'
          WHEN LOWER(${brand}) LIKE '%classiccarsmagazine%' THEN 'Classic Cars'
          WHEN LOWER(${brand}) LIKE '%classicbike%' THEN 'Classic Bikes'
          WHEN LOWER(${brand}) LIKE '%carmechanicsmag%' THEN 'Car Mechanics'
          WHEN LOWER(${brand}) LIKE '%empire%' THEN 'Empire'
          WHEN LOWER(${brand}) LIKE '%todays golfer%' THEN 'Today''s Golfer'
          WHEN LOWER(${brand}) LIKE '%closer%' THEN 'Closer'
          WHEN LOWER(${brand}) LIKE '%grazia%' THEN 'Grazia'
          WHEN LOWER(${brand}) LIKE '%mcn%' THEN 'Motorcyclenews'
          WHEN LOWER(${brand}) LIKE '%motherandbaby%' THEN 'Mother & Baby'
          WHEN LOWER(${brand}) LIKE '%ccfs%' THEN 'Classic Cars for Sale'
          WHEN LOWER(${brand}) LIKE '%the debrief%' THEN 'The Debrief'
          WHEN LOWER(${brand}) LIKE '%_ros_%' THEN 'ROS'
          WHEN LOWER(${brand}) LIKE '%fleet news%' THEN 'Fleet News'
          WHEN LOWER(${brand}) LIKE '%bcn radio - romp%' THEN 'BCN Radio'
          WHEN LOWER(${brand}) LIKE '%national radio - romp%' THEN 'National Radio'
          ELSE LOWER(${brand})
        END
         ;;
  }

  dimension: device {
    type: string
    sql: SPLIT_PART(${TABLE}."site.name", '-', 3) ;;
  }

  dimension: zone {
    type: string
    sql: SPLIT_PART(${TABLE}."site.name", '-', 4) ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [publisher_name, site_name]
  }
}
