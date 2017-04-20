view: rubicon {
  sql_table_name: ad_platform.rubicon ;;

  dimension: advertiser {
    type: string
    sql: ${TABLE}.advertiser ;;
  }

  measure: auction_revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.auction_revenue::float ;;
  }

  measure: auctions {
    type: sum
    sql: ${TABLE}.auctions ;;
  }

  measure: auctions_won {
    type: sum
    sql: ${TABLE}.auctions_won ;;
  }

  dimension: buyer {
    type: string
    sql: ${TABLE}.buyer ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD') ;;
  }


  dimension: deal {
    type: string
    sql: ${TABLE}.deal ;;
  }

  measure: paid_impression {
    type: sum
    sql: ${TABLE}.paid_impression ;;
  }

  dimension: partner {
    type: string
    sql: ${TABLE}.partner ;;
  }

  measure: revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.revenue::float ;;
  }

  dimension: revenue_source {
    type: string
    sql: ${TABLE}.revenue_source ;;
  }

  dimension: marketplace {
    type: string
    sql: CASE
          WHEN  ${TABLE}.revenue_source = 'RTB Open Market' THEN 'OMP'
          WHEN  ${TABLE}.revenue_source = 'RTB Orders' THEN 'PMP'
          WHEN  ${TABLE}.revenue_source = 'House' THEN 'PMP'
          ELSE 'Unknown'
          END;;
  }

  dimension: rownum {
    type: string
    hidden: yes
    sql: ${TABLE}.rownum ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  dimension: size {
    type: string
    sql: ${TABLE}.size ;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
  }

  dimension: market {
    type: string
    sql: SPLIT_PART(${TABLE}.zone, '_', 1) ;;
  }

  dimension: Device {
    type: string
    sql: SPLIT_PART(${TABLE}.zone, '_', 3) ;;
  }

  dimension: Brand_Name {
    hidden: no
    label: "Brand Name"
    type: string
    sql: CASE
          WHEN LOWER(${TABLE}.zone) LIKE '%kiss%' THEN 'Kiss'
          WHEN LOWER(${TABLE}.zone) LIKE '%hits%' THEN 'The Hits'
          WHEN LOWER(${TABLE}.zone) LIKE '%kerrang%' THEN 'Kerrang'
          WHEN LOWER(${TABLE}.zone) LIKE '%magic%' THEN 'Magic'
          WHEN LOWER(${TABLE}.zone) LIKE '%absolute-80s%' THEN 'Absolute Radio'
          WHEN LOWER(${TABLE}.zone) LIKE '%absolute-classic-rock%' THEN 'Absolute Radio'
          WHEN LOWER(${TABLE}.zone) LIKE '%absolute-radio-00s%' THEN 'Absolute Radio'
          WHEN LOWER(${TABLE}.zone) LIKE '%absolute-radio-60s%' THEN 'Absolute Radio'
          WHEN LOWER(${TABLE}.zone) LIKE '%absolute-radio-70s%' THEN 'Absolute Radio'
          WHEN LOWER(${TABLE}.zone) LIKE '%absolute-radio-90s%' THEN 'Absolute Radio'
          WHEN LOWER(${TABLE}.zone) LIKE '%absolute-radio%' THEN 'Absolute Radio'
          WHEN LOWER(${TABLE}.zone) LIKE '%absolute%' THEN 'Absolute Radio'
          WHEN LOWER(${TABLE}.zone) LIKE '%absoluteradio%' THEN 'Absolute Radio'
          WHEN LOWER(${TABLE}.zone) LIKE '%aire-2%' THEN 'Aire'
          WHEN LOWER(${TABLE}.zone) LIKE '%aire2%' THEN 'Aire'
          WHEN LOWER(${TABLE}.zone) LIKE '%aire-3%' THEN 'Aire'
          WHEN LOWER(${TABLE}.zone) LIKE '%aire3%' THEN 'Aire'
          WHEN LOWER(${TABLE}.zone) LIKE '%aire%' THEN 'Aire'
          WHEN LOWER(${TABLE}.zone) LIKE '%borders%' THEN 'Borders'
          WHEN LOWER(${TABLE}.zone) LIKE '%cfm%' THEN 'CFM'
          WHEN LOWER(${TABLE}.zone) LIKE '%city-2%' THEN 'City'
          WHEN LOWER(${TABLE}.zone) LIKE '%city-3%' THEN 'City'
          WHEN LOWER(${TABLE}.zone) LIKE '%city2%' THEN 'City'
          WHEN LOWER(${TABLE}.zone) LIKE '%city3%' THEN 'City'
          WHEN LOWER(${TABLE}.zone) LIKE '%city-talk%' THEN 'City'
          WHEN LOWER(${TABLE}.zone) LIKE '%city%' THEN 'City'
          WHEN LOWER(${TABLE}.zone) LIKE '%clyde-1%' THEN 'Clyde'
          WHEN LOWER(${TABLE}.zone) LIKE '%clyde1%' THEN 'Clyde'
          WHEN LOWER(${TABLE}.zone) LIKE '%citytalk%' THEN 'City'
          WHEN LOWER(${TABLE}.zone) LIKE '%clyde-2%' THEN 'Clyde'
          WHEN LOWER(${TABLE}.zone) LIKE '%clyde2%' THEN 'Clyde'
          WHEN LOWER(${TABLE}.zone) LIKE '%clyde-3%' THEN 'Clyde'
          WHEN LOWER(${TABLE}.zone) LIKE '%clyde3%' THEN 'Clyde'
          WHEN LOWER(${TABLE}.zone) LIKE '%clyde%' THEN 'Clyde'
          WHEN LOWER(${TABLE}.zone) LIKE '%cool-fm%' THEN 'Cool FM'
          WHEN LOWER(${TABLE}.zone) LIKE '%coolfm%' THEN 'Cool FM'
          WHEN LOWER(${TABLE}.zone) LIKE '%downtown%' THEN 'Downtown'
          WHEN LOWER(${TABLE}.zone) LIKE '%downtown-country%' THEN 'Downtown'
          WHEN LOWER(${TABLE}.zone) LIKE '%forth-2%' THEN 'Forth'
          WHEN LOWER(${TABLE}.zone) LIKE '%forth2%' THEN 'Forth'
          WHEN LOWER(${TABLE}.zone) LIKE '%forth-1%' THEN 'Forth'
          WHEN LOWER(${TABLE}.zone) LIKE '%forth1%' THEN 'Forth'
          WHEN LOWER(${TABLE}.zone) LIKE '%forth-3%' THEN 'Forth'
          WHEN LOWER(${TABLE}.zone) LIKE '%forth%' THEN 'Forth'
          WHEN LOWER(${TABLE}.zone) LIKE '%forth3%' THEN 'Forth'
          WHEN LOWER(${TABLE}.zone) LIKE '%free-radio%' THEN 'Free'
          WHEN LOWER(${TABLE}.zone) LIKE '%free%' THEN 'Free'
          WHEN LOWER(${TABLE}.zone) LIKE '%free-80%' THEN 'Free'
          WHEN LOWER(${TABLE}.zone) LIKE '%free-80s%' THEN 'Free'
          WHEN LOWER(${TABLE}.zone) LIKE '%free-coventry%' THEN 'Free'
          WHEN LOWER(${TABLE}.zone) LIKE '%free-cov%' THEN 'Free'
          WHEN LOWER(${TABLE}.zone) LIKE '%freeradio%' THEN 'Free'
          WHEN LOWER(${TABLE}.zone) LIKE '%gem-106%' THEN 'Gem'
          WHEN LOWER(${TABLE}.zone) LIKE '%gem106%' THEN 'Gem'
          WHEN LOWER(${TABLE}.zone) LIKE '%gem%' THEN 'Gem'
          WHEN LOWER(${TABLE}.zone) LIKE '%hallam-2%' THEN 'Hallam'
          WHEN LOWER(${TABLE}.zone) LIKE '%hallam2%' THEN 'Hallam'
          WHEN LOWER(${TABLE}.zone) LIKE '%hallam-3%' THEN 'Hallam'
          WHEN LOWER(${TABLE}.zone) LIKE '%hallam3%' THEN 'Hallam'
          WHEN LOWER(${TABLE}.zone) LIKE '%hallam-fm%' THEN 'Hallam'
          WHEN LOWER(${TABLE}.zone) LIKE '%hallam%' THEN 'Hallam'
          WHEN LOWER(${TABLE}.zone) LIKE '%hallamfm%' THEN 'Hallam'
          WHEN LOWER(${TABLE}.zone) LIKE '%heat%' THEN 'Heat'
          WHEN LOWER(${TABLE}.zone) LIKE '%key-2%' THEN 'Key'
          WHEN LOWER(${TABLE}.zone) LIKE '%key2%' THEN 'Key'
          WHEN LOWER(${TABLE}.zone) LIKE '%key-3%' THEN 'Key'
          WHEN LOWER(${TABLE}.zone) LIKE '%key3%' THEN 'Key'
          WHEN LOWER(${TABLE}.zone) LIKE '%key-103%' THEN 'Key'
          WHEN LOWER(${TABLE}.zone) LIKE '%key%' THEN 'Key'
          WHEN LOWER(${TABLE}.zone) LIKE '%key103%' THEN 'Key'
          WHEN LOWER(${TABLE}.zone) LIKE '%kiss-fresh%' THEN 'Kiss'
          WHEN LOWER(${TABLE}.zone) LIKE '%kisstory%' THEN 'Kiss'
          WHEN LOWER(${TABLE}.zone) LIKE '%magic-chilled%' THEN 'Magic'
          WHEN LOWER(${TABLE}.zone) LIKE '%mellow-magic%' THEN 'Magic'
          WHEN LOWER(${TABLE}.zone) LIKE '%magic-mellow%' THEN 'Magic'
          WHEN LOWER(${TABLE}.zone) LIKE '%magic-soul%' THEN 'Magic'
          WHEN LOWER(${TABLE}.zone) LIKE '%metro-2%' THEN 'Metro'
          WHEN LOWER(${TABLE}.zone) LIKE '%metro%' THEN 'Metro'
          WHEN LOWER(${TABLE}.zone) LIKE '%metro-3%' THEN 'Metro'
          WHEN LOWER(${TABLE}.zone) LIKE '%mfr-2%' THEN 'MFR'
          WHEN LOWER(${TABLE}.zone) LIKE '%mfr-3%' THEN 'MFR'
          WHEN LOWER(${TABLE}.zone) LIKE '%mfr%' THEN 'MFR'
          WHEN LOWER(${TABLE}.zone) LIKE '%northsound-1%' THEN 'Northsound'
          WHEN LOWER(${TABLE}.zone) LIKE '%northsound-2%' THEN 'Northsound'
          WHEN LOWER(${TABLE}.zone) LIKE '%northsound%' THEN 'Northsound'
          WHEN LOWER(${TABLE}.zone) LIKE '%planet-rock%' THEN 'Planet Rock'
          WHEN LOWER(${TABLE}.zone) LIKE '%tfm%' THEN 'TFM'
          WHEN LOWER(${TABLE}.zone) LIKE '%tfm-3%' THEN 'TFM'
          WHEN LOWER(${TABLE}.zone) LIKE '%rock-fm%' THEN 'Rock FM'
          WHEN LOWER(${TABLE}.zone) LIKE '%rockfm' THEN 'Rock FM'
          WHEN LOWER(${TABLE}.zone) LIKE '%west%' THEN 'West FM'
          WHEN LOWER(${TABLE}.zone) LIKE '%wave-105%' THEN 'Wave'
          WHEN LOWER(${TABLE}.zone) LIKE '%wave%' THEN 'Wave'
          WHEN LOWER(${TABLE}.zone) LIKE '%wave105%' THEN 'Wave'
          WHEN LOWER(${TABLE}.zone) LIKE '%viking%' THEN 'Viking'
          WHEN LOWER(${TABLE}.zone) LIKE '%viking-3%' THEN 'Viking'
          WHEN LOWER(${TABLE}.zone) LIKE '%viking-2%' THEN 'Viking'
          WHEN LOWER(${TABLE}.zone) LIKE '%tay%' THEN 'Tay FM'
          WHEN LOWER(${TABLE}.zone) LIKE '%tay-2%' THEN 'Tay FM'
          WHEN LOWER(${TABLE}.zone) LIKE '%westsound%' THEN 'Westsound'
          WHEN LOWER(${TABLE}.zone) LIKE '%westsound-fm%' THEN 'Westsound'
          WHEN LOWER(${TABLE}.zone) LIKE '%tfm-2%' THEN 'TFM'
          WHEN LOWER(${TABLE}.zone) LIKE '%rock%' THEN 'Rock FM'
          WHEN LOWER(${TABLE}.zone) LIKE '%tay-3%' THEN 'Tay FM'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioborders%' THEN 'Borders'
          WHEN LOWER(${TABLE}.zone) LIKE '%free80s%' THEN 'Free'
          WHEN LOWER(${TABLE}.zone) LIKE '%rock-fm-2%' THEN 'Rock FM'
          WHEN LOWER(${TABLE}.zone) LIKE '%rock-fm-3%' THEN 'Rock FM'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.magic%' THEN 'Magic'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.planetrock%' THEN 'Planet Rock'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.coolfm%' THEN 'Cool FM'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.kerrangradio%' THEN 'Kerrang'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.forth1%' THEN 'Forth'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.wave105%' THEN 'Wave'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.mellowmagic%' THEN 'Magic'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.key103%' THEN 'Key'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.radiocity%' THEN 'City'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.magicchilled%' THEN 'Magic Chilled'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.metroradio%' THEN 'Metro'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.metro3radio%' THEN 'Metro'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.rockfm%' THEN 'Rock FM'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.heatworld%' THEN 'Heat Radio'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.hallamfm%' THEN 'Hallam'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.hallam3%' THEN 'Hallam'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.thehitsradio%' THEN 'The Hits'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.kissfmuk%' THEN 'Kiss'
          WHEN LOWER(${TABLE}.zone) LIKE '%kisstory.kissfmuk%' THEN 'Kiss'
          WHEN LOWER(${TABLE}.zone) LIKE '%kissfresh.kissfmuk%' THEN 'Kiss'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.northsound1%' THEN 'Northsound'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.downtown%' THEN 'Downtown'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.tayfm%' THEN 'Tay FM'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.mfr%' THEN 'MFR'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.westfm%' THEN 'West FM'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.vikingfm%' THEN 'Viking'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.cfmradio%' THEN 'CFM'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.tfmradio%' THEN 'TFM'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.downtowncountry%' THEN 'Downtown'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.radioborders%' THEN 'Borders'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.westsound%' THEN 'Westsound'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.tay2%' THEN 'Tay FM'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.hallam2%' THEN 'Hallam'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.radioaire2%' THEN 'Aire'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.northsound2%' THEN 'Northsound'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.key2radio%' THEN 'Key'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.viking2%' THEN 'Viking'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.metro2radio%' THEN 'Metro'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.tfm2%' THEN 'TFM'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.forth3%' THEN 'Forth'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.tay3%' THEN 'Tay FM'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.key3radio%' THEN 'Key'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.viking3%' THEN 'Viking'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.radioaire3%' THEN 'Aire'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.tfm3%' THEN 'TFM'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.clyde1%' THEN 'Clyde'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.clyde2%' THEN 'Clyde'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplayer.clyde3%' THEN 'Clyde'
          WHEN LOWER(${TABLE}.zone) LIKE '%lifestyle.one/heat%' THEN 'Heat'
          WHEN LOWER(${TABLE}.zone) LIKE '%lifestyle.one/closer%' THEN 'Closer'
          WHEN LOWER(${TABLE}.zone) LIKE '%lifestyle.one/grazia%' THEN 'Grazia'
          WHEN LOWER(${TABLE}.zone) LIKE '%parkers%' THEN 'Parkers'
          WHEN LOWER(${TABLE}.zone) LIKE '%motorcyclenews.com%' THEN 'Motorcyclenews'
          WHEN LOWER(${TABLE}.zone) LIKE '%empireonline.com%' THEN 'Empire'
          WHEN LOWER(${TABLE}.zone) LIKE '%motherandbaby.co.uk%' THEN 'Mother & Baby'
          WHEN LOWER(${TABLE}.zone) LIKE '%car%' THEN 'Car Magazine'
          WHEN LOWER(${TABLE}.zone) LIKE '%classiccarsforsale.co.uk%' THEN 'Classic Cars for Sale'
          WHEN LOWER(${TABLE}.zone) LIKE '%thedebrief.co.uk%' THEN 'The Debrief'
          WHEN LOWER(${TABLE}.zone) LIKE '%todaysgolfer.co.uk%' THEN 'Todays Golfer'
          WHEN LOWER(${TABLE}.zone) LIKE '%freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${TABLE}.zone) LIKE '%gem106.orionplayer.co.uk' THEN 'Gem'
          WHEN LOWER(${TABLE}.zone) LIKE '%planetradio.co.uk%' THEN 'Planet Radio'
          WHEN LOWER(${TABLE}.zone) LIKE '%lifestyle.one%' THEN 'Todays Golfer'
          WHEN LOWER(${TABLE}.zone) LIKE '%birmingham.freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${TABLE}.zone) LIKE '%coventry.freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${TABLE}.zone) LIKE '%blackcountry.freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${TABLE}.zone) LIKE '%shropshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${TABLE}.zone) LIKE '%worcestershire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${TABLE}.zone) LIKE '%80s.freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${TABLE}.zone) LIKE '%warwickshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${TABLE}.zone) LIKE '%herefordshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${TABLE}.zone) LIKE '%staffordshire.freeradioplayer.co.uk%' THEN 'Free'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplay.no%' THEN 'RadioPlay General'
          WHEN LOWER(${TABLE}.zone) LIKE '%radioplay.de%' THEN 'RadioPlay General'
          WHEN LOWER(${TABLE}.zone) LIKE '%foodtolovemagazine%' THEN 'Food To Love'
          WHEN LOWER(${TABLE}.zone) LIKE '%fateandfortunemagazine%' THEN 'Fate and Fortune'
          WHEN LOWER(${TABLE}.zone) LIKE '%spiritanddestiny%' THEN 'Spirit and Destiny'
          WHEN LOWER(${TABLE}.zone) LIKE '%am online%' THEN 'AM Online'
          WHEN LOWER(${TABLE}.zone) LIKE '%anglingtimes%' THEN 'Angling Times'
          WHEN LOWER(${TABLE}.zone) LIKE '%bikemagazine%' THEN 'Bike Magazine'
          WHEN LOWER(${TABLE}.zone) LIKE '%birdwatching%' THEN 'Bird Watching'
          WHEN LOWER(${TABLE}.zone) LIKE '%yours%' THEN 'Yours'
          WHEN LOWER(${TABLE}.zone) LIKE '%yourhorse%' THEN 'Your Horse'
          WHEN LOWER(${TABLE}.zone) LIKE '%trailrunningmag%' THEN 'Trail Running'
          WHEN LOWER(${TABLE}.zone) LIKE '%topsante%' THEN 'Top Sante'
          WHEN LOWER(${TABLE}.zone) LIKE '%steamrailway%' THEN 'Steam Railway'
          WHEN LOWER(${TABLE}.zone) LIKE '%ride%' THEN 'Ride'
          WHEN LOWER(${TABLE}.zone) LIKE '%rail%' THEN 'Rail Magazine'
          WHEN LOWER(${TABLE}.zone) LIKE '%practicalsportsbikesmag%' THEN 'Practical Sports Bikes'
          WHEN LOWER(${TABLE}.zone) LIKE '%practicalphotography%' THEN 'Practical Photography'
          WHEN LOWER(${TABLE}.zone) LIKE '%practicalfishkeeping%' THEN 'Practical Fishkeeping'
          WHEN LOWER(${TABLE}.zone) LIKE '%practicalclassics%' THEN 'Practical Classics'
          WHEN LOWER(${TABLE}.zone) LIKE '%petproductmarketing%' THEN 'Pet Product Marketing'
          WHEN LOWER(${TABLE}.zone) LIKE '%performancebikes%' THEN 'Performance Bikes'
          WHEN LOWER(${TABLE}.zone) LIKE '%moderngardensmagazine%' THEN 'Modern Gardens'
          WHEN LOWER(${TABLE}.zone) LIKE '%model-rail%' THEN 'Model Rail'
          WHEN LOWER(${TABLE}.zone) LIKE '%mcnsport%' THEN 'MCN Sports'
          WHEN LOWER(${TABLE}.zone) LIKE '%lro.com%' THEN 'Landrover Owner'
          WHEN LOWER(${TABLE}.zone) LIKE '%landscapemagazine%' THEN 'Landscape'
          WHEN LOWER(${TABLE}.zone) LIKE '%horsedeals%' THEN 'Horse Deals'
          WHEN LOWER(${TABLE}.zone) LIKE '%gofishing%' THEN 'Go Fishing'
          WHEN LOWER(${TABLE}.zone) LIKE '%gardennewsmagazine%' THEN 'Garden News'
          WHEN LOWER(${TABLE}.zone) LIKE '%gardenanswersmagazine%' THEN 'Garden Answers'
          WHEN LOWER(${TABLE}.zone) LIKE '%fleetnews%' THEN 'Fleetnews'
          WHEN LOWER(${TABLE}.zone) LIKE '%commercial fleet%' THEN 'Commercial Fleet'
          WHEN LOWER(${TABLE}.zone) LIKE '%classiccarweekly%' THEN 'Classic Car Weekly'
          WHEN LOWER(${TABLE}.zone) LIKE '%classiccarsmagazine%' THEN 'Classic Cars'
          WHEN LOWER(${TABLE}.zone) LIKE '%classicbike%' THEN 'Classic Bikes'
          WHEN LOWER(${TABLE}.zone) LIKE '%carmechanicsmag%' THEN 'Car Mechanics'
          WHEN LOWER(${TABLE}.zone) LIKE '%empire%' THEN 'Empire'
          WHEN LOWER(${TABLE}.zone) LIKE '%todays golfer%' THEN 'Today''s Golfer'
          WHEN LOWER(${TABLE}.zone) LIKE '%closer%' THEN 'Closer'
          WHEN LOWER(${TABLE}.zone) LIKE '%grazia%' THEN 'Grazia'
          WHEN LOWER(${TABLE}.zone) LIKE '%mcn%' THEN 'Motorcyclenews'
          WHEN LOWER(${TABLE}.zone) LIKE '%motherandbaby%' THEN 'Mother & Baby'
          WHEN LOWER(${TABLE}.zone) LIKE '%ccfs%' THEN 'Classic Cars for Sale'
          WHEN LOWER(${TABLE}.zone) LIKE '%thedebrief%' THEN 'The Debrief'
          WHEN LOWER(${TABLE}.zone) LIKE '%_ros_%' THEN 'ROS'
          WHEN LOWER(${TABLE}.zone) LIKE '%fleet news%' THEN 'Fleet News'
          WHEN LOWER(${TABLE}.zone) LIKE '%bcn radio - romp%' THEN 'BCN Radio'
          WHEN LOWER(${TABLE}.zone) LIKE '%national radio - romp%' THEN 'National Radio'
          ELSE LOWER(${TABLE}.zone)
        END
         ;;
  }


  measure: count {
    hidden: no
    type: count
    drill_fields: []
  }
}
