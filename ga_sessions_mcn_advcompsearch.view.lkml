view: ga_sessions_mcn_advcompsearch {
  label: "x: User Journey"

  derived_table: {
    sql: SELECT
        fullVisitorId AS ga_sessions_full_visitor_id,
        group_concat(UNIQUE(hits.page.pagePath)) AS hits__page__page_path_level1
      FROM
        ( SELECT * FROM {% table_date_range ga_sessions_mcn.date_filter 22661559.ga_sessions_ %})
      GROUP BY 1
      ORDER BY 1
       ;;
  }

  filter: date_filter {
    type: date
  }

  # TABLE_DATE_RANGE([uplifted-light-89310:114668488.ga_sessions_],DATE_ADD(CURRENT_TIMESTAMP(), -1, 'YEAR'),CURRENT_TIMESTAMP())

  #   - dimension: ConcatID_PPath
  #     label: 'ID-Page'
  #     type: string
  #     sql: CONCAT(${TABLE}.ga_sessions_full_visitor_id,${TABLE}.hits__page__page_path_level1)
  #
  dimension: full_Visitor_Id {
    label: "FullVisitorID"
    hidden: yes
    type: string
    primary_key: yes
    sql: ${TABLE}.ga_sessions_full_visitor_id ;;
  }

  dimension: Brands_Visited {
    label: "Bikes Visited"
    description: "In order to cars by users, filter this field and do \"contains\" and a make & model, for example \"ford/focus/\". Then include make & model fields from x: Make and Model Search"
    type: string
    sql: ${TABLE}.hits__page__page_path_level1 ;;
  }
}

#   - dimension: Make
#     hidden: TRUE
#     type: string
#     sql: |
#       CASE
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%abarth%' THEN 'Abarth'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%alfa-romeo%' THEN 'Alfa-Romeo'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%aston-martin%' THEN 'Aston-Martin'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%audi%' THEN 'Audi'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%bentley%' THEN 'Bentley'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%bmw%' THEN 'BMW'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%bugatti%' THEN 'Bugatti'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%caterham%' THEN 'Caterham'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%citroën%' THEN 'Citroën'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%dacia%' THEN 'Dacia'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%ds%' THEN 'DS'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%ferrari%' THEN 'Ferrari'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%fiat%' THEN 'Fiat'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%ford%' THEN 'Ford'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%honda%' THEN 'Honda'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%hyundai%' THEN 'Hyundai'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%infiniti%' THEN 'Infiniti'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%jaguar%' THEN 'Jaguar'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%jeep%' THEN 'Jeep'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%kia%' THEN 'Kia'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%lamborghini%' THEN 'Lamborghini'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%land-rover%' THEN 'Land-Rover'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%lexus%' THEN 'Lexus'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%lotus%' THEN 'Lotus'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%maserati%' THEN 'Maserati'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%mazda%' THEN 'Mazda'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%mclaren%' THEN 'McLaren'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%mercedes-benz%' THEN 'Mercedes-Benz'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%mg%' THEN 'MG'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%mg-motor-uk%' THEN 'MG-Motor-UK'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%mini%' THEN 'MINI'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%mitsubishi%' THEN 'Mitsubishi'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%nissan%' THEN 'Nissan'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%peugeot%' THEN 'Peugeot'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%porsche%' THEN 'Porsche'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%renault%' THEN 'Renault'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%rolls-royce%' THEN 'Rolls-Royce'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%seat%' THEN 'SEAT'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%skoda%' THEN 'Skoda'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%smart%' THEN 'Smart'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%ssangyong%' THEN 'SsangYong'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%subaru%' THEN 'Subaru'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%suzuki%' THEN 'Suzuki'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%tesla%' THEN 'Tesla'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%toyota%' THEN 'Toyota'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%vauxhall%' THEN 'Vauxhall'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%volkswagen%' THEN 'Volkswagen'
#         WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%volvo%' THEN 'Volvo'
#         ELSE 'No-Make'
#       END
#
#   - measure: Unique_Users
#     label: 'Unique Users'
#     type: count
#     sql: ${TABLE}.ga_sessions_full_visitor_id
#
