view: vibrant_media {
  sql_table_name: ad_platform.vibrant_media ;;

  measure: adviews {
    label: "Ad Views"
    type: sum
    sql: ${TABLE}.adviews ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}.date,'YYYYMMDD') ;;
  }

  measure: pageviews {
    type: sum
    sql: ${TABLE}.pageviews ;;
  }

  measure: revenue {
    label: "Revenue (GBP)"
    type: sum
    value_format: "\£0.00"
    sql: ${TABLE}.revenue::float ;;
  }

  dimension: rownum {
    hidden: yes
    type: string
    sql: ${TABLE}.rownum ;;
  }

  dimension: marketplace {
    type: string
    sql: CASE
          WHEN ${TABLE}.channel LIKE 'There is no OMP/PMP classifier in Adsense' THEN NULL
          ELSE 'OMP'
          END;;
  }

  dimension: Brand_Name {
    hidden: no
    label: "Brand Name"
    type: string
    sql: CASE
          WHEN ${TABLE}.site LIKE '%kiss%' THEN 'Kiss'
          WHEN ${TABLE}.site LIKE '%hits%' THEN 'The Hits'
          WHEN ${TABLE}.site LIKE '%kerrang%' THEN 'Kerrang'
          WHEN ${TABLE}.site LIKE '%magic%' THEN 'Magic'
          WHEN ${TABLE}.site LIKE '%absolute-80s%' THEN 'Absolute Radio'
          WHEN ${TABLE}.site LIKE '%absolute-classic-rock%' THEN 'Absolute Radio'
          WHEN ${TABLE}.site LIKE '%absolute-radio-00s%' THEN 'Absolute Radio'
          WHEN ${TABLE}.site LIKE '%absolute-radio-60s%' THEN 'Absolute Radio'
          WHEN ${TABLE}.site LIKE '%absolute-radio-70s%' THEN 'Absolute Radio'
          WHEN ${TABLE}.site LIKE '%absolute-radio-90s%' THEN 'Absolute Radio'
          WHEN ${TABLE}.site LIKE '%absolute-radio%' THEN 'Absolute Radio'
          WHEN ${TABLE}.site LIKE '%absolute%' THEN 'Absolute Radio'
          WHEN ${TABLE}.site LIKE '%absoluteradio%' THEN 'Absolute Radio'
          WHEN ${TABLE}.site LIKE '%aire-2%' THEN 'Aire'
          WHEN ${TABLE}.site LIKE '%aire2%' THEN 'Aire'
          WHEN ${TABLE}.site LIKE '%aire-3%' THEN 'Aire'
          WHEN ${TABLE}.site LIKE '%aire3%' THEN 'Aire'
          WHEN ${TABLE}.site LIKE '%aire%' THEN 'Aire'
          WHEN ${TABLE}.site LIKE '%borders%' THEN 'Borders'
          WHEN ${TABLE}.site LIKE '%cfm%' THEN 'CFM'
          WHEN ${TABLE}.site LIKE '%city-2%' THEN 'City'
          WHEN ${TABLE}.site LIKE '%city-3%' THEN 'City'
          WHEN ${TABLE}.site LIKE '%city2%' THEN 'City'
          WHEN ${TABLE}.site LIKE '%city3%' THEN 'City'
          WHEN ${TABLE}.site LIKE '%city-talk%' THEN 'City'
          WHEN ${TABLE}.site LIKE '%city%' THEN 'City'
          WHEN ${TABLE}.site LIKE '%clyde-1%' THEN 'Clyde'
          WHEN ${TABLE}.site LIKE '%clyde1%' THEN 'Clyde'
          WHEN ${TABLE}.site LIKE '%citytalk%' THEN 'City'
          WHEN ${TABLE}.site LIKE '%clyde-2%' THEN 'Clyde'
          WHEN ${TABLE}.site LIKE '%clyde2%' THEN 'Clyde'
          WHEN ${TABLE}.site LIKE '%clyde-3%' THEN 'Clyde'
          WHEN ${TABLE}.site LIKE '%clyde3%' THEN 'Clyde'
          WHEN ${TABLE}.site LIKE '%heat%' THEN 'Heat'
          WHEN ${TABLE}.site LIKE '%grazia%' THEN 'Grazia'
          WHEN ${TABLE}.site LIKE '%fhm%' THEN 'FHM'
          WHEN ${TABLE}.site LIKE '%zoo%' THEN 'Zoo'
          WHEN ${TABLE}.site LIKE '%closer%' THEN 'Closer'
          WHEN ${TABLE}.site LIKE '%clyde%' THEN 'Clyde'
          WHEN ${TABLE}.site LIKE '%cool-fm%' THEN 'Cool FM'
          WHEN ${TABLE}.site LIKE '%coolfm%' THEN 'Cool FM'
          WHEN ${TABLE}.site LIKE '%downtown%' THEN 'Downtown'
          WHEN ${TABLE}.site LIKE '%downtown-country%' THEN 'Downtown'
          WHEN ${TABLE}.site LIKE '%forth-2%' THEN 'Forth'
          WHEN ${TABLE}.site LIKE '%forth2%' THEN 'Forth'
          WHEN ${TABLE}.site LIKE '%forth-1%' THEN 'Forth'
          WHEN ${TABLE}.site LIKE '%forth1%' THEN 'Forth'
          WHEN ${TABLE}.site LIKE '%forth-3%' THEN 'Forth'
          WHEN ${TABLE}.site LIKE '%forth%' THEN 'Forth'
          WHEN ${TABLE}.site LIKE '%forth3%' THEN 'Forth'
          WHEN ${TABLE}.site LIKE '%free-radio%' THEN 'Free'
          WHEN ${TABLE}.site LIKE '%free%' THEN 'Free'
          WHEN ${TABLE}.site LIKE '%free-80%' THEN 'Free'
          WHEN ${TABLE}.site LIKE '%free-80s%' THEN 'Free'
          WHEN ${TABLE}.site LIKE '%free-coventry%' THEN 'Free'
          WHEN ${TABLE}.site LIKE '%free-cov%' THEN 'Free'
          WHEN ${TABLE}.site LIKE '%freeradio%' THEN 'Free'
          WHEN ${TABLE}.site LIKE '%gem-106%' THEN 'Gem'
          WHEN ${TABLE}.site LIKE '%gem106%' THEN 'Gem'
          WHEN ${TABLE}.site LIKE '%gem%' THEN 'Gem'
          WHEN ${TABLE}.site LIKE '%hallam-2%' THEN 'Hallam'
          WHEN ${TABLE}.site LIKE '%hallam2%' THEN 'Hallam'
          WHEN ${TABLE}.site LIKE '%hallam-3%' THEN 'Hallam'
          WHEN ${TABLE}.site LIKE '%hallam3%' THEN 'Hallam'
          WHEN ${TABLE}.site LIKE '%hallam-fm%' THEN 'Hallam'
          WHEN ${TABLE}.site LIKE '%hallam%' THEN 'Hallam'
          WHEN ${TABLE}.site LIKE '%hallamfm%' THEN 'Hallam'
          WHEN ${TABLE}.site LIKE '%planetradio.co.uk/heat%' THEN 'Heat Radio'
          WHEN ${TABLE}.site LIKE '%key-2%' THEN 'Key'
          WHEN ${TABLE}.site LIKE '%key2%' THEN 'Key'
          WHEN ${TABLE}.site LIKE '%key-3%' THEN 'Key'
          WHEN ${TABLE}.site LIKE '%key3%' THEN 'Key'
          WHEN ${TABLE}.site LIKE '%key-103%' THEN 'Key'
          WHEN ${TABLE}.site LIKE '%key%' THEN 'Key'
          WHEN ${TABLE}.site LIKE '%key103%' THEN 'Key'
          WHEN ${TABLE}.site LIKE '%kiss-fresh%' THEN 'Kiss'
          WHEN ${TABLE}.site LIKE '%kisstory%' THEN 'Kiss'
          WHEN ${TABLE}.site LIKE '%magic-chilled%' THEN 'Magic'
          WHEN ${TABLE}.site LIKE '%mellow-magic%' THEN 'Magic'
          WHEN ${TABLE}.site LIKE '%magic-mellow%' THEN 'Magic'
          WHEN ${TABLE}.site LIKE '%magic-soul%' THEN 'Magic'
          WHEN ${TABLE}.site LIKE '%metro-2%' THEN 'Metro'
          WHEN ${TABLE}.site LIKE '%metro%' THEN 'Metro'
          WHEN ${TABLE}.site LIKE '%metro-3%' THEN 'Metro'
          WHEN ${TABLE}.site LIKE '%mfr-2%' THEN 'MFR'
          WHEN ${TABLE}.site LIKE '%mfr-3%' THEN 'MFR'
          WHEN ${TABLE}.site LIKE '%mfr%' THEN 'MFR'
          WHEN ${TABLE}.site LIKE '%northsound-1%' THEN 'Northsound'
          WHEN ${TABLE}.site LIKE '%northsound-2%' THEN 'Northsound'
          WHEN ${TABLE}.site LIKE '%northsound%' THEN 'Northsound'
          WHEN ${TABLE}.site LIKE '%planet-rock%' THEN 'Planet Rock'
          WHEN ${TABLE}.site LIKE '%tfm%' THEN 'TFM'
          WHEN ${TABLE}.site LIKE '%tfm-3%' THEN 'TFM'
          WHEN ${TABLE}.site LIKE '%rock-fm%' THEN 'Rock FM'
          WHEN ${TABLE}.site LIKE '%rockfm' THEN 'Rock FM'
          WHEN ${TABLE}.site LIKE '%west%' THEN 'West FM'
          WHEN ${TABLE}.site LIKE '%wave-105%' THEN 'Wave'
          WHEN ${TABLE}.site LIKE '%wave%' THEN 'Wave'
          WHEN ${TABLE}.site LIKE '%wave105%' THEN 'Wave'
          WHEN ${TABLE}.site LIKE '%viking%' THEN 'Viking'
          WHEN ${TABLE}.site LIKE '%viking-3%' THEN 'Viking'
          WHEN ${TABLE}.site LIKE '%viking-2%' THEN 'Viking'
          WHEN ${TABLE}.site LIKE '%tay%' THEN 'Tay FM'
          WHEN ${TABLE}.site LIKE '%tay-2%' THEN 'Tay FM'
          WHEN ${TABLE}.site LIKE '%westsound%' THEN 'Westsound'
          WHEN ${TABLE}.site LIKE '%westsound-fm%' THEN 'Westsound'
          WHEN ${TABLE}.site LIKE '%tfm-2%' THEN 'TFM'
          WHEN ${TABLE}.site LIKE '%rock%' THEN 'Rock FM'
          WHEN ${TABLE}.site LIKE '%tay-3%' THEN 'Tay FM'
          WHEN ${TABLE}.site LIKE '%radioborders%' THEN 'Borders'
          WHEN ${TABLE}.site LIKE '%free80s%' THEN 'Free'
          WHEN ${TABLE}.site LIKE '%rock-fm-2%' THEN 'Rock FM'
          WHEN ${TABLE}.site LIKE '%rock-fm-3%' THEN 'Rock FM'
          WHEN ${TABLE}.site LIKE '%radioplayer.magic%' THEN 'Magic'
          WHEN ${TABLE}.site LIKE '%radioplayer.planetrock%' THEN 'Planet Rock'
          WHEN ${TABLE}.site LIKE '%radioplayer.coolfm%' THEN 'Cool FM'
          WHEN ${TABLE}.site LIKE '%radioplayer.kerrangradio%' THEN 'Kerrang'
          WHEN ${TABLE}.site LIKE '%radioplayer.forth1%' THEN 'Forth'
          WHEN ${TABLE}.site LIKE '%radioplayer.wave105%' THEN 'Wave'
          WHEN ${TABLE}.site LIKE '%radioplayer.mellowmagic%' THEN 'Magic'
          WHEN ${TABLE}.site LIKE '%radioplayer.key103%' THEN 'Key'
          WHEN ${TABLE}.site LIKE '%radioplayer.radiocity%' THEN 'City'
          WHEN ${TABLE}.site LIKE '%radioplayer.magicchilled%' THEN 'Magic Chilled'
          WHEN ${TABLE}.site LIKE '%radioplayer.metroradio%' THEN 'Metro'
          WHEN ${TABLE}.site LIKE '%radioplayer.metro3radio%' THEN 'Metro'
          WHEN ${TABLE}.site LIKE '%radioplayer.rockfm%' THEN 'Rock FM'
          WHEN ${TABLE}.site LIKE '%radioplayer.heatworld%' THEN 'Heat Radio'
          WHEN ${TABLE}.site LIKE '%radioplayer.hallamfm%' THEN 'Hallam'
          WHEN ${TABLE}.site LIKE '%radioplayer.hallam3%' THEN 'Hallam'
          WHEN ${TABLE}.site LIKE '%radioplayer.thehitsradio%' THEN 'The Hits'
          WHEN ${TABLE}.site LIKE '%radioplayer.kissfmuk%' THEN 'Kiss'
          WHEN ${TABLE}.site LIKE '%kisstory.kissfmuk%' THEN 'Kiss'
          WHEN ${TABLE}.site LIKE '%kissfresh.kissfmuk%' THEN 'Kiss'
          WHEN ${TABLE}.site LIKE '%radioplayer.northsound1%' THEN 'Northsound'
          WHEN ${TABLE}.site LIKE '%radioplayer.downtown%' THEN 'Downtown'
          WHEN ${TABLE}.site LIKE '%radioplayer.tayfm%' THEN 'Tay FM'
          WHEN ${TABLE}.site LIKE '%radioplayer.mfr%' THEN 'MFR'
          WHEN ${TABLE}.site LIKE '%radioplayer.westfm%' THEN 'West FM'
          WHEN ${TABLE}.site LIKE '%radioplayer.vikingfm%' THEN 'Viking'
          WHEN ${TABLE}.site LIKE '%radioplayer.cfmradio%' THEN 'CFM'
          WHEN ${TABLE}.site LIKE '%radioplayer.tfmradio%' THEN 'TFM'
          WHEN ${TABLE}.site LIKE '%radioplayer.downtowncountry%' THEN 'Downtown'
          WHEN ${TABLE}.site LIKE '%radioplayer.radioborders%' THEN 'Borders'
          WHEN ${TABLE}.site LIKE '%radioplayer.westsound%' THEN 'Westsound'
          WHEN ${TABLE}.site LIKE '%radioplayer.tay2%' THEN 'Tay FM'
          WHEN ${TABLE}.site LIKE '%radioplayer.hallam2%' THEN 'Hallam'
          WHEN ${TABLE}.site LIKE '%radioplayer.radioaire2%' THEN 'Aire'
          WHEN ${TABLE}.site LIKE '%radioplayer.northsound2%' THEN 'Northsound'
          WHEN ${TABLE}.site LIKE '%radioplayer.key2radio%' THEN 'Key'
          WHEN ${TABLE}.site LIKE '%radioplayer.viking2%' THEN 'Viking'
          WHEN ${TABLE}.site LIKE '%radioplayer.metro2radio%' THEN 'Metro'
          WHEN ${TABLE}.site LIKE '%radioplayer.tfm2%' THEN 'TFM'
          WHEN ${TABLE}.site LIKE '%radioplayer.forth3%' THEN 'Forth'
          WHEN ${TABLE}.site LIKE '%radioplayer.tay3%' THEN 'Tay FM'
          WHEN ${TABLE}.site LIKE '%radioplayer.key3radio%' THEN 'Key'
          WHEN ${TABLE}.site LIKE '%radioplayer.viking3%' THEN 'Viking'
          WHEN ${TABLE}.site LIKE '%radioplayer.radioaire3%' THEN 'Aire'
          WHEN ${TABLE}.site LIKE '%radioplayer.tfm3%' THEN 'TFM'
          WHEN ${TABLE}.site LIKE '%radioplayer.clyde1%' THEN 'Clyde'
          WHEN ${TABLE}.site LIKE '%radioplayer.clyde2%' THEN 'Clyde'
          WHEN ${TABLE}.site LIKE '%radioplayer.clyde3%' THEN 'Clyde'
          WHEN ${TABLE}.site LIKE '%lifestyle.one/heat%' THEN 'Heat'
          WHEN ${TABLE}.site LIKE '%lifestyle.one/closer%' THEN 'Closer'
          WHEN ${TABLE}.site LIKE '%lifestyle.one/grazia%' THEN 'Grazia'
          WHEN ${TABLE}.site LIKE '%parkers.co.uk%' THEN 'Parkers'
          WHEN ${TABLE}.site LIKE '%motorcyclenews.com%' THEN 'Motorcyclenews'
          WHEN ${TABLE}.site LIKE '%empireonline.com%' THEN 'Empire'
          WHEN ${TABLE}.site LIKE '%motherandbaby.co.uk%' THEN 'Mother & Baby'
          WHEN ${TABLE}.site LIKE '%carmagazine.co.uk%' THEN 'Car Magazine'
          WHEN ${TABLE}.site LIKE '%classiccarsforsale.co.uk%' THEN 'Classic Cars for Sale'
          WHEN ${TABLE}.site LIKE '%thedebrief.co.uk%' THEN 'The Debrief'
          WHEN ${TABLE}.site LIKE '%todaysgolfer.co.uk%' THEN 'Todays Golfer'
          WHEN ${TABLE}.site LIKE '%freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.site LIKE '%gem106.orionplayer.co.uk' THEN 'Gem'
          WHEN ${TABLE}.site LIKE '%planetradio.co.uk%' THEN 'Planet Radio'
          WHEN ${TABLE}.site LIKE '%lifestyle.one%' THEN 'Todays Golfer'
          WHEN ${TABLE}.site LIKE '%birmingham.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.site LIKE '%coventry.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.site LIKE '%blackcountry.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.site LIKE '%shropshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.site LIKE '%worcestershire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.site LIKE '%80s.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.site LIKE '%warwickshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.site LIKE '%herefordshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.site LIKE '%staffordshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN ${TABLE}.site LIKE '%radioplay.no%' THEN 'RadioPlay General'
          WHEN ${TABLE}.site LIKE '%radioplay.de%' THEN 'RadioPlay General'
          WHEN ${TABLE}.site LIKE '%foodtolovemagazine%' THEN 'Food To Love'
          WHEN ${TABLE}.site LIKE '%fateandfortunemagazine%' THEN 'Fate and Fortune'
          WHEN ${TABLE}.site LIKE '%spiritanddestiny%' THEN 'Spirit and Destiny'
          WHEN ${TABLE}.site LIKE '%am-online%' THEN 'AM Online'
          WHEN ${TABLE}.site LIKE '%anglingtimes%' THEN 'Angling Times'
          WHEN ${TABLE}.site LIKE '%bikemagazine%' THEN 'Bike Magazine'
          WHEN ${TABLE}.site LIKE '%birdwatching%' THEN 'Bird Watching'
          WHEN ${TABLE}.site LIKE '%yours%' THEN 'Yours'
          WHEN ${TABLE}.site LIKE '%yourhorse%' THEN 'Your Horse'
          WHEN ${TABLE}.site LIKE '%trailrunningmag%' THEN 'Trail Running'
          WHEN ${TABLE}.site LIKE '%topsante%' THEN 'Top Sante'
          WHEN ${TABLE}.site LIKE '%steamrailway%' THEN 'Steam Railway'
          WHEN ${TABLE}.site LIKE '%ride%' THEN 'Ride'
          WHEN ${TABLE}.site LIKE '%railmagazine%' THEN 'Rail Magazine'
          WHEN ${TABLE}.site LIKE '%practicalsportsbikesmag%' THEN 'Practical Sports Bikes'
          WHEN ${TABLE}.site LIKE '%practicalphotography%' THEN 'Practical Photography'
          WHEN ${TABLE}.site LIKE '%practicalfishkeeping%' THEN 'Practical Fishkeeping'
          WHEN ${TABLE}.site LIKE '%practicalclassics%' THEN 'Practical Classics'
          WHEN ${TABLE}.site LIKE '%petproductmarketing%' THEN 'Pet Product Marketing'
          WHEN ${TABLE}.site LIKE '%performancebikes%' THEN 'Performance Bikes'
          WHEN ${TABLE}.site LIKE '%moderngardensmagazine%' THEN 'Modern Gardens'
          WHEN ${TABLE}.site LIKE '%model-rail%' THEN 'Model Rail'
          WHEN ${TABLE}.site LIKE '%mcnsport%' THEN 'MCN Sports'
          WHEN ${TABLE}.site LIKE '%lro.com%' THEN 'Landrover Owner'
          WHEN ${TABLE}.site LIKE '%landscapemagazine%' THEN 'Landscape'
          WHEN ${TABLE}.site LIKE '%horsedeals%' THEN 'Horse Deals'
          WHEN ${TABLE}.site LIKE '%gofishing%' THEN 'Go Fishing'
          WHEN ${TABLE}.site LIKE '%gardennewsmagazine%' THEN 'Garden News'
          WHEN ${TABLE}.site LIKE '%gardenanswersmagazine%' THEN 'Garden Answers'
          WHEN ${TABLE}.site LIKE '%fleetnews%' THEN 'Fleetnews'
          WHEN ${TABLE}.site LIKE '%commercialfleet%' THEN 'Commercial Fleet'
          WHEN ${TABLE}.site LIKE '%classiccarweekly%' THEN 'Classic Car Weekly'
          WHEN ${TABLE}.site LIKE '%classiccarsmagazine%' THEN 'Classic Cars'
          WHEN ${TABLE}.site LIKE '%classicbike%' THEN 'Classic Bikes'
          WHEN ${TABLE}.site LIKE '%carmechanicsmag%' THEN 'Car Mechanics'
          ELSE ${TABLE}.site
        END
         ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
