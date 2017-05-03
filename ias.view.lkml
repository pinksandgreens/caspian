view: ias {
  sql_table_name: ad_platform.ias ;;

  dimension: adsize {
    type: string
    sql: ${TABLE}.adsize ;;
  }

  dimension: adultsc {
    type: string
    sql: ${TABLE}.adultsc ;;
  }

  dimension: alcoholsc {
    type: string
    sql: ${TABLE}.alcoholsc ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: bundleid {
    type: string
    sql: ${TABLE}.bundleid ;;
  }

  dimension: cluttersc {
    type: string
    sql: ${TABLE}.cluttersc ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: crossdomainflag {
    type: string
    sql: ${TABLE}.crossdomainflag ;;
  }

  dimension: custom {
    type: string
    sql: ${TABLE}.custom ;;
  }

  dimension: datereceived {
    type: string
    sql: ${TABLE}.datereceived ;;
  }

  dimension: dma {
    type: string
    sql: ${TABLE}.dma ;;
  }

  dimension: downloadsc {
    type: string
    sql: ${TABLE}.downloadsc ;;
  }

  dimension: drugsc {
    type: string
    sql: ${TABLE}.drugsc ;;
  }

  dimension: extadnetworkid {
    type: string
    sql: ${TABLE}.extadnetworkid ;;
  }

  dimension: extadvertiserid {
    type: string
    sql: ${TABLE}.extadvertiserid ;;
  }

  dimension: extcampaignid {
    type: string
    sql: ${TABLE}.extcampaignid ;;
  }

  dimension: extchannelid {
    type: string
    sql: ${TABLE}.extchannelid ;;
  }

  dimension: extplacementid {
    type: string
    sql: ${TABLE}.extplacementid ;;
  }

  dimension: extpublisherid {
    type: string
    sql: ${TABLE}.extpublisherid ;;
  }

  dimension: fraudcategory {
    type: string
    sql: ${TABLE}.fraudcategory ;;
  }

  dimension: fullurl {
    type: string
    sql: ${TABLE}.fullurl ;;
  }

  dimension: fullyinview0s {
    type: string
    sql: ${TABLE}.fullyinview0s ;;
  }

  dimension: fullyinview15s {
    type: string
    sql: ${TABLE}.fullyinview15s ;;
  }

  dimension: fullyinview1s {
    type: string
    sql: ${TABLE}.fullyinview1s ;;
  }

  dimension: fullyinview5s {
    type: string
    sql: ${TABLE}.fullyinview5s ;;
  }

  dimension: fullyinviewtime {
    type: string
    sql: ${TABLE}.fullyinviewtime ;;
  }

  dimension: gamblingscore {
    type: string
    sql: ${TABLE}.gamblingscore ;;
  }

  dimension: hatesc {
    type: string
    sql: ${TABLE}.hatesc ;;
  }

  dimension: hithour {
    type: string
    sql: ${TABLE}.hithour ;;
  }

  dimension: host {
    type: string
    sql: ${TABLE}.host ;;
  }

  dimension: host1 {
    type: string
    label: "Brand Code"
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
    sql: ${TABLE}.iabcategories ;;
  }

  dimension: invalidtraffictype {
    type: string
    sql: ${TABLE}.invalidtraffictype ;;
  }

  dimension: invideosample {
    type: string
    sql: ${TABLE}.invideosample ;;
  }

  dimension: inview15s {
    type: string
    sql: ${TABLE}.inview15s ;;
  }

  dimension: inview1s {
    type: string
    sql: ${TABLE}.inview1s ;;
  }

  dimension: inview5s {
    type: string
    sql: ${TABLE}.inview5s ;;
  }

  dimension: inviewabilitysample {
    type: string
    sql: ${TABLE}.inviewabilitysample ;;
  }

  dimension: inviewfield {
    type: string
    sql: ${TABLE}.inviewfield ;;
  }

  dimension: inviewtime {
    type: string
    sql: ${TABLE}.inviewtime ;;
  }

  dimension: ipaddress {
    type: string
    sql: ${TABLE}.ipaddress ;;
  }

  dimension: maxfractioninview {
    type: string
    sql: ${TABLE}.maxfractioninview ;;
  }

  dimension: measurable {
    type: string
    sql: ${TABLE}.measurable ;;
  }

  dimension: mediatype {
    type: string
    sql: ${TABLE}.mediatype ;;
  }

  dimension: noviewabilityreason {
    type: string
    sql: ${TABLE}.noviewabilityreason ;;
  }

  dimension: offensivelanguagesc {
    type: string
    sql: ${TABLE}.offensivelanguagesc ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: pubcreative {
    type: string
    sql: ${TABLE}.pubcreative ;;
  }

  dimension: puborder {
    type: string
    sql: ${TABLE}.puborder ;;
  }

  dimension: sadscore {
    type: string
    sql: ${TABLE}.sadscore ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: timereceived {
    type: string
    sql: ${TABLE}.timereceived ;;
  }

  dimension: traqbucket {
    type: string
    sql: ${TABLE}.traqbucket ;;
  }

  dimension: useragentstr {
    type: string
    sql: ${TABLE}.useragentstr ;;
  }

  dimension: video1qcompleted {
    type: string
    sql: ${TABLE}.video1qcompleted ;;
  }

  dimension: video1qinview {
    type: string
    sql: ${TABLE}.video1qinview ;;
  }

  dimension: video2qcompleted {
    type: string
    sql: ${TABLE}.video2qcompleted ;;
  }

  dimension: video2qinview {
    type: string
    sql: ${TABLE}.video2qinview ;;
  }

  dimension: video3qcompleted {
    type: string
    sql: ${TABLE}.video3qcompleted ;;
  }

  dimension: video3qinview {
    type: string
    sql: ${TABLE}.video3qinview ;;
  }

  dimension: video4qcompleted {
    type: string
    sql: ${TABLE}.video4qcompleted ;;
  }

  dimension: video4qinview {
    type: string
    sql: ${TABLE}.video4qinview ;;
  }

  dimension: videoinview {
    type: string
    sql: ${TABLE}.videoinview ;;
  }

  dimension: videomuted {
    type: string
    sql: ${TABLE}.videomuted ;;
  }

  dimension: videoneverstarted {
    type: string
    sql: ${TABLE}.videoneverstarted ;;
  }

  dimension: violencesc {
    type: string
    sql: ${TABLE}.violencesc ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
