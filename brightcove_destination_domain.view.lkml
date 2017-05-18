view: brightcove_destination_domain {
  label: "Brightcove"
  derived_table: {
    sql: SELECT
          CASE
            WHEN A IS NULL THEN B
          ELSE
            A
          END AS recorded_date,
          CASE
            WHEN C IS NULL THEN D
          ELSE
            C
          END AS video_id,
          E AS onsite_views,
          F AS offsite_views
        FROM
          (SELECT
            onsite."date" AS A,
            offsite."date" AS B,
            onsite.video AS C,
            offsite.video AS D,
            onsite.video_view E,
            offsite.video_view AS F
          FROM
            (SELECT
            "date",
            video,
            SUM(video_view) AS video_view
            FROM
            publications.brightcove_destination_domain
            WHERE destination_domain LIKE '%aire%' OR destination_domain LIKE '%anglingtimes%' OR destination_domain LIKE '%carmagazine%' OR destination_domain LIKE '%closer%'
            OR destination_domain LIKE '%planetradio%' OR destination_domain LIKE '%empire%' OR destination_domain LIKE '%grazia%' OR destination_domain LIKE '%heat%'
            OR destination_domain LIKE '%kiss%' OR destination_domain LIKE '%lro%' OR destination_domain LIKE '%motorcyclenews%' OR destination_domain LIKE '%motherandbaby%'
            OR destination_domain LIKE '%parkers%' OR destination_domain LIKE '%debrief%' OR destination_domain LIKE '%golfer%' OR destination_domain LIKE '%lifestyle%'
            OR destination_domain LIKE '%fhm%' OR destination_domain LIKE '%classicarsforsale%' OR destination_domain LIKE '%fleetnews%' OR destination_domain LIKE '%forthone%'
            OR destination_domain LIKE '%gothinkbig%' OR destination_domain LIKE '%horsedeals%' OR destination_domain LIKE '%kerrang%' OR destination_domain LIKE '%mojo%'
            OR destination_domain LIKE '%mfr%' OR destination_domain LIKE '%mustard%' OR destination_domain LIKE '%planetrock%' OR destination_domain LIKE '%practicalphotography%'
            OR destination_domain LIKE '%practicalclassics%' OR destination_domain LIKE 'practicalfishkeeping' OR destination_domain LIKE '%qthemusic%' OR destination_domain LIKE '%bauer%'
            OR destination_domain LIKE '%brightcove%' OR destination_domain LIKE '%winit%' OR destination_domain LIKE '%sweepon%' OR destination_domain LIKE '%lifeandstylemag%'
            OR destination_domain LIKE '%intouchweekly%' OR destination_domain LIKE '%j-14%' OR destination_domain LIKE '%j--14%' OR destination_domain LIKE '%maxim%'
            GROUP BY "date", video) AS onsite
          FULL JOIN
            (SELECT
            "date",
            video,
            SUM(video_view) AS video_view
            FROM
            publications.brightcove_destination_domain
            WHERE destination_domain NOT LIKE '%aire%' AND destination_domain NOT LIKE '%anglingtimes%' AND destination_domain NOT LIKE '%carmagazine%' AND destination_domain NOT LIKE '%closer%'
            AND destination_domain NOT LIKE '%planetradio%' AND destination_domain NOT LIKE '%empire%' AND destination_domain NOT LIKE '%grazia%' AND destination_domain NOT LIKE '%heat%'
            AND destination_domain NOT LIKE '%kiss%' AND destination_domain NOT LIKE '%lro%' AND destination_domain NOT LIKE '%motorcyclenews%' AND destination_domain NOT LIKE '%motherandbaby%'
            AND destination_domain NOT LIKE '%parkers%' AND destination_domain NOT LIKE '%debrief%' AND destination_domain NOT LIKE '%golfer%' AND destination_domain NOT LIKE '%lifestyle%'
            AND destination_domain NOT LIKE '%fhm%' AND destination_domain NOT LIKE '%classicarsforsale%' AND destination_domain NOT LIKE '%fleetnews%' AND destination_domain NOT LIKE '%forthone%'
            AND destination_domain NOT LIKE '%gothinkbig%' AND destination_domain NOT LIKE '%horsedeals%' AND destination_domain NOT LIKE '%kerrang%' AND destination_domain NOT LIKE '%mojo%'
            AND destination_domain NOT LIKE '%mfr%' AND destination_domain NOT LIKE '%mustard%' AND destination_domain NOT LIKE '%planetrock%' AND destination_domain NOT LIKE '%practicalphotography%'
            AND destination_domain NOT LIKE '%practicalclassics%' AND destination_domain NOT LIKE 'practicalfishkeeping' AND destination_domain NOT LIKE '%qthemusic%' AND destination_domain NOT LIKE '%bauer%'
            AND destination_domain NOT LIKE '%brightcove%' AND destination_domain NOT LIKE '%winit%' AND destination_domain NOT LIKE '%sweepon%' AND destination_domain NOT LIKE '%lifeandstylemag%'
            AND destination_domain NOT LIKE '%intouchweekly%' AND destination_domain NOT LIKE '%j-14%' AND destination_domain NOT LIKE '%j--14%' AND destination_domain NOT LIKE '%maxim%'
            GROUP BY "date", video) AS offsite
          ON onsite.video = offsite.video AND onsite."date" = offsite."date")

      ;;
  }

  dimension: date {
    type: date
    label: "Recorded Date"
    sql: ${TABLE}.recorded_date ;;
  }

  dimension: video_id {
    type: string
    label: "Video ID"
    sql: ${TABLE}.video_id ;;
  }

  measure: onsite_views {
    type: sum
    label: "Onsite Views"
    sql: ${TABLE}.onsite_views ;;
  }

  measure: offsite_views {
    type: sum
    label: "Offsite Views"
    sql: ${TABLE}.offsite_views ;;
  }
}
