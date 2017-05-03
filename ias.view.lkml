view: ias {
  sql_table_name: ad_platform.ias ;;

  dimension: host1 {
    type: string
    label: "Brand Code"
    view_label: "Data Fields"
    sql: CASE
   WHEN ${TABLE}.host LIKE '%http://absoluteradio.co.uk%' THEN 'ABR'
   WHEN ${TABLE}.host LIKE '%http://carmagazine.co.uk%' THEN 'CAR'
   WHEN ${TABLE}.host LIKE '%http://carmechanicsmag.co.uk%' THEN 'CMC'
   WHEN ${TABLE}.host LIKE '%http://forsale.lro.com%' THEN 'LRO'
   WHEN ${TABLE}.host LIKE '%http://kissfresh.kissfmuk.com%' THEN 'KIS'
   WHEN ${TABLE}.host LIKE '%http://kisstory.kissfmuk.com%' THEN 'KIS'
   WHEN ${TABLE}.host LIKE '%http://lifestyle.one%' THEN 'NO CODE'
   WHEN ${TABLE}.host LIKE '%http://motherandbaby.co.uk%' THEN 'MAB'
   WHEN ${TABLE}.host LIKE '%http://motorcyclenews.com%' THEN 'MCN'
   WHEN ${TABLE}.host LIKE '%http://parkers.bauercdn.com%' THEN 'PCP'
   WHEN ${TABLE}.host LIKE '%http://parkers.car-costs.co.uk%' THEN 'PCP'
   WHEN ${TABLE}.host LIKE '%http://planetradio.co.uk%' THEN 'PLR'
   WHEN ${TABLE}.host LIKE '%http://practicalfishkeeping.co.uk%' THEN 'PFI'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.clyde1.com%' THEN 'CL1'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.coolfm.co.uk%' THEN 'COO'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.downtown.co.uk%' THEN 'DOW'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.kissfmuk.com%' THEN 'KIS'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.magic.co.uk%' THEN 'MAG'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.magicsoul.co.uk%' THEN 'MAG'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.metroradio.co.uk%' THEN 'MET'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.planetrock.com%' THEN 'PLR'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.radiocity.co.uk%' THEN 'RCT'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.radiocity2.co.uk%' THEN 'RC2'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.rockfm.co.uk%' THEN 'ROC'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.thehitsradio.com%' THEN 'HIT'
   WHEN ${TABLE}.host LIKE '%http://www.am-online.com%' THEN 'B2B'
   WHEN ${TABLE}.host LIKE '%http://www.anglingtimes.co.uk%' THEN 'ATI'
   WHEN ${TABLE}.host LIKE '%http://www.bikemagazine.co.uk%' THEN 'BIK'
   WHEN ${TABLE}.host LIKE '%http://www.birdwatching.co.uk%' THEN 'BWT'
   WHEN ${TABLE}.host LIKE '%http://www.carmagazine.co.uk%' THEN 'CAR'
   WHEN ${TABLE}.host LIKE '%http://www.carmechanicsmag.co.uk%' THEN 'CMC'
   WHEN ${TABLE}.host LIKE '%http://www.classicbike.co.uk%' THEN 'CLB'
   WHEN ${TABLE}.host LIKE '%http://www.classiccarsforsale.co.uk%' THEN 'CCS'
   WHEN ${TABLE}.host LIKE '%http://www.classiccarsmagazine.co.uk%' THEN 'CLC'
   WHEN ${TABLE}.host LIKE '%http://www.classiccarweekly.co.uk%'THEN 'CCW'
   WHEN ${TABLE}.host LIKE '%http://www.commercialfleet.org%' THEN 'B2B'
   WHEN ${TABLE}.host LIKE '%http://www.empireonline.com%' THEN 'EMP'
   WHEN ${TABLE}.host LIKE '%http://www.fateandfortunemagazine.co.uk%' THEN 'F&F'
   WHEN ${TABLE}.host LIKE '%http://www.fleetnews.co.uk%' THEN 'FLN'
   WHEN ${TABLE}.host LIKE '%http://www.forth2.com%' THEN 'FO2'
   WHEN ${TABLE}.host LIKE '%http://www.gardenanswersmagazine.co.uk%' THEN 'GAN'
   WHEN ${TABLE}.host LIKE '%http://www.gardennewsmagazine.co.uk%' THEN 'GNW'
   WHEN ${TABLE}.host LIKE '%http://www.horsedeals.co.uk%' THEN 'HDE'
   WHEN ${TABLE}.host LIKE '%http://www.kissfmuk.com%'THEN 'KIS'
   WHEN ${TABLE}.host LIKE '%http://www.landscapemagazine.co.uk%' THEN 'LSC'
   WHEN ${TABLE}.host LIKE '%http://www.livefortheoutdoors.com%' THEN 'LFT'
   WHEN ${TABLE}.host LIKE '%http://www.matchfootball.co.uk%' THEN 'MAT'
   WHEN ${TABLE}.host LIKE '%http://www.mcnsport.co.uk%' THEN 'MCS'
   WHEN ${TABLE}.host LIKE '%http://www.model-rail.co.uk%' THEN 'MDR'
   WHEN ${TABLE}.host LIKE '%http://www.moderngardensmagazine.co.uk%' THEN 'MOG'
   WHEN ${TABLE}.host LIKE '%http://www.motherandbaby.co.uk%' THEN 'MAB'
   WHEN ${TABLE}.host LIKE '%http://www.motorcyclenews.com%' THEN 'MCN'
   WHEN ${TABLE}.host LIKE '%http://www.parkers.co.uk%' THEN 'PCP'
   WHEN ${TABLE}.host LIKE '%http://www.performancebikes.co.uk%' THEN 'PBK'
   WHEN ${TABLE}.host LIKE '%http://www.petproductmarketing.co.uk%' THEN 'PPM'
   WHEN ${TABLE}.host LIKE '%http://www.planetrock.com%' THEN 'PLR'
   WHEN ${TABLE}.host LIKE '%http://www.practicalclassics.co.uk%' THEN 'PRC'
   WHEN ${TABLE}.host LIKE '%http://www.practicalfishkeeping.co.uk%' THEN 'PFI'
   WHEN ${TABLE}.host LIKE '%http://www.practicalphotography.com%' THEN 'PFP'
   WHEN ${TABLE}.host LIKE '%http://www.practicalsportsbikesmag.co.uk%' THEN 'PRS'
   WHEN ${TABLE}.host LIKE '%http://www.railmagazine.com%' THEN 'RAI'
   WHEN ${TABLE}.host LIKE '%http://www.ride.co.uk%' THEN 'RDE'
   WHEN ${TABLE}.host LIKE '%http://www.seaangler.co.uk%' THEN 'SAN'
   WHEN ${TABLE}.host LIKE '%http://www.steamrailway.co.uk%' THEN 'SRA'
   WHEN ${TABLE}.host LIKE '%http://www.thedebrief.co.uk%' THEN 'DBF'
   WHEN ${TABLE}.host LIKE '%http://www.todaysgolfer.co.uk%' THEN 'TDG'
   WHEN ${TABLE}.host LIKE '%http://www.trailrunningmag.co.uk%' THEN 'TRR'
   WHEN ${TABLE}.host LIKE '%http://www.troutfisherman.co.uk%' THEN 'TFI'
   WHEN ${TABLE}.host LIKE '%http://www.yourhorse.co.uk%' THEN 'YHS'
   WHEN ${TABLE}.host LIKE '%http://www.yours.co.uk%' THEN 'YRS'
   WHEN ${TABLE}.host LIKE '%https://absoluteradio.co.uk%' THEN 'ABR'
   WHEN ${TABLE}.host LIKE '%https://forsale.lro.com%' THEN 'LRO'
   WHEN ${TABLE}.host LIKE '%https://forum.practicalfishkeeping.co.uk%' THEN 'PFI'
   WHEN ${TABLE}.host LIKE '%https://planetradio.co.uk%' THEN 'NO CODE'
   WHEN ${TABLE}.host LIKE '%https://www.anglingtimes.co.uk%' THEN 'ATI'
   WHEN ${TABLE}.host LIKE '%https://www.carpfeed.com%' THEN 'NO CODE'
   WHEN ${TABLE}.host LIKE '%https://www.classiccarsforsale.co.uk%' THEN 'CCS'
   WHEN ${TABLE}.host LIKE '%https://www.fateandfortunemagazine.co.uk%' THEN 'F&F'
   WHEN ${TABLE}.host LIKE '%https://www.fleetnews.co.uk%' THEN 'FLN'
   WHEN ${TABLE}.host LIKE '%https://www.foodtolovemagazine.co.uk%' THEN 'NO CODE'
   WHEN ${TABLE}.host LIKE '%https://www.landscapemagazine.co.uk%' THEN 'LSC'
   WHEN ${TABLE}.host LIKE '%https://www.livefortheoutdoors.com%' THEN 'LFT'
   WHEN ${TABLE}.host LIKE '%https://www.lro.com%' THEN 'LRO'
   WHEN ${TABLE}.host LIKE '%https://www.motherandbaby.co.uk%' THEN 'M&B'
   WHEN ${TABLE}.host LIKE '%https://www.practicalfishkeeping.co.uk%' THEN 'PFI'
   WHEN ${TABLE}.host LIKE '%https://www.spiritanddestiny.co.uk%' THEN 'NO CODE'
   WHEN ${TABLE}.host LIKE '%https://www.thedebrief.co.uk%' THEN 'DBF'
   WHEN ${TABLE}.host LIKE '%https://www.yours.co.uk%' THEN 'YRS'
   ELSE 'UNKNOWN'
   END
         ;;
  }

  dimension: host2 {
    type: string
    label: "Brand Description"
    view_label: "Data Fields"
    sql: CASE
   WHEN ${TABLE}.host LIKE '%http://absoluteradio.co.uk%' THEN 'Absolute Radio'
   WHEN ${TABLE}.host LIKE '%http://carmagazine.co.uk%' THEN 'Car Magazine'
   WHEN ${TABLE}.host LIKE '%http://carmechanicsmag.co.uk%' THEN 'Car Mechanics'
   WHEN ${TABLE}.host LIKE '%http://forsale.lro.com%' THEN 'Land Rover Owner'
   WHEN ${TABLE}.host LIKE '%http://kissfresh.kissfmuk.com%' THEN 'Kiss FM'
   WHEN ${TABLE}.host LIKE '%http://kisstory.kissfmuk.com%' THEN 'Kiss'
   WHEN ${TABLE}.host LIKE '%http://lifestyle.one%' THEN 'Lifestyle One'
   WHEN ${TABLE}.host LIKE '%http://motherandbaby.co.uk%' THEN 'Mother & Baby'
   WHEN ${TABLE}.host LIKE '%http://motorcyclenews.com%' THEN 'Motorcycle News'
   WHEN ${TABLE}.host LIKE '%http://parkers.bauercdn.com%' THEN 'Parkers'
   WHEN ${TABLE}.host LIKE '%http://parkers.car-costs.co.uk%' THEN 'Parkers'
   WHEN ${TABLE}.host LIKE '%http://planetradio.co.uk%' THEN 'Planet Radio'
   WHEN ${TABLE}.host LIKE '%http://practicalfishkeeping.co.uk%' THEN 'Practical Fishkeeping'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.clyde1.com%' THEN 'Clyde 1'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.coolfm.co.uk%' THEN 'Cool FM'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.downtown.co.uk%' THEN 'Downtown'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.kissfmuk.com%' THEN 'Kiss'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.magic.co.uk%' THEN 'Magic'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.magicsoul.co.uk%' THEN 'Magic Soul'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.metroradio.co.uk%' THEN 'Metro Radio'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.planetrock.com%' THEN 'Planet Rock'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.radiocity.co.uk%' THEN 'Radio City'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.radiocity2.co.uk%' THEN 'Radio City 2'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.rockfm.co.uk%' THEN 'Rock FM'
   WHEN ${TABLE}.host LIKE '%http://radioplayer.thehitsradio.com%' THEN 'The Hits Radio'
   WHEN ${TABLE}.host LIKE '%http://www.am-online.com%' THEN 'AM Online'
   WHEN ${TABLE}.host LIKE '%http://www.anglingtimes.co.uk%' THEN 'Angling Times'
   WHEN ${TABLE}.host LIKE '%http://www.bikemagazine.co.uk%' THEN 'Bike'
   WHEN ${TABLE}.host LIKE '%http://www.birdwatching.co.uk%' THEN 'Bird Watching'
   WHEN ${TABLE}.host LIKE '%http://www.carmagazine.co.uk%' THEN 'Car Magazine'
   WHEN ${TABLE}.host LIKE '%http://www.carmechanicsmag.co.uk%' THEN 'Car Mechanics'
   WHEN ${TABLE}.host LIKE '%http://www.classicbike.co.uk%' THEN 'Classic Bike'
   WHEN ${TABLE}.host LIKE '%http://www.classiccarsforsale.co.uk%' THEN 'Classic Cars For Sale'
   WHEN ${TABLE}.host LIKE '%http://www.classiccarsmagazine.co.uk%' THEN 'Classic Cars'
   WHEN ${TABLE}.host LIKE '%http://www.classiccarweekly.co.uk%' THEN 'Classic Car Weekly'
   WHEN ${TABLE}.host LIKE '%http://www.commercialfleet.org%' THEN 'Commercial Fleet'
   WHEN ${TABLE}.host LIKE '%http://www.empireonline.com%' THEN 'Empire'
   WHEN ${TABLE}.host LIKE '%http://www.fateandfortunemagazine.co.uk%' THEN 'Fate & Fortune'
   WHEN ${TABLE}.host LIKE '%http://www.fleetnews.co.uk%' THEN 'Fleet News'
   WHEN ${TABLE}.host LIKE '%http://www.forth2.com%' THEN 'Forth 2'
   WHEN ${TABLE}.host LIKE '%http://www.gardenanswersmagazine.co.uk%' THEN 'Garden Answers'
   WHEN ${TABLE}.host LIKE '%http://www.gardennewsmagazine.co.uk%' THEN 'Garden News'
   WHEN ${TABLE}.host LIKE '%http://www.horsedeals.co.uk%' THEN 'Horse Deals'
   WHEN ${TABLE}.host LIKE '%http://www.kissfmuk.com%' THEN 'Kiss FM'
   WHEN ${TABLE}.host LIKE '%http://www.landscapemagazine.co.uk%' THEN 'LandScape'
   WHEN ${TABLE}.host LIKE '%http://www.livefortheoutdoors.com%' THEN 'Live for the Outdoors'
   WHEN ${TABLE}.host LIKE '%http://www.matchfootball.co.uk%' THEN 'Match'
   WHEN ${TABLE}.host LIKE '%http://www.mcnsport.co.uk%' THEN 'MCN Sport'
   WHEN ${TABLE}.host LIKE '%http://www.model-rail.co.uk%' THEN 'Model Rail'
   WHEN ${TABLE}.host LIKE '%http://www.moderngardensmagazine.co.uk%' THEN 'Modern Gardens'
   WHEN ${TABLE}.host LIKE '%http://www.motherandbaby.co.uk%' THEN 'Mother & Baby'
   WHEN ${TABLE}.host LIKE '%http://www.motorcyclenews.com%' THEN 'Motorcycle News'
   WHEN ${TABLE}.host LIKE '%http://www.parkers.co.uk%' THEN 'Parkers'
   WHEN ${TABLE}.host LIKE '%http://www.performancebikes.co.uk%' THEN 'Performance Bikes'
   WHEN ${TABLE}.host LIKE '%http://www.petproductmarketing.co.uk%' THEN 'Pet Product Marketing'
   WHEN ${TABLE}.host LIKE '%http://www.planetrock.com%' THEN 'Planet Rock'
   WHEN ${TABLE}.host LIKE '%http://www.practicalclassics.co.uk%' THEN 'Practical Classics'
   WHEN ${TABLE}.host LIKE '%http://www.practicalfishkeeping.co.uk%' THEN 'Practical Fishkeeping'
   WHEN ${TABLE}.host LIKE '%http://www.practicalphotography.com%' THEN 'Practical Photography'
   WHEN ${TABLE}.host LIKE '%http://www.practicalsportsbikesmag.co.uk%' THEN 'Practical Sportsbikes'
   WHEN ${TABLE}.host LIKE '%http://www.railmagazine.com%' THEN 'Rail'
   WHEN ${TABLE}.host LIKE '%http://www.ride.co.uk%' THEN 'Ride'
   WHEN ${TABLE}.host LIKE '%http://www.seaangler.co.uk%' THEN 'Sea Angler'
   WHEN ${TABLE}.host LIKE '%http://www.steamrailway.co.uk%' THEN 'Steam Railway'
   WHEN ${TABLE}.host LIKE '%http://www.thedebrief.co.uk%' THEN 'The Debrief'
   WHEN ${TABLE}.host LIKE '%http://www.todaysgolfer.co.uk%' THEN 'Todays Golfer'
   WHEN ${TABLE}.host LIKE '%http://www.trailrunningmag.co.uk%' THEN 'Trail Running'
   WHEN ${TABLE}.host LIKE '%http://www.troutfisherman.co.uk%' THEN 'Trout Fisherman'
   WHEN ${TABLE}.host LIKE '%http://www.yourhorse.co.uk%' THEN 'Your Horse'
   WHEN ${TABLE}.host LIKE '%http://www.yours.co.uk%' THEN 'Yours Magazine'
   WHEN ${TABLE}.host LIKE '%https://absoluteradio.co.uk%' THEN 'Absolute Radio'
   WHEN ${TABLE}.host LIKE '%https://forsale.lro.com%' THEN 'Land Rover Owner'
   WHEN ${TABLE}.host LIKE '%https://forum.practicalfishkeeping.co.uk%' THEN 'Practical Fishkeeping'
   WHEN ${TABLE}.host LIKE '%https://planetradio.co.uk%' THEN 'Planet Radio'
   WHEN ${TABLE}.host LIKE '%https://www.anglingtimes.co.uk%' THEN 'Angling Times'
   WHEN ${TABLE}.host LIKE '%https://www.carpfeed.com%' THEN 'Carp Feed'
   WHEN ${TABLE}.host LIKE '%https://www.classiccarsforsale.co.uk%' THEN 'Classic Cars For Sale'
   WHEN ${TABLE}.host LIKE '%https://www.fateandfortunemagazine.co.uk%' THEN 'Fate & Fortune'
   WHEN ${TABLE}.host LIKE '%https://www.fleetnews.co.uk%' THEN 'Fleet News'
   WHEN ${TABLE}.host LIKE '%https://www.foodtolovemagazine.co.uk%' THEN 'Food to Love'
   WHEN ${TABLE}.host LIKE '%https://www.landscapemagazine.co.uk%' THEN 'LandScape'
   WHEN ${TABLE}.host LIKE '%https://www.livefortheoutdoors.com%' THEN 'Live for the Outdoors'
   WHEN ${TABLE}.host LIKE '%https://www.lro.com%' THEN 'Land Rover Owner'
   WHEN ${TABLE}.host LIKE '%https://www.motherandbaby.co.uk%' THEN 'Mother & Baby'
   WHEN ${TABLE}.host LIKE '%https://www.practicalfishkeeping.co.uk%' THEN 'Practical Fishkeeping'
   WHEN ${TABLE}.host LIKE '%https://www.spiritanddestiny.co.uk%' THEN 'Spirit & Destiny'
   WHEN ${TABLE}.host LIKE '%https://www.thedebrief.co.uk%' THEN 'The Debrief'
   WHEN ${TABLE}.host LIKE '%https://www.yours.co.uk%' THEN 'Yours Magazine'
   ELSE 'Uknown'
    END;;
  }

  dimension: iabcategories {
    type: string
    label: "IAB Categories"
    view_label: "Data Fields"
    sql: ${TABLE}.iabcategories ;;
  }

  dimension: invalidtraffictype {
    type:  number
    hidden: yes
#     value_format_name: float
    label: "Invalid Traffic Type"
    sql: ${TABLE}.invalidtraffictype ;;
  }

  dimension: invalidtraffictype_desc {
    type:  string
    label: "Invalid Traffic Type Description"
    view_label: "Data Fields"
    sql: case
    WHEN ${TABLE}.invalidtraffictype LIKE '%0%' THEN 'Not Suspicious'
    WHEN ${TABLE}.invalidtraffictype LIKE '%1%' THEN 'General Invalid Traffic'
    WHEN ${TABLE}.invalidtraffictype LIKE '%2%' THEN 'Sophisticated invalid traffic'
      END
    ;;
  }

#100% VIEWABILITY METRICS  ############################################


  dimension: fullyinview0s {
    type: string
    view_label: "Viewability Metrics 100%"
    sql: ${TABLE}.fullyinview0s ;;
  }

  dimension: fullyinview15s {
    type: string
    view_label: "Viewability Metrics 100%"
    sql: ${TABLE}.fullyinview15s ;;
  }

  dimension: fullyinview1s {
    type: string
    view_label: "Viewability Metrics 100%"
    sql: ${TABLE}.fullyinview1s ;;
  }

  dimension: fullyinview5s {
    type: string
    view_label: "Viewability Metrics 100%"
    sql: ${TABLE}.fullyinview5s ;;
  }

  dimension: fullyinviewtime {
    type: string
    view_label: "Viewability Metrics 100%"
    sql: ${TABLE}.fullyinviewtime ;;
  }


#VIDEO ONLY FIELDS  ############################################

  dimension: invideosample {
    type:  string
    label: "In Video Sample"
    view_label: "Video Only Fields"
    sql:CASE
    WHEN ${TABLE}.invideosample = '1' THEN 'Impression was Measurable'
    WHEN ${TABLE}.invideosample = '0' THEN 'Impression was not Measurable'
    END;;
  }

  dimension: video1qcompleted {
    type: string
    view_label: "Video Only Fields"
    sql: ${TABLE}.video1qcompleted ;;
  }

  dimension: video1qinview {
    type: string
    view_label: "Video Only Fields"
    sql: ${TABLE}.video1qinview ;;
  }

  dimension: video2qcompleted {
    type: string
    view_label: "Video Only Fields"
    sql: ${TABLE}.video2qcompleted ;;
  }

  dimension: video2qinview {
    type: string
    view_label: "Video Only Fields"
    sql: ${TABLE}.video2qinview ;;
  }

  dimension: video3qcompleted {
    type: string
    view_label: "Video Only Fields"
    sql: ${TABLE}.video3qcompleted ;;
  }

  dimension: video3qinview {
    type: string
    view_label: "Video Only Fields"
    sql: ${TABLE}.video3qinview ;;
  }

  dimension: video4qcompleted {
    type: string
    view_label: "Video Only Fields"
    sql: ${TABLE}.video4qcompleted ;;
  }

  dimension: video4qinview {
    type: string
    view_label: "Video Only Fields"
    sql: ${TABLE}.video4qinview ;;
  }

  dimension: videoinview {
    type: string
    view_label: "Video Only Fields"
    sql: ${TABLE}.videoinview ;;
  }

  dimension: videomuted {
    type: string
    view_label: "Video Only Fields"
    sql: ${TABLE}.videomuted ;;
  }

  dimension: videoneverstarted {
    type: string
    view_label: "Video Only Fields"
    sql: ${TABLE}.videoneverstarted ;;
  }
############################################

# Log File Data Fields ############################################

#   dimension: datereceived {
#     type: date
#     timeframes:[date,day_of_month,day_of_week,day_of_week_index,week,week_of_year,month,month_name,month_num,year]
#     sql: ${TABLE}.datereceived ;;
#   }

  dimension_group: datereceived {
    label: "Date Recieved"
    view_label: "Data Fields"
    type: time
    timeframes: [time, date, week, month, month_num, month_name, week_of_year,day_of_week_index,hour_of_day,year]
    convert_tz: no
    sql: ${TABLE}.datereceived::timestamp ;;
  }

  dimension_group: hithour {
    type: time
    view_label: "Data Fields"
    label: "Hit Hour"
    timeframes: [time]
    convert_tz: no
    sql: ${TABLE}.hithour::timestamp ;;
  }

  dimension: ipaddress {
    type: string
    view_label: "Data Fields"
    label: "IP Address"
    sql: ${TABLE}.ipaddress ;;
  }

  dimension: downloadsc {
    type: string
    hidden: yes
    sql: ${TABLE}.downloadsc ;;
  }

  dimension: drugsc {
    type: string
    hidden: yes
    sql: ${TABLE}.drugsc ;;
  }

  dimension: extadnetworkid {
    type: string
    view_label: "Data Fields"
    label: "Network ID"
    sql: ${TABLE}.extadnetworkid ;;
  }

  dimension: extadvertiserid {
    type: string
    view_label: "Data Fields"
    label: "Advertiser ID"
    sql: ${TABLE}.extadvertiserid ;;
  }

  dimension: extcampaignid {
    type: string
    view_label: "Data Fields"
    label: "Campaign ID"
    sql: ${TABLE}.extcampaignid ;;
  }

  dimension: extchannelid {
    type: string
    view_label: "Data Fields"
    label: " Channel ID"
    sql: ${TABLE}.extchannelid ;;
  }

  dimension: extplacementid {
    type: string
    label: "Placement ID"
    view_label: "Data Fields"
    sql: ${TABLE}.extplacementid ;;
  }

  dimension: extpublisherid {
    type: string
    view_label: "Data Fields"
    label: "Publisher ID"
    sql: ${TABLE}.extpublisherid ;;
  }

  dimension: fraudcategory {
    view_label: "Data Fields"
    type: string
    hidden: yes
    sql: ${TABLE}.fraudcategory ;;
  }

  dimension: fullurl {
    type: string
    view_label: "Data Fields"
    label: " Full URL of Pixel"
    sql: ${TABLE}.fullurl ;;
  }

  dimension: dma {
    type: string
    hidden: yes
    sql: ${TABLE}.dma ;;
  }

  dimension: host {
    type: string
    view_label: "Data Fields"
    label: "Host"
    sql: ${TABLE}.host ;;
  }

  dimension: adsize {
    type: string
    label: "Ad Size"
    view_label: "Data Fields"
    sql: ${TABLE}.adsize ;;
  }

  dimension: adultsc {
    type: string
    hidden: yes
    sql: ${TABLE}.adultsc ;;
  }

  dimension: alcoholsc {
    type: string
    hidden: yes
    sql: ${TABLE}.alcoholsc ;;
  }

  dimension: browser {
    type: string
    view_label: "Data Fields"
    label: "Browser"
    sql: ${TABLE}.browser ;;
  }

  dimension: bundleid {
    type: string
    hidden: yes
    sql: ${TABLE}.bundleid ;;
  }

  dimension: cluttersc {
    type: string
    hidden: yes
    sql: ${TABLE}.cluttersc ;;
  }

  dimension: country {
    type: string
    view_label: "Data Fields"
    label: "Country Code"
    sql:${TABLE}.country ;;
  }

  dimension: country1 {
    type: string
    view_label: "Data Fields"
    label: "GB/Rest of World"
    sql: case
    WHEN ${TABLE}.country = 'GB' THEN 'Great Britain'
    ELSE 'Rest of World'
    END;;
  }

  dimension: crossdomainflag {
    type: string
    label: "Cross Domain Flag"
    view_label: "Data Fields"
    sql:case
       WHEN ${TABLE}.crossdomainflag = '1' THEN 'Direct placement'
       WHEN ${TABLE}.crossdomainflag = '2' THEN 'Friendly iframe'
       WHEN ${TABLE}.crossdomainflag = '3' THEN 'Unfriendly iframe/cross-domain'
       WHEN ${TABLE}.crossdomainflag = '4' THEN 'Unknown'
    END;;
  }

  dimension: custom {
    type: string
    hidden: yes
    sql: ${TABLE}.custom ;;
  }

  dimension: gamblingscore {
    type: string
    hidden: yes
    sql: ${TABLE}.gamblingscore ;;
  }

  dimension: hatesc {
    type: string
    hidden: yes
    sql: ${TABLE}.hatesc ;;
  }

  dimension: inviewtime {
    type: number
    label: "In View Time"
    view_label: "View Time"
#     needs casing but majority of data is 0 or 1 then 5 so no point bothering with decimals...
    sql: ${TABLE}.inviewtime ;;
  }

  dimension: inview1s {
    type: string
    label: "In View 1 Second"
    view_label: "View Time"
    sql: ${TABLE}.inview1s ;;
  }

  dimension: inview5s {
    type: string
    label: "In View 5 Seconds"
    view_label: "View Time"
    sql: ${TABLE}.inview5s ;;
  }

  dimension: inview15s {
    type: string
    label: "In View 15 Seconds"
    view_label: "View Time"
    sql: ${TABLE}.inview15s ;;
  }

  dimension: maxfractioninview {
    type: string
    hidden: yes
    sql: ${TABLE}.maxfractioninview ;;
  }

  dimension: measurable {
    type: string
    label: "Impression is Measurable"
    view_label: "Data Fields"
    sql: case
     WHEN ${TABLE}.measurable = '0' THEN 'Not Measurable'
     WHEN ${TABLE}.measurable = '1' THEN 'Measurable'
      END ;;
  }

  dimension: mediatype {
    type: string
    hidden: yes
#     just has value of display
    sql: ${TABLE}.mediatype ;;
  }

  dimension: noviewabilityreason {
    type: string
    label: "No Viewability Reason"
    view_label: "Data Fields"
    sql: case
  WHEN ${TABLE}.noviewabilityreason = 'null' THEN 'Null'
  WHEN ${TABLE}.noviewabilityreason = 'No Javascript'THEN 'No Javascript'
  WHEN ${TABLE}.noviewabilityreason = 'Broken Javascript' THEN 'Broken Javascript'
  WHEN ${TABLE}.noviewabilityreason = 'Mobile' THEN 'Mobile'
  WHEN ${TABLE}.noviewabilityreason = 'No Flash Load' THEN 'No Flash Load'
  WHEN ${TABLE}.noviewabilityreason = 'Unknown' THEN 'Unknown'
   END ;;
  }

  dimension: offensivelanguagesc {
    type: string
    hidden: yes
    sql: ${TABLE}.offensivelanguagesc ;;
  }

  dimension: os {
    type: string
    label: "Operating System"
    view_label: "Data Fields"
    sql: case
    WHEN ${TABLE}.os = 'OTHER' THEN 'Other'
    WHEN ${TABLE}.os = 'LINUX' THEN 'Linux'
    WHEN ${TABLE}.os = 'WINDOWS' THEN 'Windows'
    WHEN ${TABLE}.os = 'MAC_OS_X' THEN 'Mac OS X'
    ELSE 'Uknown'
    END;;
  }

  dimension: platform {
    type: string
    view_label: "Data Fields"
    label: "Device Platform"
    sql: case
   WHEN ${TABLE}.platform = 'IPHONE' THEN 'iPhone'
   WHEN ${TABLE}.platform = 'ANDROID_PHONE' THEN 'Android Phone'
   WHEN ${TABLE}.platform = 'COMPUTER' THEN 'Computer'
   WHEN ${TABLE}.platform = 'IPAD' THEN 'iPad'
   WHEN ${TABLE}.platform = 'ANDROID_TABLET' THEN 'Android Tablet'
   WHEN ${TABLE}.platform = 'MOBILE_OTHER' THEN 'Mobile Other'
    END ;;
  }

  dimension: pubcreative {
    type: string
    label: "Publisher Creative"
    view_label: "Data Fields"
    sql: ${TABLE}.pubcreative ;;
  }

  dimension: puborder {
    type: string
    label: "Publisher Order"
    view_label: "Data Fields"
    sql: ${TABLE}.puborder ;;
  }

  dimension: sadscore {
    type: string
    hidden: yes
    sql: ${TABLE}.sadscore ;;
  }

  dimension: state {
    type: string
    hidden: yes
    sql: ${TABLE}.state ;;
  }

  dimension: timereceived {
    type: string
    hidden: yes
    sql: ${TABLE}.timereceived ;;
  }

  dimension: traqbucket {
    type: string
    hidden: yes
    sql: ${TABLE}.traqbucket ;;
  }

  dimension: useragentstr {
    type: string
    hidden: yes
#     can revisit but is grouped in OS and Platform
    sql: ${TABLE}.useragentstr ;;
  }

  dimension: violencesc {
    type: string
    hidden: yes
    sql: ${TABLE}.violencesc ;;
  }

  dimension: inviewabilitysample {
    type: string
    hidden: yes
    sql: ${TABLE}.inviewabilitysample ;;
  }

  dimension: inviewfield {
    type: string
    label: "In View Field"
    view_label: "Data Fields"
    sql: case
    WHEN ${TABLE}.inviewfield = 'outOfView' THEN 'Out of View'
    WHEN ${TABLE}.inviewfield = 'inView' THEN 'In View'
    WHEN ${TABLE}.inviewfield = 'N/A' THEN 'N/A'
    END



;;
  }


############################################


# ALL THE MEASURES


  measure: count {
    type: count
    label: "Count"
    view_label: "Measures"
    drill_fields: []
  }
}
