view: brightcove_destination_domain {
  derived_table: {
    sql: SELECT
      CAST("all"."date" AS DATE) AS all_date,
      "all".video AS all_video,
      "all".destination_domain AS all_destination_domain,
      "all".video_view AS all_views,
      onsite.destination_domain AS onsite_domain,
      onsite.video_view AS onsite_views,
      offsite.destination_domain AS offsite_domain,
      offsite.video_view AS offsite_views,
      bauer_other_domain.destination_domain AS bauer_other_domain,
      bauer_other_domain.video_view AS bauer_other_views
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
        WHERE destination_domain NOT LIKE '%radioaire%' AND destination_domain NOT LIKE '%anglingtimes%' AND destination_domain NOT LIKE '%carmagazine%'
        AND destination_domain NOT LIKE '%closer%' AND destination_domain NOT LIKE '%planetradio%' AND destination_domain NOT LIKE '%empire%' AND destination_domain NOT LIKE '%grazia%'
        AND destination_domain NOT LIKE '%heat%' AND destination_domain NOT LIKE '%kiss%' AND destination_domain NOT LIKE '%lro%' AND destination_domain NOT LIKE '%motorcyclenews%'
        AND destination_domain NOT LIKE '%motherandbaby%' AND destination_domain NOT LIKE '%parkers%' AND destination_domain NOT LIKE '%debrief%' AND destination_domain NOT LIKE '%golfer%'
        AND destination_domain NOT LIKE '%bauer%' AND destination_domain NOT LIKE '%brightcove%' AND destination_domain NOT LIKE '%lifestyle%' AND destination_domain NOT LIKE '%winit%'
        AND destination_domain NOT LIKE '%sweepon%' AND destination_domain NOT LIKE '%lifeandstylemag%' AND destination_domain NOT LIKE '%intouchweekly%'
        AND destination_domain NOT LIKE '%fhm%' AND destination_domain NOT LIKE '%maxim%' AND destination_domain NOT LIKE '%j-14%' AND destination_domain NOT LIKE '%j--14%'
        AND destination_domain NOT LIKE '%classicarsforsale%' AND destination_domain NOT LIKE '%fleetnews%' AND destination_domain NOT LIKE '%forthone%'
        AND destination_domain NOT LIKE '%gothinkbig%' AND destination_domain NOT LIKE '%horsedeals%' AND destination_domain NOT LIKE '%kerrang%' AND destination_domain NOT LIKE '%mojo%'
        AND destination_domain NOT LIKE '%mfr%' AND destination_domain NOT LIKE '%mustard%' AND destination_domain NOT LIKE '%planetrock%'
        AND destination_domain NOT LIKE '%practicalphotography%' AND destination_domain NOT LIKE '%practicalclassics%' AND destination_domain NOT LIKE 'practicalfishkeeping'
        AND destination_domain NOT LIKE '%qthemusic%') AS offsite
        ON "all"."date" = "offsite"."date" AND "all"."video" = "offsite"."video" AND "all"."destination_domain" = "offsite"."destination_domain"
      LEFT OUTER JOIN
        (SELECT
          date,
          video,
          video_view,
          destination_domain
        FROM
          publications.brightcove_destination_domain
        WHERE destination_domain LIKE '%radioaire%' OR destination_domain LIKE '%anglingtimes%' OR destination_domain LIKE '%carmagazine%' OR destination_domain LIKE '%closer%'
        OR destination_domain LIKE '%planetradio%' OR destination_domain LIKE '%empire%' OR destination_domain LIKE '%grazia%' OR destination_domain LIKE '%heat%'
        OR destination_domain LIKE '%kiss%' OR destination_domain LIKE '%lro%' OR destination_domain LIKE '%motorcyclenews%' OR destination_domain LIKE '%motherandbaby%'
        OR destination_domain LIKE '%parkers%' OR destination_domain LIKE '%debrief%' OR destination_domain LIKE '%golfer%' OR destination_domain LIKE '%lifestyle%'
        OR destination_domain LIKE '%fhm%' OR destination_domain LIKE '%classicarsforsale%' OR destination_domain LIKE '%fleetnews%' OR destination_domain LIKE '%forthone%'
        OR destination_domain LIKE '%gothinkbig%' OR destination_domain LIKE '%horsedeals%' OR destination_domain LIKE '%kerrang%' OR destination_domain LIKE '%mojo%'
        OR destination_domain LIKE '%mfr%' OR destination_domain LIKE '%mustard%' OR destination_domain LIKE '%planetrock%' OR destination_domain LIKE '%practicalphotography%'
        OR destination_domain LIKE '%practicalclassics%' OR destination_domain LIKE 'practicalfishkeeping' OR destination_domain LIKE '%qthemusic%') AS "onsite"
        ON "all"."date" = "onsite"."date" AND "all"."video" = "onsite"."video" AND "all"."destination_domain" = "onsite"."destination_domain"
      LEFT OUTER JOIN
        (SELECT
          date,
          video,
          video_view,
          destination_domain
        FROM
          publications.brightcove_destination_domain
        WHERE destination_domain LIKE '%bauer%' OR destination_domain LIKE '%brightcove%' OR destination_domain LIKE '%winit%' OR destination_domain LIKE '%sweepon%'
        OR destination_domain LIKE '%lifeandstylemag%' OR destination_domain LIKE '%intouchweekly%' OR destination_domain LIKE '%j-14%' OR destination_domain LIKE '%j--14%'
        OR destination_domain LIKE '%maxim%') AS "bauer_other_domain"
      ON "all"."date" = "bauer_other_domain"."date" AND "all"."video" = "bauer_other_domain"."video" AND "all"."destination_domain" = "bauer_other_domain"."destination_domain"
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

  dimension: 30_day_buckets  {
    type: number
    label: "30 Days"
    description: "Bucket [1] = Past 30 Days, [2] = Past 31 - 60 Days"
    sql:  CASE
                WHEN DATEDIFF(day,CAST(all_date AS DATE),(CURRENT_DATE-3)) BETWEEN 0 AND 29 THEN 1
                WHEN DATEDIFF(day,CAST(all_date AS DATE),(CURRENT_DATE-3)) BETWEEN 30 AND 59 THEN 2
            END ;;
  }

}
