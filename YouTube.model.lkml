connection: "bigquery-connection"

# include all views in this project
include: "*.view"

# include all dashboards in this project
include: "*.dashboard"

label: "YouTube"


explore: youtube_basic {
  label: "YouTube - Basic"
}

explore: youtube_ad_estimated_revenue {
  label: "YouTube - Revenue"
}

explore:youtube_demogs {
  label: "YouTube - Demographics"
}


explore:youtube_devices {
  label: "YouTube - Devices"
}

explore:youtube_playback_location {
  label: "YouTube - Playback Location"
}

explore: youtube_videos {
  label: "YouTube - TestingA"

  join: youtube_ad_estimated_revenue  {
    type: left_outer
    relationship: many_to_one
    sql_on: ${youtube_videos.video_id} = ${youtube_ad_estimated_revenue.video_id} ;;
  }

  join: youtube_demogs  {
    type: left_outer
    relationship: many_to_one
    sql_on: ${youtube_videos.video_id} = ${youtube_demogs.video_id} ;;
    }

  join: youtube_playback_location  {
    type: left_outer
    relationship: many_to_one
    sql_on: ${youtube_videos.video_id} = ${youtube_playback_location.video_id} ;;
  }

  join: youtube_basic  {
    type: left_outer
    relationship: many_to_one
    sql_on: ${youtube_videos.video_id} = ${youtube_basic.video_id} ;;
  }

  join: youtube_devices  {
    type: left_outer
    relationship: many_to_one
    sql_on: ${youtube_videos.video_id} = ${youtube_devices.video_id} ;;
  }

}

#explore: youtube_all {
#  from: youtube_basic
#  label: "YouTube - ALL"
#
#  join: youtube_ad_estimated_revenue  {
#    type: left_outer
#    relationship: one_to_many
#    sql_on: ${youtube_ad_estimated_revenue.video_id} = ${youtube_all.video_id} ;;
#  }#
#
#  join: youtube_demogs  {
#    type: left_outer
#    relationship: one_to_many
#    sql_on: ${youtube_demogs.video_id} = ${youtube_all.video_id} ;;
#  }#
#
#  join: youtube_devices  {
#    type: left_outer
#    relationship: one_to_many
#    sql_on: ${youtube_devices.video_id} = ${youtube_all.video_id} ;;
#  }
#
#  join: youtube_playback_location  {
#    type: left_outer
#    relationship: one_to_many
#    sql_on: ${youtube_playback_location.video_id} = ${youtube_all.video_id} ;;
#  }
#
#}
#explore: youtube_rev_and_playback {
#  from: youtube_playback_location
#  label: "YouTube - Playback + Revenue"

  #join: youtube_ad_estimated_revenue  {
  #  type: left_outer
  #  relationship: one_to_many
  #  sql_on: ${youtube_ad_estimated_revenue.video_id} = ${youtube_rev_and_playback.video_id} ;;
  #}

  explore: jr_yt_onsite_offsite_revenue {
    label: "YouTube On-Site/Off-site Revenue and Views"

    join: social_youtube_advanced {
      type: left_outer
      relationship: one_to_one
      sql_on: ${jr_yt_onsite_offsite_revenue.video_id} = ${social_youtube_advanced.video_id} ;;
    }


  }
