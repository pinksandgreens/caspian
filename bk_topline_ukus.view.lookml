- view: bk_topline_ukus
  sql_table_name: publications.bk_topline_ukus
  fields:

  - dimension: category_id
    type: number
    sql: ${TABLE}.category_id

  - dimension: path
    type: string
    sql: |
      CASE 
        WHEN ${TABLE}.path = 'Bauer DMP - Private' THEN 'All 1st Party'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Commercial Segments' THEN 'Commercial Segments'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Sites > Specialist' THEN 'Specialist'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Sites > London Lifestyle' THEN 'London Lifestyle'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Sites > Specialist > Motoring' THEN 'Motoring'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Sites > Radio' THEN 'Radio'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Sites > Specialist > Biking' THEN 'Biking'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Sites > London Lifestyle > Women's Lifestyle' THEN ' Women's Lifestyle'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Sites > London Lifestyle > Films & Music' THEN 'Films & Music'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Sites > Specialist > Women's Lifestyle' THEN 'Specialist Women's Lifestyle'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Sites > London Lifestyle > Lifestyle' THEN 'Lifstyle'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Self-Classification > Commercial Beauty' THEN 'Commercial Beauty'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Self-Classification > Commercial Entertainment' THEN 'Commercial Entertainment'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Sites > Specialist > B2B' THEN 'B2B'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Sites > Specialist > Golf' THEN 'Golf'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Self-Classification > Email Opens' THEN 'Email Opens'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Sites > Specialist > Pets' THEN 'Pets'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Self-Classification > Email Opens > Parkers Email Opens' THEN 'Parkers Email Opens'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Self-Classification > Email Opens > MCN Email Opens' THE 'MCN Email Opens'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Sites > Specialist > Equine' THEN 'Equine'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Sites > Specialist > Sport' THEN 'Sport'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Sites > Specialist > Gardening' THEN 'Gardening'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Sites > Specialist > Leisure' THEN 'Leisure'
        WHEN ${TABLE}.path = 'Bauer DMP - Private > Sites > Specialist > Third Party' THEN 'Third Party'
        ELSE 'Unknown' 
      END    

  - dimension: reach
    type: number
    sql: ${TABLE}.reach

  - dimension: reach2
    type: number
    sql: ${TABLE}."reach(2)"

  - measure: total_reach
    label: 'Total Audience Reach'
    type: sum
    sql: ${TABLE}.reach

  - measure: total_reach2
    label: 'UK Audience Reach'
    type: sum
    sql: ${TABLE}."reach(2)"   
    
    
    
    
    
    
#         sql: |
#       CASE 
#         WHEN ${path} = 'Bauer DMP - Private' THEN 'All 1st Party'
#         WHEN ${path} = 'Bauer DMP - Private > Commercial Segments' THEN 'Commercial Segments'
#         WHEN ${path} = 'Bauer DMP - Private > Sites > Specialist' THEN 'Specialist'
#         WHEN ${path} = 'Bauer DMP - Private > Sites > London Lifestyle' THEN 'London Lifestyle'
#         WHEN ${path} = 'Bauer DMP - Private > Sites > Specialist > Motoring' THEN 'Motoring'
#         WHEN ${path} = 'Bauer DMP - Private > Sites > Radio' THEN 'Radio'
#         WHEN ${path} = 'Bauer DMP - Private > Sites > Specialist > Biking' THEN 'Biking'
#         WHEN ${path} = 'Bauer DMP - Private > Sites > London Lifestyle > Women's Lifestyle' THEN ' Women's Lifestyle'
#         WHEN ${path} = 'Bauer DMP - Private > Sites > London Lifestyle > Films & Music' THEN 'Films & Music'
#         WHEN ${path} = 'Bauer DMP - Private > Sites > Specialist > Women's Lifestyle' THEN 'Specialist Women's Lifestyle'
#         WHEN ${path} = 'Bauer DMP - Private > Sites > London Lifestyle > Lifestyle' THEN 'Lifstyle'
#         WHEN ${path} = 'Bauer DMP - Private > Self-Classification > Commercial Beauty' THEN 'Commercial Beauty'
#         WHEN ${path} = 'Bauer DMP - Private > Self-Classification > Commercial Entertainment' THEN 'Commercial Entertainment'
#         WHEN ${path} = 'Bauer DMP - Private > Sites > Specialist > B2B' THEN 'B2B'
#         WHEN ${path} = 'Bauer DMP - Private > Sites > Specialist > Golf' THEN 'Golf'
#         WHEN ${path} = 'Bauer DMP - Private > Self-Classification > Email Opens' THEN 'Email Opens'
#         WHEN ${path} = 'Bauer DMP - Private > Sites > Specialist > Pets' THEN 'Pets'
#         WHEN ${path} = 'Bauer DMP - Private > Self-Classification > Email Opens > Parkers Email Opens' THEN 'Parkers Email Opens'
#         WHEN ${path} = 'Bauer DMP - Private > Self-Classification > Email Opens > MCN Email Opens' THE 'MCN Email Opens'
#         WHEN ${path} = 'Bauer DMP - Private > Sites > Specialist > Equine' THEN 'Equine'
#         WHEN ${path} = 'Bauer DMP - Private > Sites > Specialist > Sport' THEN 'Sport'
#         WHEN ${path} = 'Bauer DMP - Private > Sites > Specialist > Gardening' THEN 'Gardening'
#         WHEN ${path} = 'Bauer DMP - Private > Sites > Specialist > Leisure' THEN 'Leisure'
#         WHEN ${path} = 'Bauer DMP - Private > Sites > Specialist > Third Party' THEN 'Third Party'
#         ELSE 'Unknown' 
#       END   
    