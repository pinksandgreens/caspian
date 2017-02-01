view: bk_topline_ukus {
  sql_table_name: publications.bk_topline_ukus ;;

  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
  }

  dimension: path {
    type: string
    sql: CASE
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private' THEN 'All 1st Party'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Commercial Segments' THEN 'Commercial Segments'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Sites > Specialist' THEN 'Specialist'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Sites > London Lifestyle' THEN 'London Lifestyle'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Sites > Specialist > Motoring' THEN 'Motoring'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Sites > Radio' THEN 'Radio'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Sites > Specialist > Biking' THEN 'Biking'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Sites > London Lifestyle > Women''s Lifestyle' THEN 'Women''s Lifestyle'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Sites > London Lifestyle > Films & Music' THEN 'Films & Music'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Sites > Specialist > Women''s Lifestyle' THEN 'Specialist Women''s Lifestyle'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Sites > London Lifestyle > Lifestyle' THEN 'Lifestyle'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Self-Classification > Commercial Beauty' THEN 'Commercial Beauty'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Self-Classification > Commercial Entertainment' THEN 'Commercial Entertainment'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Sites > Specialist > B2B' THEN 'B2B'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Sites > Specialist > Golf' THEN 'Golf'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Self-Classification > Email Opens' THEN 'Email Opens'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Sites > Specialist > Pets' THEN 'Pets'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Self-Classification > Email Opens > Parkers Email Opens' THEN 'Parkers Email Opens'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Self-Classification > Email Opens > MCN Email Opens' THEN 'MCN Email Opens'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Sites > Specialist > Equine' THEN 'Equine'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Sites > Specialist > Sport' THEN 'Sport'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Sites > Specialist > Gardening' THEN 'Gardening'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Sites > Specialist > Leisure' THEN 'Leisure'
        WHEN bk_topline_ukus.path = 'Bauer DMP - Private > Sites > Specialist > Third Party' THEN 'Third Party'
        ELSE 'Unknown'
      END
       ;;
  }

  dimension: reach {
    type: number
    sql: ${TABLE}.reach ;;
  }

  dimension: reach2 {
    type: number
    sql: ${TABLE}."reach(2)" ;;
  }

  measure: total_reach {
    label: "Total Audience Reach"
    type: sum
    sql: ${TABLE}.reach ;;
  }

  measure: total_reach2 {
    label: "UK Audience Reach"
    type: sum
    sql: ${TABLE}."reach(2)" ;;
  }
}
