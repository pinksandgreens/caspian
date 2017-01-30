view: responsys_engaged_list {
  sql_table_name: responsys.responsys_engaged_list_temp ;;

  dimension: age_banding {
    type: string
    sql: CASE
        WHEN ${TABLE}.age_banding = ' ' THEN 'Unknown'
        WHEN ${TABLE}.age_banding IS NULL THEN 'Unknown'
        ELSE ${TABLE}.age_banding
      END
       ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: email_address {
    hidden: yes
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: gender {
    type: string
    sql: CASE
        WHEN ${TABLE}.gender = 'M' THEN 'Male'
        WHEN ${TABLE}.gender = 'm' THEN 'Male'
        WHEN ${TABLE}.gender = 'F' THEN 'Female'
        WHEN ${TABLE}.gender = 'f' THEN 'Female'
        WHEN ${TABLE}.gender = 'P' THEN 'Unknown'
        WHEN ${TABLE}.gender = 'p' THEN 'Unknown'
        WHEN ${TABLE}.gender = 'U' THEN 'Unknown'
        WHEN ${TABLE}.gender = 'u' THEN 'Unknown'
        WHEN ${TABLE}.gender = ' ' THEN 'Unknown'
        ELSE 'Unknown'
      END
       ;;
  }

  dimension: postal_code {
    type: string
    sql: CASE
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
       ;;
  }

  dimension: postal_area1 {
    label: "Postal Area"
    type: string
    sql: CASE
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
       ;;
  }

  dimension: riid {
    type: string
    sql: ${TABLE}.riid ;;
  }

  measure: unique_users {
    type: count_distinct
    sql: ${TABLE}.email_address ;;
  }
}
