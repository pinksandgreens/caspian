view: jr_yt_onsite_revenue {
  label: "YouTube Onsite Revenue Calculation"

  derived_table: {
    sql: SELECT
          A.video_id AS video_id,
          A.channel_id AS channel_id,
          A.estimated_partner_revenue AS estimated_partner_revenue,
          A.estimated_cpm AS estimated_cpm,
          A.channel_id AS brand,
          A.date AS date,
          B.playback_location_type AS playback_location_type
        FROM
          Youtube.p_content_owner_estimated_revenue_a1_Youtube A JOIN Youtube.p_content_owner_playback_location_a2_Youtube B
          ON A.video_id = B.video_id
        WHERE TIMESTAMP(A.date) >= DATE_ADD(CURRENT_TIMESTAMP(),-62,"DAY")
        ;;
      }

  dimension_group: date {
    label: ""
    type: time
    sql: TIMESTAMP(${TABLE}.date) ;;
  }

  dimension: 30_day_buckets  {
    type: number
    label: "30 Days"
    description: "Bucket [1] = Past 30 Days, [2] = Past 31 - 60 Days"
    sql:  CASE
                WHEN DATEDIFF(DATE_ADD(CURRENT_TIMESTAMP(),-3,"DAY"),TIMESTAMP(${TABLE}.date)) BETWEEN 0 AND 29 THEN 1
                WHEN DATEDIFF(DATE_ADD(CURRENT_TIMESTAMP(),-3,"DAY"),TIMESTAMP(${TABLE}.date)) BETWEEN 30 AND 59 THEN 2
            END ;;
  }

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id;;
  }

  dimension: channel_id {
    type: string
    sql: ${TABLE}.channel_id;;
  }

  measure: estimated_partner_revenue {
    type: sum
    sql: ${TABLE}.estimated_partner_revenue;;
  }

  measure: estimated_cpm {
    type: average
    sql: ${TABLE}.estimated_cpm;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand;;
  }

  dimension: playback_location_type {
    type: number
    sql: ${TABLE}.playback_location_type;;
  }

  measure:  youtube_onsite_revenue{ #Sum Watch Page & Channel Revenue Using Playback_location = 0 and 2
    label: "YT Domain Partner Revenue"
    type: sum
    description: "This aggregates both watch and channel page youtube revenues to calculate total youtube on-site revenue (Unknown revenue have been ommissed)"
    sql: CASE
          WHEN (${TABLE}.playback_location_type = 0 THEN ${TABLE}.estimated_partner_revenue
          WHEN (${TABLE}.playback_location_type = 2 THEN ${TABLE}.estimated_partner_revenue
        END
    ;;

    }

  measure:  youtube_offsite_revenue{ #Sum External/Embedded  Playback_location = 1
    label: "External Partner Revenue"
    type: sum
    description: "This aggregates External youtube revenues to calculate total youtube off-site revenue (Unknown revenue have been ommissed)"
    sql: CASE
          WHEN (${TABLE}.playback_location_type = 1 THEN ${TABLE}.estimated_partner_revenue
        END
    ;;

    }


  }
