view: brightcove_destination_domain {
  derived_table: {
    sql: SELECT
      "all"."date" AS all_date,
      "all"."video" AS all_video,
      "all"."destination_domain" AS all_destination_domain,
      "all"."video_view" AS all_views,
      "onsite"."destination_domain" AS onsite_domain,
      "onsite"."video_view" AS onsite_views,
      "offsite"."destination_domain" AS offsite_domain,
      "offsite"."video_view" AS offsite_views,
      bauer_non_brand_domain.destination_domain AS bauer_other_domain,
      "bauer_non_brand_domain"."video_view" AS bauer_other_views
    FROM
      (SELECT
          date,
          video,
          video_view,
          destination_domain
      FROM
        publications.brightcove_destination_domain) AS "all"
      LEFT OUTER JOIN
        (SELECT
          date,
          video,
          video_view,
          destination_domain
        FROM
          publications.brightcove_destination_domain
        WHERE destination_domain NOT LIKE '%radioaire%' AND destination_domain NOT LIKE '%anglingtimes%' AND destination_domain NOT LIKE '%carmagazine%' AND destination_domain NOT LIKE '%closer%' AND destination_domain NOT LIKE '%planetradio%' AND destination_domain NOT LIKE '%empire%' AND destination_domain NOT LIKE '%grazia%' AND destination_domain NOT LIKE '%heat%' AND destination_domain NOT LIKE '%kiss%' AND destination_domain NOT LIKE '%lro%' AND destination_domain NOT LIKE '%motorcyclenews%' AND destination_domain NOT LIKE '%motherandbaby%' AND destination_domain NOT LIKE '%parkers%' AND destination_domain NOT LIKE '%debrief%' AND destination_domain NOT LIKE '%golfer%' AND destination_domain NOT LIKE '%bauer%' AND destination_domain NOT LIKE '%brightcove%' AND destination_domain NOT LIKE '%lifestyle%') AS offsite
        ON "all"."date" = "offsite"."date" AND "all"."video" = "offsite"."video"
      LEFT OUTER JOIN
        (SELECT
          date,
          video,
          video_view,
          destination_domain
        FROM
          publications.brightcove_destination_domain
        WHERE destination_domain LIKE '%radioaire%' OR destination_domain LIKE '%anglingtimes%' OR destination_domain LIKE '%carmagazine%' OR destination_domain LIKE '%closer%' OR destination_domain LIKE '%planetradio%' OR destination_domain LIKE '%empire%' OR destination_domain LIKE '%grazia%' OR destination_domain LIKE '%heat%' OR destination_domain LIKE '%kiss%' OR destination_domain LIKE '%lro%' OR destination_domain LIKE '%motorcyclenews%' OR destination_domain LIKE '%motherandbaby%' OR destination_domain LIKE '%parkers%' OR destination_domain LIKE '%debrief%' OR destination_domain LIKE '%golfer%' OR destination_domain LIKE '%lifestyle%') AS "onsite"
        ON "all"."date" = "onsite"."date" AND "all"."video" = "onsite"."video"
      LEFT OUTER JOIN
        (SELECT
          date,
          video,
          video_view,
          destination_domain
        FROM
          publications.brightcove_destination_domain
        WHERE destination_domain LIKE '%bauer%' OR destination_domain LIKE '%brightcove%') AS "bauer_non_brand_domain"
      ON "all"."date" = "bauer_non_brand_domain"."date" AND "all"."video" = "bauer_non_brand_domain"."video"
      ;;
  }

  dimension: all_video {
    type: string
    sql: ${TABLE}.all_video ;;
  }

  dimension: all_destination_domain {
    type: string
    sql: ${TABLE}.all_destination_domain ;;
  }

  dimension: onsite_domain {
    type: string
    sql: ${TABLE}.onsite_domain ;;
  }

  dimension: offsite_domain {
    type: string
    sql: ${TABLE}.offsite_domain ;;
  }

  dimension: bauer_other_domain {
    type: string
    sql: ${TABLE}.bauer_other_domain ;;
  }

  dimension: all_date {
    type: date
    sql: ${TABLE}.all_date ;;
  }

  measure: all_video_view {
    type: sum
    sql: ${TABLE}.all_views ;;
  }

  measure: onsite_views {
    type: sum
    sql: ${TABLE}.onsite_views ;;
  }

  measure: offsite_views {
    type: sum
    sql: ${TABLE}.offsite_views ;;
  }

  measure: bauer_other_views {
    type: sum
    sql: ${TABLE}.offsite_views ;;
  }


}
