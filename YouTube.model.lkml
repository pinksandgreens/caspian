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
