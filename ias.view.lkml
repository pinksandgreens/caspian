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
