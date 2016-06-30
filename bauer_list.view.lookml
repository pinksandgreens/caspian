- view: bauer_list
  label: 'Bauer First Party Data'
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
    sql_case:
      18-24: ${TABLE}.agebanding = '18-24'
      25-34: ${TABLE}.agebanding = '25-34'
      35-44: ${TABLE}.agebanding = '35-44'
      45-54: ${TABLE}.agebanding = '45-54'
      55-64: ${TABLE}.agebanding = '55-64'
      65-74: ${TABLE}.agebanding = '65-74'
      75+: ${TABLE}.agebanding = '75+'
      else: 'Unknown' 


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
    label: 'Date Created'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.created

  - dimension: created_by
    hidden: TRUE
    label: 'Data From (ES/Nudge/Gigya)'
    type: string
    sql: ${TABLE}.created_by
    
  - dimension: customer_id
    hidden: TRUE
    type: string
    sql: ${TABLE}.customer_id

  - dimension_group: birth_day
    hidden: TRUE
    type: time
    timeframes: [date, week, month, year, day_of_week]
    convert_tz: false
    sql: ${TABLE}.dateofbirth

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
    
  - dimension: hometown
    hidden: TRUE
    type: string
    sql: ${TABLE}.hometown

  - dimension: household_income
    hidden: TRUE
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

#  - dimension: postal_code
#    label: 'Postcode'
#    type: string
#    sql: ${TABLE}.postal_code
  
  - dimension: postal_code_RAW
    hidden: TRUE
    label: 'PostcodeTESTING1'
    type: string
    sql: UPPER(${TABLE}.postal_code)
    
  - dimension: postal_code0
    hidden: TRUE
    label: 'PostcodeTESTING1'
    type: string
    sql: |
      TRANSLATE(${postal_code_RAW}, ' ,-*.', '')

  - dimension: postal_code1
    hidden: TRUE
    label: 'PostcodeTESTING2'
    type: string
    sql: |
      substring(${postal_code0},1,4)
      
  - dimension: postal_code2
    hidden: TRUE
    label: 'PostcodeTESTING3'
    type: string
    sql: |
      substring(${postal_code0},5,4) 
      
  - dimension: postal_code_clean
    hidden: TRUE
    label: 'PostcodeTESTING4'
    type: string
    sql: |
      ${postal_code1} || ' ' ||  ${postal_code2}  
      
  
  - dimension: postal_code
    label: 'Postcode'
    type: string
    sql: |
       CASE 
            WHEN ${postal_code_clean} ILIKE 'AB%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'AL%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'B%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'BA%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'BB%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'BD%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'BH%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'BL%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'BN%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'BR%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'BS%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'BT%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'CA%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'CB%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'CF%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'CH%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'CM%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'CO%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'CR%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'CT%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'CV%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'CW%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'DA%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'DD%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'DE%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'DG%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'DH%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'DL%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'DN%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'DT%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'DY%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'E%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'EC%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'EH%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'EN%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'EX%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'FK%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'FY%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'G%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'GL%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'GU%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'HA%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'HD%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'HG%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'HP%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'HR%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'HS%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'HU%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'HX%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'IG%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'IP%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'IV%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'KA%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'KT%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'KW%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'KY%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'L%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'LA%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'LD%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'LE%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'LL%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'LN%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'LS%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'LU%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'M%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'ME%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'MK%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'ML%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'N%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'NE%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'NG%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'NN%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'NP%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'NR%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'NW%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'OL%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'OX%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'PA%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'PE%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'PH%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'PL%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'PO%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'PR%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'RG%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'RH%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'RM%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'S%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'SA%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'SE%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'SG%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'SK%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'SL%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'SM%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'SN%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'SO%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'SP%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'SR%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'SS%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'ST%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'SW%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'SY%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'TA%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'TD%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'TF%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'TN%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'TQ%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'TR%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'TS%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'TW%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'UB%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'W%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'WA%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'WC%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'WD%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'WF%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'WN%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'WR%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'WS%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'WV%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'YO%' THEN ${postal_code_clean}
            WHEN ${postal_code_clean} ILIKE 'ZE%' THEN ${postal_code_clean}
            ELSE 'Unknown'
       END
    

  - dimension: postal_area
    hidden: TRUE
    label: 'Postal Area'
    type: string
    sql: split_part(${postal_code},' ', 1)
    
  - dimension: postal_area1
    label: 'Postal Area'
    type: string
    sql: |
       CASE 
            WHEN substring(${postal_code},1,2) = 'AB' THEN 'AB'
            WHEN substring(${postal_code},1,2) = 'AL' THEN 'AL'
            WHEN substring(${postal_code},1,2) = 'B' THEN 'B'
            WHEN substring(${postal_code},1,2) = 'BA' THEN 'BA'
            WHEN substring(${postal_code},1,2) = 'BB' THEN 'BB'
            WHEN substring(${postal_code},1,2) = 'BD' THEN 'BD'
            WHEN substring(${postal_code},1,2) = 'BH' THEN 'BH'
            WHEN substring(${postal_code},1,2) = 'BL' THEN 'BL'
            WHEN substring(${postal_code},1,2) = 'BN' THEN 'BN'
            WHEN substring(${postal_code},1,2) = 'BR' THEN 'BR'
            WHEN substring(${postal_code},1,2) = 'BS' THEN 'BS'
            WHEN substring(${postal_code},1,2) = 'BT' THEN 'BT'
            WHEN substring(${postal_code},1,2) = 'CA' THEN 'CA'
            WHEN substring(${postal_code},1,2) = 'CB' THEN 'CB'
            WHEN substring(${postal_code},1,2) = 'CF' THEN 'CF'
            WHEN substring(${postal_code},1,2) = 'CH' THEN 'CH'
            WHEN substring(${postal_code},1,2) = 'CM' THEN 'CM'
            WHEN substring(${postal_code},1,2) = 'CO' THEN 'CO'
            WHEN substring(${postal_code},1,2) = 'CR' THEN 'CR'
            WHEN substring(${postal_code},1,2) = 'CT' THEN 'CT'
            WHEN substring(${postal_code},1,2) = 'CV' THEN 'CV'
            WHEN substring(${postal_code},1,2) = 'CW' THEN 'CW'
            WHEN substring(${postal_code},1,2) = 'DA' THEN 'DA'
            WHEN substring(${postal_code},1,2) = 'DD' THEN 'DD'
            WHEN substring(${postal_code},1,2) = 'DE' THEN 'DE'
            WHEN substring(${postal_code},1,2) = 'DG' THEN 'DG'
            WHEN substring(${postal_code},1,2) = 'DH' THEN 'DH'
            WHEN substring(${postal_code},1,2) = 'DL' THEN 'DL'
            WHEN substring(${postal_code},1,2) = 'DN' THEN 'DN'
            WHEN substring(${postal_code},1,2) = 'DT' THEN 'DT'
            WHEN substring(${postal_code},1,2) = 'DY' THEN 'DY'
            WHEN substring(${postal_code},1,2) = 'E' THEN 'E'
            WHEN substring(${postal_code},1,2) = 'EC' THEN 'EC'
            WHEN substring(${postal_code},1,2) = 'EH' THEN 'EH'
            WHEN substring(${postal_code},1,2) = 'EN' THEN 'EN'
            WHEN substring(${postal_code},1,2) = 'EX' THEN 'EX'
            WHEN substring(${postal_code},1,2) = 'FK' THEN 'FK'
            WHEN substring(${postal_code},1,2) = 'FY' THEN 'FY'
            WHEN substring(${postal_code},1,2) = 'G' THEN 'G'
            WHEN substring(${postal_code},1,2) = 'GL' THEN 'GL'
            WHEN substring(${postal_code},1,2) = 'GU' THEN 'GU'
            WHEN substring(${postal_code},1,2) = 'HA' THEN 'HA'
            WHEN substring(${postal_code},1,2) = 'HD' THEN 'HD'
            WHEN substring(${postal_code},1,2) = 'HG' THEN 'HG'
            WHEN substring(${postal_code},1,2) = 'HP' THEN 'HP'
            WHEN substring(${postal_code},1,2) = 'HR' THEN 'HR'
            WHEN substring(${postal_code},1,2) = 'HS' THEN 'HS'
            WHEN substring(${postal_code},1,2) = 'HU' THEN 'HU'
            WHEN substring(${postal_code},1,2) = 'HX' THEN 'HX'
            WHEN substring(${postal_code},1,2) = 'IG' THEN 'IG'
            WHEN substring(${postal_code},1,2) = 'IP' THEN 'IP'
            WHEN substring(${postal_code},1,2) = 'IV' THEN 'IV'
            WHEN substring(${postal_code},1,2) = 'KA' THEN 'KA'
            WHEN substring(${postal_code},1,2) = 'KT' THEN 'KT'
            WHEN substring(${postal_code},1,2) = 'KW' THEN 'KW'
            WHEN substring(${postal_code},1,2) = 'KY' THEN 'KY'
            WHEN substring(${postal_code},1,2) = 'L' THEN 'L'
            WHEN substring(${postal_code},1,2) = 'LA' THEN 'LA'
            WHEN substring(${postal_code},1,2) = 'LD' THEN 'LD'
            WHEN substring(${postal_code},1,2) = 'LE' THEN 'LE'
            WHEN substring(${postal_code},1,2) = 'LL' THEN 'LL'
            WHEN substring(${postal_code},1,2) = 'LN' THEN 'LN'
            WHEN substring(${postal_code},1,2) = 'LS' THEN 'LS'
            WHEN substring(${postal_code},1,2) = 'LU' THEN 'LU'
            WHEN substring(${postal_code},1,2) = 'M' THEN 'M'
            WHEN substring(${postal_code},1,2) = 'ME' THEN 'ME'
            WHEN substring(${postal_code},1,2) = 'MK' THEN 'MK'
            WHEN substring(${postal_code},1,2) = 'ML' THEN 'ML'
            WHEN substring(${postal_code},1,2) = 'N' THEN 'N'
            WHEN substring(${postal_code},1,2) = 'NE' THEN 'NE'
            WHEN substring(${postal_code},1,2) = 'NG' THEN 'NG'
            WHEN substring(${postal_code},1,2) = 'NN' THEN 'NN'
            WHEN substring(${postal_code},1,2) = 'NP' THEN 'NP'
            WHEN substring(${postal_code},1,2) = 'NR' THEN 'NR'
            WHEN substring(${postal_code},1,2) = 'NW' THEN 'NW'
            WHEN substring(${postal_code},1,2) = 'OL' THEN 'OL'
            WHEN substring(${postal_code},1,2) = 'OX' THEN 'OX'
            WHEN substring(${postal_code},1,2) = 'PA' THEN 'PA'
            WHEN substring(${postal_code},1,2) = 'PE' THEN 'PE'
            WHEN substring(${postal_code},1,2) = 'PH' THEN 'PH'
            WHEN substring(${postal_code},1,2) = 'PL' THEN 'PL'
            WHEN substring(${postal_code},1,2) = 'PO' THEN 'PO'
            WHEN substring(${postal_code},1,2) = 'PR' THEN 'PR'
            WHEN substring(${postal_code},1,2) = 'RG' THEN 'RG'
            WHEN substring(${postal_code},1,2) = 'RH' THEN 'RH'
            WHEN substring(${postal_code},1,2) = 'RM' THEN 'RM'
            WHEN substring(${postal_code},1,2) = 'S' THEN 'S'
            WHEN substring(${postal_code},1,2) = 'SA' THEN 'SA'
            WHEN substring(${postal_code},1,2) = 'SE' THEN 'SE'
            WHEN substring(${postal_code},1,2) = 'SG' THEN 'SG'
            WHEN substring(${postal_code},1,2) = 'SK' THEN 'SK'
            WHEN substring(${postal_code},1,2) = 'SL' THEN 'SL'
            WHEN substring(${postal_code},1,2) = 'SM' THEN 'SM'
            WHEN substring(${postal_code},1,2) = 'SN' THEN 'SN'
            WHEN substring(${postal_code},1,2) = 'SO' THEN 'SO'
            WHEN substring(${postal_code},1,2) = 'SP' THEN 'SP'
            WHEN substring(${postal_code},1,2) = 'SR' THEN 'SR'
            WHEN substring(${postal_code},1,2) = 'SS' THEN 'SS'
            WHEN substring(${postal_code},1,2) = 'ST' THEN 'ST'
            WHEN substring(${postal_code},1,2) = 'SW' THEN 'SW'
            WHEN substring(${postal_code},1,2) = 'SY' THEN 'SY'
            WHEN substring(${postal_code},1,2) = 'TA' THEN 'TA'
            WHEN substring(${postal_code},1,2) = 'TD' THEN 'TD'
            WHEN substring(${postal_code},1,2) = 'TF' THEN 'TF'
            WHEN substring(${postal_code},1,2) = 'TN' THEN 'TN'
            WHEN substring(${postal_code},1,2) = 'TQ' THEN 'TQ'
            WHEN substring(${postal_code},1,2) = 'TR' THEN 'TR'
            WHEN substring(${postal_code},1,2) = 'TS' THEN 'TS'
            WHEN substring(${postal_code},1,2) = 'TW' THEN 'TW'
            WHEN substring(${postal_code},1,2) = 'UB' THEN 'UB'
            WHEN substring(${postal_code},1,2) = 'W' THEN 'W'
            WHEN substring(${postal_code},1,2) = 'WA' THEN 'WA'
            WHEN substring(${postal_code},1,2) = 'WC' THEN 'WC'
            WHEN substring(${postal_code},1,2) = 'WD' THEN 'WD'
            WHEN substring(${postal_code},1,2) = 'WF' THEN 'WF'
            WHEN substring(${postal_code},1,2) = 'WN' THEN 'WN'
            WHEN substring(${postal_code},1,2) = 'WR' THEN 'WR'
            WHEN substring(${postal_code},1,2) = 'WS' THEN 'WS'
            WHEN substring(${postal_code},1,2) = 'WV' THEN 'WV'
            WHEN substring(${postal_code},1,2) = 'YO' THEN 'YO'
            WHEN substring(${postal_code},1,2) = 'ZE' THEN 'ZE'
            WHEN substring(${postal_code},1,2) = 'ab' THEN 'AB'
            WHEN substring(${postal_code},1,2) = 'al' THEN 'AL'
            WHEN substring(${postal_code},1,2) = 'b' THEN 'B'
            WHEN substring(${postal_code},1,2) = 'ba' THEN 'BA'
            WHEN substring(${postal_code},1,2) = 'bb' THEN 'BB'
            WHEN substring(${postal_code},1,2) = 'bd' THEN 'BD'
            WHEN substring(${postal_code},1,2) = 'bh' THEN 'BH'
            WHEN substring(${postal_code},1,2) = 'bl' THEN 'BL'
            WHEN substring(${postal_code},1,2) = 'bn' THEN 'BN'
            WHEN substring(${postal_code},1,2) = 'br' THEN 'BR'
            WHEN substring(${postal_code},1,2) = 'bs' THEN 'BS'
            WHEN substring(${postal_code},1,2) = 'bt' THEN 'BT'
            WHEN substring(${postal_code},1,2) = 'ca' THEN 'CA'
            WHEN substring(${postal_code},1,2) = 'cb' THEN 'CB'
            WHEN substring(${postal_code},1,2) = 'cf' THEN 'CF'
            WHEN substring(${postal_code},1,2) = 'ch' THEN 'CH'
            WHEN substring(${postal_code},1,2) = 'cm' THEN 'CM'
            WHEN substring(${postal_code},1,2) = 'co' THEN 'CO'
            WHEN substring(${postal_code},1,2) = 'cr' THEN 'CR'
            WHEN substring(${postal_code},1,2) = 'ct' THEN 'CT'
            WHEN substring(${postal_code},1,2) = 'cv' THEN 'CV'
            WHEN substring(${postal_code},1,2) = 'cw' THEN 'CW'
            WHEN substring(${postal_code},1,2) = 'da' THEN 'DA'
            WHEN substring(${postal_code},1,2) = 'dd' THEN 'DD'
            WHEN substring(${postal_code},1,2) = 'de' THEN 'DE'
            WHEN substring(${postal_code},1,2) = 'dg' THEN 'DG'
            WHEN substring(${postal_code},1,2) = 'dh' THEN 'DH'
            WHEN substring(${postal_code},1,2) = 'dl' THEN 'DL'
            WHEN substring(${postal_code},1,2) = 'dn' THEN 'DN'
            WHEN substring(${postal_code},1,2) = 'dt' THEN 'DT'
            WHEN substring(${postal_code},1,2) = 'dy' THEN 'DY'
            WHEN substring(${postal_code},1,2) = 'e' THEN 'E'
            WHEN substring(${postal_code},1,2) = 'ec' THEN 'EC'
            WHEN substring(${postal_code},1,2) = 'eh' THEN 'EH'
            WHEN substring(${postal_code},1,2) = 'en' THEN 'EN'
            WHEN substring(${postal_code},1,2) = 'ex' THEN 'EX'
            WHEN substring(${postal_code},1,2) = 'fk' THEN 'FK'
            WHEN substring(${postal_code},1,2) = 'fy' THEN 'FY'
            WHEN substring(${postal_code},1,2) = 'g' THEN 'G'
            WHEN substring(${postal_code},1,2) = 'gl' THEN 'GL'
            WHEN substring(${postal_code},1,2) = 'gu' THEN 'GU'
            WHEN substring(${postal_code},1,2) = 'ha' THEN 'HA'
            WHEN substring(${postal_code},1,2) = 'hd' THEN 'HD'
            WHEN substring(${postal_code},1,2) = 'hg' THEN 'HG'
            WHEN substring(${postal_code},1,2) = 'hp' THEN 'HP'
            WHEN substring(${postal_code},1,2) = 'hr' THEN 'HR'
            WHEN substring(${postal_code},1,2) = 'hs' THEN 'HS'
            WHEN substring(${postal_code},1,2) = 'hu' THEN 'HU'
            WHEN substring(${postal_code},1,2) = 'hx' THEN 'HX'
            WHEN substring(${postal_code},1,2) = 'ig' THEN 'IG'
            WHEN substring(${postal_code},1,2) = 'ip' THEN 'IP'
            WHEN substring(${postal_code},1,2) = 'iv' THEN 'IV'
            WHEN substring(${postal_code},1,2) = 'ka' THEN 'KA'
            WHEN substring(${postal_code},1,2) = 'kt' THEN 'KT'
            WHEN substring(${postal_code},1,2) = 'kw' THEN 'KW'
            WHEN substring(${postal_code},1,2) = 'ky' THEN 'KY'
            WHEN substring(${postal_code},1,2) = 'l' THEN 'L'
            WHEN substring(${postal_code},1,2) = 'la' THEN 'LA'
            WHEN substring(${postal_code},1,2) = 'ld' THEN 'LD'
            WHEN substring(${postal_code},1,2) = 'le' THEN 'LE'
            WHEN substring(${postal_code},1,2) = 'll' THEN 'LL'
            WHEN substring(${postal_code},1,2) = 'ln' THEN 'LN'
            WHEN substring(${postal_code},1,2) = 'ls' THEN 'LS'
            WHEN substring(${postal_code},1,2) = 'lu' THEN 'LU'
            WHEN substring(${postal_code},1,2) = 'm' THEN 'M'
            WHEN substring(${postal_code},1,2) = 'me' THEN 'ME'
            WHEN substring(${postal_code},1,2) = 'mk' THEN 'MK'
            WHEN substring(${postal_code},1,2) = 'ml' THEN 'ML'
            WHEN substring(${postal_code},1,2) = 'n' THEN 'N'
            WHEN substring(${postal_code},1,2) = 'ne' THEN 'NE'
            WHEN substring(${postal_code},1,2) = 'ng' THEN 'NG'
            WHEN substring(${postal_code},1,2) = 'nn' THEN 'NN'
            WHEN substring(${postal_code},1,2) = 'np' THEN 'NP'
            WHEN substring(${postal_code},1,2) = 'nr' THEN 'NR'
            WHEN substring(${postal_code},1,2) = 'nw' THEN 'NW'
            WHEN substring(${postal_code},1,2) = 'ol' THEN 'OL'
            WHEN substring(${postal_code},1,2) = 'ox' THEN 'OX'
            WHEN substring(${postal_code},1,2) = 'pa' THEN 'PA'
            WHEN substring(${postal_code},1,2) = 'pe' THEN 'PE'
            WHEN substring(${postal_code},1,2) = 'ph' THEN 'PH'
            WHEN substring(${postal_code},1,2) = 'pl' THEN 'PL'
            WHEN substring(${postal_code},1,2) = 'po' THEN 'PO'
            WHEN substring(${postal_code},1,2) = 'pr' THEN 'PR'
            WHEN substring(${postal_code},1,2) = 'rg' THEN 'RG'
            WHEN substring(${postal_code},1,2) = 'rh' THEN 'RH'
            WHEN substring(${postal_code},1,2) = 'rm' THEN 'RM'
            WHEN substring(${postal_code},1,2) = 's' THEN 'S'
            WHEN substring(${postal_code},1,2) = 'sa' THEN 'SA'
            WHEN substring(${postal_code},1,2) = 'se' THEN 'SE'
            WHEN substring(${postal_code},1,2) = 'sg' THEN 'SG'
            WHEN substring(${postal_code},1,2) = 'sk' THEN 'SK'
            WHEN substring(${postal_code},1,2) = 'sl' THEN 'SL'
            WHEN substring(${postal_code},1,2) = 'sm' THEN 'SM'
            WHEN substring(${postal_code},1,2) = 'sn' THEN 'SN'
            WHEN substring(${postal_code},1,2) = 'so' THEN 'SO'
            WHEN substring(${postal_code},1,2) = 'sp' THEN 'SP'
            WHEN substring(${postal_code},1,2) = 'sr' THEN 'SR'
            WHEN substring(${postal_code},1,2) = 'ss' THEN 'SS'
            WHEN substring(${postal_code},1,2) = 'st' THEN 'ST'
            WHEN substring(${postal_code},1,2) = 'sw' THEN 'SW'
            WHEN substring(${postal_code},1,2) = 'sy' THEN 'SY'
            WHEN substring(${postal_code},1,2) = 'ta' THEN 'TA'
            WHEN substring(${postal_code},1,2) = 'td' THEN 'TD'
            WHEN substring(${postal_code},1,2) = 'tf' THEN 'TF'
            WHEN substring(${postal_code},1,2) = 'tn' THEN 'TN'
            WHEN substring(${postal_code},1,2) = 'tq' THEN 'TQ'
            WHEN substring(${postal_code},1,2) = 'tr' THEN 'TR'
            WHEN substring(${postal_code},1,2) = 'ts' THEN 'TS'
            WHEN substring(${postal_code},1,2) = 'tw' THEN 'TW'
            WHEN substring(${postal_code},1,2) = 'ub' THEN 'UB'
            WHEN substring(${postal_code},1,2) = 'w' THEN 'W'
            WHEN substring(${postal_code},1,2) = 'wa' THEN 'WA'
            WHEN substring(${postal_code},1,2) = 'wc' THEN 'WC'
            WHEN substring(${postal_code},1,2) = 'wd' THEN 'WD'
            WHEN substring(${postal_code},1,2) = 'wf' THEN 'WF'
            WHEN substring(${postal_code},1,2) = 'wn' THEN 'WN'
            WHEN substring(${postal_code},1,2) = 'wr' THEN 'WR'
            WHEN substring(${postal_code},1,2) = 'ws' THEN 'WS'
            WHEN substring(${postal_code},1,2) = 'wv' THEN 'WV'
            WHEN substring(${postal_code},1,2) = 'yo' THEN 'YO'
            WHEN substring(${postal_code},1,2) = 'ze' THEN 'ZE'
            WHEN substring(${postal_code},1,2) = 'Ab' THEN 'AB'
            WHEN substring(${postal_code},1,2) = 'Al' THEN 'AL'
            WHEN substring(${postal_code},1,2) = 'B' THEN 'B'
            WHEN substring(${postal_code},1,2) = 'Ba' THEN 'BA'
            WHEN substring(${postal_code},1,2) = 'Bb' THEN 'BB'
            WHEN substring(${postal_code},1,2) = 'Bd' THEN 'BD'
            WHEN substring(${postal_code},1,2) = 'Bh' THEN 'BH'
            WHEN substring(${postal_code},1,2) = 'Bl' THEN 'BL'
            WHEN substring(${postal_code},1,2) = 'Bn' THEN 'BN'
            WHEN substring(${postal_code},1,2) = 'Br' THEN 'BR'
            WHEN substring(${postal_code},1,2) = 'Bs' THEN 'BS'
            WHEN substring(${postal_code},1,2) = 'Bt' THEN 'BT'
            WHEN substring(${postal_code},1,2) = 'Ca' THEN 'CA'
            WHEN substring(${postal_code},1,2) = 'Cb' THEN 'CB'
            WHEN substring(${postal_code},1,2) = 'Cf' THEN 'CF'
            WHEN substring(${postal_code},1,2) = 'Ch' THEN 'CH'
            WHEN substring(${postal_code},1,2) = 'Cm' THEN 'CM'
            WHEN substring(${postal_code},1,2) = 'Co' THEN 'CO'
            WHEN substring(${postal_code},1,2) = 'Cr' THEN 'CR'
            WHEN substring(${postal_code},1,2) = 'Ct' THEN 'CT'
            WHEN substring(${postal_code},1,2) = 'Cv' THEN 'CV'
            WHEN substring(${postal_code},1,2) = 'Cw' THEN 'CW'
            WHEN substring(${postal_code},1,2) = 'Da' THEN 'DA'
            WHEN substring(${postal_code},1,2) = 'Dd' THEN 'DD'
            WHEN substring(${postal_code},1,2) = 'De' THEN 'DE'
            WHEN substring(${postal_code},1,2) = 'Dg' THEN 'DG'
            WHEN substring(${postal_code},1,2) = 'Dh' THEN 'DH'
            WHEN substring(${postal_code},1,2) = 'Dl' THEN 'DL'
            WHEN substring(${postal_code},1,2) = 'Dn' THEN 'DN'
            WHEN substring(${postal_code},1,2) = 'Dt' THEN 'DT'
            WHEN substring(${postal_code},1,2) = 'Dy' THEN 'DY'
            WHEN substring(${postal_code},1,2) = 'E' THEN 'E'
            WHEN substring(${postal_code},1,2) = 'Ec' THEN 'EC'
            WHEN substring(${postal_code},1,2) = 'Eh' THEN 'EH'
            WHEN substring(${postal_code},1,2) = 'En' THEN 'EN'
            WHEN substring(${postal_code},1,2) = 'Ex' THEN 'EX'
            WHEN substring(${postal_code},1,2) = 'Fk' THEN 'FK'
            WHEN substring(${postal_code},1,2) = 'Fy' THEN 'FY'
            WHEN substring(${postal_code},1,2) = 'G' THEN 'G'
            WHEN substring(${postal_code},1,2) = 'Gl' THEN 'GL'
            WHEN substring(${postal_code},1,2) = 'Gu' THEN 'GU'
            WHEN substring(${postal_code},1,2) = 'Ha' THEN 'HA'
            WHEN substring(${postal_code},1,2) = 'Hd' THEN 'HD'
            WHEN substring(${postal_code},1,2) = 'Hg' THEN 'HG'
            WHEN substring(${postal_code},1,2) = 'Hp' THEN 'HP'
            WHEN substring(${postal_code},1,2) = 'Hr' THEN 'HR'
            WHEN substring(${postal_code},1,2) = 'Hs' THEN 'HS'
            WHEN substring(${postal_code},1,2) = 'Hu' THEN 'HU'
            WHEN substring(${postal_code},1,2) = 'Hx' THEN 'HX'
            WHEN substring(${postal_code},1,2) = 'Ig' THEN 'IG'
            WHEN substring(${postal_code},1,2) = 'Ip' THEN 'IP'
            WHEN substring(${postal_code},1,2) = 'Iv' THEN 'IV'
            WHEN substring(${postal_code},1,2) = 'Ka' THEN 'KA'
            WHEN substring(${postal_code},1,2) = 'Kt' THEN 'KT'
            WHEN substring(${postal_code},1,2) = 'Kw' THEN 'KW'
            WHEN substring(${postal_code},1,2) = 'Ky' THEN 'KY'
            WHEN substring(${postal_code},1,2) = 'L' THEN 'L'
            WHEN substring(${postal_code},1,2) = 'La' THEN 'LA'
            WHEN substring(${postal_code},1,2) = 'Ld' THEN 'LD'
            WHEN substring(${postal_code},1,2) = 'Le' THEN 'LE'
            WHEN substring(${postal_code},1,2) = 'Ll' THEN 'LL'
            WHEN substring(${postal_code},1,2) = 'Ln' THEN 'LN'
            WHEN substring(${postal_code},1,2) = 'Ls' THEN 'LS'
            WHEN substring(${postal_code},1,2) = 'Lu' THEN 'LU'
            WHEN substring(${postal_code},1,2) = 'M' THEN 'M'
            WHEN substring(${postal_code},1,2) = 'Me' THEN 'ME'
            WHEN substring(${postal_code},1,2) = 'Mk' THEN 'MK'
            WHEN substring(${postal_code},1,2) = 'Ml' THEN 'ML'
            WHEN substring(${postal_code},1,2) = 'N' THEN 'N'
            WHEN substring(${postal_code},1,2) = 'Ne' THEN 'NE'
            WHEN substring(${postal_code},1,2) = 'Ng' THEN 'NG'
            WHEN substring(${postal_code},1,2) = 'Nn' THEN 'NN'
            WHEN substring(${postal_code},1,2) = 'Np' THEN 'NP'
            WHEN substring(${postal_code},1,2) = 'Nr' THEN 'NR'
            WHEN substring(${postal_code},1,2) = 'Nw' THEN 'NW'
            WHEN substring(${postal_code},1,2) = 'Ol' THEN 'OL'
            WHEN substring(${postal_code},1,2) = 'Ox' THEN 'OX'
            WHEN substring(${postal_code},1,2) = 'Pa' THEN 'PA'
            WHEN substring(${postal_code},1,2) = 'Pe' THEN 'PE'
            WHEN substring(${postal_code},1,2) = 'Ph' THEN 'PH'
            WHEN substring(${postal_code},1,2) = 'Pl' THEN 'PL'
            WHEN substring(${postal_code},1,2) = 'Po' THEN 'PO'
            WHEN substring(${postal_code},1,2) = 'Pr' THEN 'PR'
            WHEN substring(${postal_code},1,2) = 'Rg' THEN 'RG'
            WHEN substring(${postal_code},1,2) = 'Rh' THEN 'RH'
            WHEN substring(${postal_code},1,2) = 'Rm' THEN 'RM'
            WHEN substring(${postal_code},1,2) = 'S' THEN 'S'
            WHEN substring(${postal_code},1,2) = 'Sa' THEN 'SA'
            WHEN substring(${postal_code},1,2) = 'Se' THEN 'SE'
            WHEN substring(${postal_code},1,2) = 'Sg' THEN 'SG'
            WHEN substring(${postal_code},1,2) = 'Sk' THEN 'SK'
            WHEN substring(${postal_code},1,2) = 'Sl' THEN 'SL'
            WHEN substring(${postal_code},1,2) = 'Sm' THEN 'SM'
            WHEN substring(${postal_code},1,2) = 'Sn' THEN 'SN'
            WHEN substring(${postal_code},1,2) = 'So' THEN 'SO'
            WHEN substring(${postal_code},1,2) = 'Sp' THEN 'SP'
            WHEN substring(${postal_code},1,2) = 'Sr' THEN 'SR'
            WHEN substring(${postal_code},1,2) = 'Ss' THEN 'SS'
            WHEN substring(${postal_code},1,2) = 'St' THEN 'ST'
            WHEN substring(${postal_code},1,2) = 'Sw' THEN 'SW'
            WHEN substring(${postal_code},1,2) = 'Sy' THEN 'SY'
            WHEN substring(${postal_code},1,2) = 'Ta' THEN 'TA'
            WHEN substring(${postal_code},1,2) = 'Td' THEN 'TD'
            WHEN substring(${postal_code},1,2) = 'Tf' THEN 'TF'
            WHEN substring(${postal_code},1,2) = 'Tn' THEN 'TN'
            WHEN substring(${postal_code},1,2) = 'Tq' THEN 'TQ'
            WHEN substring(${postal_code},1,2) = 'Tr' THEN 'TR'
            WHEN substring(${postal_code},1,2) = 'Ts' THEN 'TS'
            WHEN substring(${postal_code},1,2) = 'Tw' THEN 'TW'
            WHEN substring(${postal_code},1,2) = 'Ub' THEN 'UB'
            WHEN substring(${postal_code},1,2) = 'W' THEN 'W'
            WHEN substring(${postal_code},1,2) = 'Wa' THEN 'WA'
            WHEN substring(${postal_code},1,2) = 'Wc' THEN 'WC'
            WHEN substring(${postal_code},1,2) = 'Wd' THEN 'WD'
            WHEN substring(${postal_code},1,2) = 'Wf' THEN 'WF'
            WHEN substring(${postal_code},1,2) = 'Wn' THEN 'WN'
            WHEN substring(${postal_code},1,2) = 'Wr' THEN 'WR'
            WHEN substring(${postal_code},1,2) = 'Ws' THEN 'WS'
            WHEN substring(${postal_code},1,2) = 'Wv' THEN 'WV'
            WHEN substring(${postal_code},1,2) = 'Yo' THEN 'YO'
            WHEN substring(${postal_code},1,2) = 'Ze' THEN 'ZE'
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
    hidden: TRUE
    type: string
    sql: ${TABLE}.title

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

