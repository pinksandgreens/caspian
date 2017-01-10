- view: ga_demographics
  sql_table_name: publications.ga_demographics
  fields:

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: devicecategory
    type: string
    sql: INITCAP(${TABLE}.devicecategory)

  - dimension: interestinmarketcategory
    type: string
    sql: ${TABLE}.interestinmarketcategory

  - dimension: market
    type: string
    sql: ${TABLE}.market

  - dimension: operatingsystem
    type: string
    sql: ${TABLE}.operatingsystem

  - dimension: pageviews
    type: string
    sql: ${TABLE}.pageviews

  - dimension: platform
    type: string
    sql: ${TABLE}.platform

  - dimension: useragebracket
    type: string
    sql: ${TABLE}.useragebracket

  - dimension: usergender
    type: string
    sql: INITCAP(${TABLE}.usergender)

  - measure: users
    type: sum
    sql: ${TABLE}.users

  - dimension: yearmonth
    type: date
    sql: ${TABLE}.yearmonth

