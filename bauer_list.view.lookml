- view: bauer_list
  label: '1a. Bauer First Party Data'
  sql_table_name: publications.bauer_list
  fields:

#   - dimension: age
#     label: 'Age'
#     type: number
#     sql: |
#        CASE 
#          WHEN ((${TABLE}.age < 90) AND (${TABLE}.age > 18)) THEN ${TABLE}.age
#        END
       
  - dimension: age_as_number
    hidden: true
    sql: |
      CAST(CASE WHEN ${TABLE}.age LIKE '%-%' THEN NULL
      WHEN LEN(${TABLE}.age) = 0 THEN NULL
      ELSE ${TABLE}.age
      END AS INT)
    

  - dimension: age
    label: 'Age'
    type: number
    sql: |
       CASE 
         WHEN ((${age_as_number} < 99) AND (${age_as_number} > 17)) THEN ${TABLE}.age
       END

  - dimension: age_tier
    hidden: TRUE
    label: 'Age Tier'
    type: tier
    tiers: [0,10,20,30,40,60,80]
    sql: ${age}
    style: integer
    
  - dimension: age_banding
    label: 'Age Banding'
    type: string
    sql: ${TABLE}.agebanding

#   - dimension: birthday
#     type: number
#     sql: ${TABLE}.birthday
# 
#   - dimension: birth_month
#     type: number
#     sql: ${TABLE}.birthmonth
# 
#   - dimension: birth_year
#     type: number
#     sql: ${TABLE}.birthyear

  - dimension: city
    label: 'City'
    type: string
    sql: ${TABLE}.city

  - dimension: country
    label: 'Country'
    type: string
    sql: |
       CASE 
         WHEN ${TABLE}.country = 'United States' THEN 'United States of America'
         ELSE INITCAP(${TABLE}.country)
       END


  - dimension_group: created
    label: 'Created'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.created

  - dimension: created_by
    hidden: FALSE
    label: 'Data From (ES/Nudge/Gigya)'
    type: string
    sql: ${TABLE}.created_by
    
  - dimension: customer_id
    label: 'Customer ID'
    hidden: FALSE
    type: string
    sql: ${TABLE}.customer_id

  - dimension_group: birth_day
    hidden: TRUE
    type: time
    timeframes: [date, week, month, year, day_of_week]
    convert_tz: false
    sql: |
         CASE
           WHEN ${TABLE}.dateofbirth = '0001-01-01' THEN NULL
           WHEN ${TABLE}.dateofbirth > CURRENT_DATE THEN NULL
           WHEN DATEDIFF('year', ${TABLE}.dateofbirth, CURRENT_DATE) <= 8 THEN NULL
           ELSE ${TABLE}.dateofbirth 
         END

  - dimension_group: ddw_updated
    hidden: TRUE
    label: 'DDW Date'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.ddw_updated_date

  - dimension: educationlevel
    hidden: TRUE
    type: string
    sql: ${TABLE}.educationlevel

  - dimension: email_address
    hidden: TRUE
    type: string
    sql: ${TABLE}.email_address

  - dimension: email_permission_status
    hidden: TRUE
    type: string
    sql: ${TABLE}.email_permission_status

  - dimension: firstname
    hidden: TRUE
    type: string
    sql: ${TABLE}.firstname
    
  - dimension: gender
    hidden: TRUE
    type: string
    sql_case:
      F: ${TABLE}.gender = 'f' or ${TABLE}.gender = 'Female' 
      M: ${TABLE}.gender = 'm' or ${TABLE}.gender = 'Male' 
      else: 'Unknown'
  
  - dimension: gender_name
    label: 'Gender'
    sql: |
      CASE 
        WHEN ${gender} = 'F' THEN 'Female' 
        WHEN ${gender} = 'M' THEN 'Male' 
        ELSE 'Unknown' 
      END
      
################################### IS NULL DIMENSIONS, LEAVE THESE ALONE, THEY'RE USELESS TO ANYBODY BUT ME #########################

  - dimension: gender_name_null
    hidden: TRUE
    type: string
    sql: |
      CASE
        WHEN ${gender_name} IS NULL THEN 'Null'
        WHEN ${gender_name} = 'Unknown' THEN 'Null'
        ELSE 'Populated'
      END
      
  - dimension: fn_name_null
    hidden: TRUE
    type: string
    sql: |
      CASE
        WHEN ${firstname} IS NULL THEN 'Null'
        ELSE 'Populated'
      END

  - dimension: ln_name_null
    hidden: TRUE
    type: string
    sql: |
      CASE
        WHEN ${lastname} IS NULL THEN 'Null'
        ELSE 'Populated'
      END
      
  - dimension: age_name_null
    hidden: TRUE
    type: string
    sql: |
      CASE
        WHEN ${age_banding} IS NULL THEN 'Null'
        ELSE 'Populated'
      END
      
  - dimension: postcode_name_null
    hidden: TRUE
    type: string
    sql: |
      CASE
        WHEN ${postal_code} IS NULL THEN 'Null'
        ELSE 'Populated'
      END
      
  - dimension: country_name_null
    hidden: TRUE
    type: string
    sql: |
      CASE
        WHEN ${country} IS NULL THEN 'Null'
        ELSE 'Populated'
      END
    
  - dimension: city_name_null
    hidden: TRUE
    type: string
    sql: |
      CASE
        WHEN ${city} IS NULL THEN 'Null'
        ELSE 'Populated'
      END
      
  - dimension: phone_name_null
    hidden: TRUE
    type: string
    sql: |
      CASE
        WHEN ${telephonehomenumber} IS NULL THEN 'Null'
        ELSE 'Populated'
      END
      
  - dimension: income_name_null
    hidden: TRUE
    type: string
    sql: |
      CASE
        WHEN ${household_income} IS NULL THEN 'Null'
        ELSE 'Populated'
      END
      
  - dimension: dob2_name_null
    hidden: TRUE
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.dateofbirth IS NULL THEN 'Null'
        ELSE 'Populated'
      END
      
############################################################################################################## #########################

  - dimension: hometown
    hidden: TRUE
    type: string
    sql: ${TABLE}.hometown

  - dimension: household_income
    hidden: FALSE
    label: 'Household Income ($USD)'
    description: 'This is the income in USD '
    type: string
    sql: ${TABLE}.householdincome

  - dimension: is_registered
    label: 'Registered on Gigya'
    type: yesno
    sql: ${TABLE}.isregistered = 'Y'

  - dimension: lastname
    hidden: TRUE
    type: string
    sql: ${TABLE}.lastname

  - dimension: mobile_country
    hidden: TRUE
    type: string
    sql: ${TABLE}.mobile_country

  - dimension: mobile_number
    hidden: TRUE
    type: string
    sql: ${TABLE}.mobile_number

  - dimension: nickname
    hidden: TRUE
    type: string
    sql: ${TABLE}.nickname

  - dimension: nudgeid
    hidden: TRUE
    type: string
    sql: ${TABLE}.nudgeid

  - dimension: occupation
    hidden: TRUE
    type: string
    sql: ${TABLE}.occupation

  - dimension: postal_code
    label: 'Postcode'
    type: string
    sql: |
         CASE
           WHEN UPPER(${TABLE}.postal_code) LIKE '[A-Z][A-Z][0-9][0-9][A-Z][A-Z]' THEN LEFT(UPPER(${TABLE}.postal_code),3)+' '+RIGHT(UPPER(${TABLE}.postal_code),3)
           WHEN UPPER(${TABLE}.postal_code) LIKE '[A-Z][0-9][0-9][A-Z][A-Z]' THEN LEFT(UPPER(${TABLE}.postal_code),2)+' '+RIGHT(UPPER(${TABLE}.postal_code),3)
           WHEN UPPER(${TABLE}.postal_code) LIKE '[A-Z][0-9][0-9][0-9][A-Z][A-Z]' THEN LEFT(UPPER(${TABLE}.postal_code),3)+' '+RIGHT(UPPER(${TABLE}.postal_code),3)
           WHEN UPPER(${TABLE}.postal_code) LIKE '[A-Z][0-9][A-Z][0-9][A-Z][A-Z]' THEN LEFT(UPPER(${TABLE}.postal_code),3)+' '+RIGHT(UPPER(${TABLE}.postal_code),3)
           WHEN UPPER(${TABLE}.postal_code) LIKE '[A-Z][A-Z][0-9][0-9][0-9][A-Z][A-Z]' THEN LEFT(UPPER(${TABLE}.postal_code),4)+' '+RIGHT(UPPER(${TABLE}.postal_code),3)
           WHEN UPPER(${TABLE}.postal_code) LIKE '[A-Z][A-Z][0-9][A-Z][0-9][A-Z][A-Z]' THEN LEFT(UPPER(${TABLE}.postal_code),4)+' '+RIGHT(UPPER(${TABLE}.postal_code),3)
           WHEN UPPER(${TABLE}.postal_code) LIKE 'UK%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE 'UNITED KIN%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE 'OTHER%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE 'IRELAND%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE 'FULL%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE 'N/A%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE '0%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE 'GB%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE 'ERIRE%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE 'NONE%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE 'ZZZ%' THEN 'Unknown'
           ELSE UPPER(${TABLE}.postal_code)
         END
    

#   - dimension: postal_area
#     hidden: TRUE
#     label: 'Postal Area'
#     type: string
#     sql: UPPER(split_part(${postal_code},' ', 1))
    
  - dimension: postal_area1
    label: 'Postal Area'
    type: string
    sql: |
       CASE 
            WHEN substring(${TABLE}.postal_code,1,2) = 'AB' THEN 'AB'
            WHEN substring(${TABLE}.postal_code,1,2) = 'AL' THEN 'AL'
            WHEN TRANSLATE(substring(${TABLE}.postal_code,1,2), '1234567890', '') = 'B' THEN 'B'
            WHEN substring(${TABLE}.postal_code,1,2) = 'BA' THEN 'BA'
            WHEN substring(${TABLE}.postal_code,1,2) = 'BB' THEN 'BB'
            WHEN substring(${TABLE}.postal_code,1,2) = 'BD' THEN 'BD'
            WHEN substring(${TABLE}.postal_code,1,2) = 'BH' THEN 'BH'
            WHEN substring(${TABLE}.postal_code,1,2) = 'BL' THEN 'BL'
            WHEN substring(${TABLE}.postal_code,1,2) = 'BN' THEN 'BN'
            WHEN substring(${TABLE}.postal_code,1,2) = 'BR' THEN 'BR'
            WHEN substring(${TABLE}.postal_code,1,2) = 'BS' THEN 'BS'
            WHEN substring(${TABLE}.postal_code,1,2) = 'BT' THEN 'BT'
            WHEN substring(${TABLE}.postal_code,1,2) = 'CA' THEN 'CA'
            WHEN substring(${TABLE}.postal_code,1,2) = 'CB' THEN 'CB'
            WHEN substring(${TABLE}.postal_code,1,2) = 'CF' THEN 'CF'
            WHEN substring(${TABLE}.postal_code,1,2) = 'CH' THEN 'CH'
            WHEN substring(${TABLE}.postal_code,1,2) = 'CM' THEN 'CM'
            WHEN substring(${TABLE}.postal_code,1,2) = 'CO' THEN 'CO'
            WHEN substring(${TABLE}.postal_code,1,2) = 'CR' THEN 'CR'
            WHEN substring(${TABLE}.postal_code,1,2) = 'CT' THEN 'CT'
            WHEN substring(${TABLE}.postal_code,1,2) = 'CV' THEN 'CV'
            WHEN substring(${TABLE}.postal_code,1,2) = 'CW' THEN 'CW'
            WHEN substring(${TABLE}.postal_code,1,2) = 'DA' THEN 'DA'
            WHEN substring(${TABLE}.postal_code,1,2) = 'DD' THEN 'DD'
            WHEN substring(${TABLE}.postal_code,1,2) = 'DE' THEN 'DE'
            WHEN substring(${TABLE}.postal_code,1,2) = 'DG' THEN 'DG'
            WHEN substring(${TABLE}.postal_code,1,2) = 'DH' THEN 'DH'
            WHEN substring(${TABLE}.postal_code,1,2) = 'DL' THEN 'DL'
            WHEN substring(${TABLE}.postal_code,1,2) = 'DN' THEN 'DN'
            WHEN substring(${TABLE}.postal_code,1,2) = 'DT' THEN 'DT'
            WHEN substring(${TABLE}.postal_code,1,2) = 'DY' THEN 'DY'
            WHEN TRANSLATE(substring(${TABLE}.postal_code,1,2), '1234567890', '') = 'E' THEN 'E'
            WHEN substring(${TABLE}.postal_code,1,2) = 'EC' THEN 'EC'
            WHEN substring(${TABLE}.postal_code,1,2) = 'EH' THEN 'EH'
            WHEN substring(${TABLE}.postal_code,1,2) = 'EN' THEN 'EN'
            WHEN substring(${TABLE}.postal_code,1,2) = 'EX' THEN 'EX'
            WHEN substring(${TABLE}.postal_code,1,2) = 'FK' THEN 'FK'
            WHEN substring(${TABLE}.postal_code,1,2) = 'FY' THEN 'FY'
            WHEN TRANSLATE(substring(${TABLE}.postal_code,1,2), '1234567890', '') = 'G' THEN 'G'
            WHEN substring(${TABLE}.postal_code,1,2) = 'GL' THEN 'GL'
            WHEN substring(${TABLE}.postal_code,1,2) = 'GU' THEN 'GU'
            WHEN substring(${TABLE}.postal_code,1,2) = 'HA' THEN 'HA'
            WHEN substring(${TABLE}.postal_code,1,2) = 'HD' THEN 'HD'
            WHEN substring(${TABLE}.postal_code,1,2) = 'HG' THEN 'HG'
            WHEN substring(${TABLE}.postal_code,1,2) = 'HP' THEN 'HP'
            WHEN substring(${TABLE}.postal_code,1,2) = 'HR' THEN 'HR'
            WHEN substring(${TABLE}.postal_code,1,2) = 'HS' THEN 'HS'
            WHEN substring(${TABLE}.postal_code,1,2) = 'HU' THEN 'HU'
            WHEN substring(${TABLE}.postal_code,1,2) = 'HX' THEN 'HX'
            WHEN substring(${TABLE}.postal_code,1,2) = 'IG' THEN 'IG'
            WHEN substring(${TABLE}.postal_code,1,2) = 'IP' THEN 'IP'
            WHEN substring(${TABLE}.postal_code,1,2) = 'IV' THEN 'IV'
            WHEN substring(${TABLE}.postal_code,1,2) = 'KA' THEN 'KA'
            WHEN substring(${TABLE}.postal_code,1,2) = 'KT' THEN 'KT'
            WHEN substring(${TABLE}.postal_code,1,2) = 'KW' THEN 'KW'
            WHEN substring(${TABLE}.postal_code,1,2) = 'KY' THEN 'KY'
            WHEN TRANSLATE(substring(${TABLE}.postal_code,1,2), '1234567890', '') = 'L' THEN 'L'
            WHEN substring(${TABLE}.postal_code,1,2) = 'LA' THEN 'LA'
            WHEN substring(${TABLE}.postal_code,1,2) = 'LD' THEN 'LD'
            WHEN substring(${TABLE}.postal_code,1,2) = 'LE' THEN 'LE'
            WHEN substring(${TABLE}.postal_code,1,2) = 'LL' THEN 'LL'
            WHEN substring(${TABLE}.postal_code,1,2) = 'LN' THEN 'LN'
            WHEN substring(${TABLE}.postal_code,1,2) = 'LS' THEN 'LS'
            WHEN substring(${TABLE}.postal_code,1,2) = 'LU' THEN 'LU'
            WHEN TRANSLATE(substring(${TABLE}.postal_code,1,2), '1234567890', '') = 'M' THEN 'M'
            WHEN substring(${TABLE}.postal_code,1,2) = 'ME' THEN 'ME'
            WHEN substring(${TABLE}.postal_code,1,2) = 'MK' THEN 'MK'
            WHEN substring(${TABLE}.postal_code,1,2) = 'ML' THEN 'ML'
            WHEN TRANSLATE(substring(${TABLE}.postal_code,1,2), '1234567890', '') = 'N' THEN 'N'
            WHEN substring(${TABLE}.postal_code,1,2) = 'NE' THEN 'NE'
            WHEN substring(${TABLE}.postal_code,1,2) = 'NG' THEN 'NG'
            WHEN substring(${TABLE}.postal_code,1,2) = 'NN' THEN 'NN'
            WHEN substring(${TABLE}.postal_code,1,2) = 'NP' THEN 'NP'
            WHEN substring(${TABLE}.postal_code,1,2) = 'NR' THEN 'NR'
            WHEN substring(${TABLE}.postal_code,1,2) = 'NW' THEN 'NW'
            WHEN substring(${TABLE}.postal_code,1,2) = 'OL' THEN 'OL'
            WHEN substring(${TABLE}.postal_code,1,2) = 'OX' THEN 'OX'
            WHEN substring(${TABLE}.postal_code,1,2) = 'PA' THEN 'PA'
            WHEN substring(${TABLE}.postal_code,1,2) = 'PE' THEN 'PE'
            WHEN substring(${TABLE}.postal_code,1,2) = 'PH' THEN 'PH'
            WHEN substring(${TABLE}.postal_code,1,2) = 'PL' THEN 'PL'
            WHEN substring(${TABLE}.postal_code,1,2) = 'PO' THEN 'PO'
            WHEN substring(${TABLE}.postal_code,1,2) = 'PR' THEN 'PR'
            WHEN substring(${TABLE}.postal_code,1,2) = 'RG' THEN 'RG'
            WHEN substring(${TABLE}.postal_code,1,2) = 'RH' THEN 'RH'
            WHEN substring(${TABLE}.postal_code,1,2) = 'RM' THEN 'RM'
            WHEN TRANSLATE(substring(${TABLE}.postal_code,1,2), '1234567890', '') = 'S' THEN 'S'
            WHEN substring(${TABLE}.postal_code,1,2) = 'SA' THEN 'SA'
            WHEN substring(${TABLE}.postal_code,1,2) = 'SE' THEN 'SE'
            WHEN substring(${TABLE}.postal_code,1,2) = 'SG' THEN 'SG'
            WHEN substring(${TABLE}.postal_code,1,2) = 'SK' THEN 'SK'
            WHEN substring(${TABLE}.postal_code,1,2) = 'SL' THEN 'SL'
            WHEN substring(${TABLE}.postal_code,1,2) = 'SM' THEN 'SM'
            WHEN substring(${TABLE}.postal_code,1,2) = 'SN' THEN 'SN'
            WHEN substring(${TABLE}.postal_code,1,2) = 'SO' THEN 'SO'
            WHEN substring(${TABLE}.postal_code,1,2) = 'SP' THEN 'SP'
            WHEN substring(${TABLE}.postal_code,1,2) = 'SR' THEN 'SR'
            WHEN substring(${TABLE}.postal_code,1,2) = 'SS' THEN 'SS'
            WHEN substring(${TABLE}.postal_code,1,2) = 'ST' THEN 'ST'
            WHEN substring(${TABLE}.postal_code,1,2) = 'SW' THEN 'SW'
            WHEN substring(${TABLE}.postal_code,1,2) = 'SY' THEN 'SY'
            WHEN substring(${TABLE}.postal_code,1,2) = 'TA' THEN 'TA'
            WHEN substring(${TABLE}.postal_code,1,2) = 'TD' THEN 'TD'
            WHEN substring(${TABLE}.postal_code,1,2) = 'TF' THEN 'TF'
            WHEN substring(${TABLE}.postal_code,1,2) = 'TN' THEN 'TN'
            WHEN substring(${TABLE}.postal_code,1,2) = 'TQ' THEN 'TQ'
            WHEN substring(${TABLE}.postal_code,1,2) = 'TR' THEN 'TR'
            WHEN substring(${TABLE}.postal_code,1,2) = 'TS' THEN 'TS'
            WHEN substring(${TABLE}.postal_code,1,2) = 'TW' THEN 'TW'
            WHEN substring(${TABLE}.postal_code,1,2) = 'UB' THEN 'UB'
            WHEN TRANSLATE(substring(${TABLE}.postal_code,1,2), '1234567890', '') = 'W' THEN 'W'
            WHEN substring(${TABLE}.postal_code,1,2) = 'WA' THEN 'WA'
            WHEN substring(${TABLE}.postal_code,1,2) = 'WC' THEN 'WC'
            WHEN substring(${TABLE}.postal_code,1,2) = 'WD' THEN 'WD'
            WHEN substring(${TABLE}.postal_code,1,2) = 'WF' THEN 'WF'
            WHEN substring(${TABLE}.postal_code,1,2) = 'WN' THEN 'WN'
            WHEN substring(${TABLE}.postal_code,1,2) = 'WR' THEN 'WR'
            WHEN substring(${TABLE}.postal_code,1,2) = 'WS' THEN 'WS'
            WHEN substring(${TABLE}.postal_code,1,2) = 'WV' THEN 'WV'
            WHEN substring(${TABLE}.postal_code,1,2) = 'YO' THEN 'YO'
            WHEN substring(${TABLE}.postal_code,1,2) = 'ZE' THEN 'ZE'
       END
    
  - dimension: postal_street_1
    hidden: TRUE
    type: string
    sql: ${TABLE}.postal_street_1

  - dimension: postal_street_2
    hidden: TRUE
    type: string
    sql: ${TABLE}.postal_street_2

  - dimension: postal_street_3
    hidden: TRUE
    type: string
    sql: ${TABLE}.postal_street_3

  - dimension_group: regdate
    label: 'Gigya Registered'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.regdate

  - dimension: region
    label: 'Region'
    type: string
    sql: ${TABLE}.region

  - dimension: regsource
    label: 'Brand Registration Source'
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.regsource = 'NDG' THEN NULL
      ELSE ${TABLE}.regsource
      END

  - dimension: state
    hidden: TRUE
    label: 'State'
    type: string
    sql: ${TABLE}.state

  - dimension: subsindividualid
    hidden: TRUE
    type: string
    sql: ${TABLE}.subsindividualid

  - dimension: telephonehomeadded
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephonehomeadded

  - dimension: telephonehomeiso
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephonehomeiso

  - dimension: telephonehomenumber
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephonehomenumber

  - dimension: telephonemobileadded
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephonemobileadded

  - dimension: telephonemobileiso
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephonemobileiso

  - dimension: telephoneworkadded
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephoneworkadded

  - dimension: telephone_work_iso
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephoneworkiso

  - dimension: telephoneworknumber
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephoneworknumber

  - dimension: title
    hidden: FALSE
    type: string
    sql: |
      CASE
        WHEN INITCAP(${TABLE}.title) = 'Mr' THEN 'Mr'
        WHEN INITCAP(${TABLE}.title) = 'Ms' THEN 'Ms'
        WHEN INITCAP(${TABLE}.title) = 'Mrs' THEN 'Mrs'
        WHEN INITCAP(${TABLE}.title) = 'Miss' THEN 'Miss'
        WHEN INITCAP(${TABLE}.title) = 'Dr' THEN 'Dr'
        WHEN INITCAP(${TABLE}.title) = 'Doctor (Male)' THEN 'Dr'
        WHEN INITCAP(${TABLE}.title) = 'Doctor (Female)' THEN 'Dr'
        WHEN INITCAP(${TABLE}.title) = 'Doctor' THEN 'Dr'
        ELSE NULL
      END

  - dimension: updated_by
    hidden: TRUE
    type: string
    sql: ${TABLE}.updated_by

  - dimension: username
    hidden: TRUE
    type: string
    sql: ${TABLE}.username

  - dimension: zippafvalidated
    hidden: TRUE
    type: string
    sql: ${TABLE}.zippafvalidated
    
  - dimension: registered_date_banding
    label: 'Gigya Registered Date Banding'
    type: string
    sql: |
      CASE 
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) = 0 THEN '1) Today'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 7 THEN '2) 1-7 days'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 30 THEN '3) 8-30 days'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 90 THEN '4) 1-3 months'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 180 THEN '5) 3-6 months'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 365 THEN '6) 6-12 months'
        ELSE '7) Unknown'
      END
  
  - measure: count
    hidden: TRUE
    label: 'Count'
    type: count
    drill_fields: [firstname, lastname, nickname, username]
  
  - measure: registered_users_count
    label: 'Users Count'
    type: count_distinct
    sql: ${customer_id}

#   - dimension: AGE_IS_NULL
#     label: 'AGE IS NULL'
#     hidden: FALSE
#     type: string
#     sql: |
#      CASE
#       WHEN ${TABLE}.age IS NULL THEN '0'
#       WHEN ${TABLE}.age = '' THEN '0'
#       WHEN ${TABLE}.age = ' ' THEN '0'
#       ELSE '1'
#      END
# 
  - measure: Percent_of_Total
    type: percent_of_total
    sql: ${registered_users_count}
#     html: |
#       {% if value > 30 %}
#       <font color="red">{{ rendered_value }}</font>
#       {% elsif value < 30 %}
#         <font color="darkgreen">{{ rendered_value }}</font>
#       {% else %}
#         <font color="black">{{ rendered_value }}</font>
#       {% endif %}
      
      
      

      
      
