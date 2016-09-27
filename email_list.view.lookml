
- view: email_list
  derived_table:
    sql: |
      SELECT 
        responsys_engaged_list.riid AS "responsys_engaged_list.riid",
        responsys_engaged_list.email_address AS "responsys_engaged_list.email_address",
        CASE
        WHEN responsys_engaged_list.age_banding = ' ' THEN 'Unknown'
        WHEN responsys_engaged_list.age_banding IS NULL THEN 'Unknown'
        ELSE responsys_engaged_list.age_banding
      END
       AS "responsys_engaged_list.age_banding",
        responsys_engaged_list.country AS "responsys_engaged_list.country",
        CASE
        WHEN responsys_engaged_list.gender = 'M' THEN 'Male'
        WHEN responsys_engaged_list.gender = 'm' THEN 'Male'
        WHEN responsys_engaged_list.gender = 'F' THEN 'Female'
        WHEN responsys_engaged_list.gender = 'f' THEN 'Female'
        WHEN responsys_engaged_list.gender = 'P' THEN 'Unknown'
        WHEN responsys_engaged_list.gender = 'p' THEN 'Unknown'
        WHEN responsys_engaged_list.gender = 'U' THEN 'Unknown'
        WHEN responsys_engaged_list.gender = 'u' THEN 'Unknown'
        WHEN responsys_engaged_list.gender = ' ' THEN 'Unknown'
        ELSE 'Unknown'
      END
        
       AS "responsys_engaged_list.gender",
        CASE 
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'AB' THEN 'AB'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'AL' THEN 'AL'
           WHEN TRANSLATE(substring(responsys_engaged_list.postal_code,1,2), '1234567890', '') = 'B' THEN 'B'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'BA' THEN 'BA'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'BB' THEN 'BB'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'BD' THEN 'BD'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'BH' THEN 'BH'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'BL' THEN 'BL'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'BN' THEN 'BN'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'BR' THEN 'BR'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'BS' THEN 'BS'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'BT' THEN 'BT'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'CA' THEN 'CA'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'CB' THEN 'CB'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'CF' THEN 'CF'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'CH' THEN 'CH'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'CM' THEN 'CM'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'CO' THEN 'CO'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'CR' THEN 'CR'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'CT' THEN 'CT'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'CV' THEN 'CV'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'CW' THEN 'CW'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'DA' THEN 'DA'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'DD' THEN 'DD'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'DE' THEN 'DE'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'DG' THEN 'DG'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'DH' THEN 'DH'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'DL' THEN 'DL'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'DN' THEN 'DN'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'DT' THEN 'DT'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'DY' THEN 'DY'
           WHEN TRANSLATE(substring(responsys_engaged_list.postal_code,1,2), '1234567890', '') = 'E' THEN 'E'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'EC' THEN 'EC'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'EH' THEN 'EH'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'EN' THEN 'EN'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'EX' THEN 'EX'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'FK' THEN 'FK'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'FY' THEN 'FY'
           WHEN TRANSLATE(substring(responsys_engaged_list.postal_code,1,2), '1234567890', '') = 'G' THEN 'G'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'GL' THEN 'GL'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'GU' THEN 'GU'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'HA' THEN 'HA'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'HD' THEN 'HD'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'HG' THEN 'HG'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'HP' THEN 'HP'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'HR' THEN 'HR'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'HS' THEN 'HS'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'HU' THEN 'HU'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'HX' THEN 'HX'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'IG' THEN 'IG'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'IP' THEN 'IP'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'IV' THEN 'IV'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'KA' THEN 'KA'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'KT' THEN 'KT'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'KW' THEN 'KW'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'KY' THEN 'KY'
           WHEN TRANSLATE(substring(responsys_engaged_list.postal_code,1,2), '1234567890', '') = 'L' THEN 'L'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'LA' THEN 'LA'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'LD' THEN 'LD'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'LE' THEN 'LE'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'LL' THEN 'LL'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'LN' THEN 'LN'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'LS' THEN 'LS'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'LU' THEN 'LU'
           WHEN TRANSLATE(substring(responsys_engaged_list.postal_code,1,2), '1234567890', '') = 'M' THEN 'M'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'ME' THEN 'ME'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'MK' THEN 'MK'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'ML' THEN 'ML'
           WHEN TRANSLATE(substring(responsys_engaged_list.postal_code,1,2), '1234567890', '') = 'N' THEN 'N'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'NE' THEN 'NE'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'NG' THEN 'NG'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'NN' THEN 'NN'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'NP' THEN 'NP'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'NR' THEN 'NR'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'NW' THEN 'NW'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'OL' THEN 'OL'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'OX' THEN 'OX'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'PA' THEN 'PA'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'PE' THEN 'PE'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'PH' THEN 'PH'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'PL' THEN 'PL'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'PO' THEN 'PO'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'PR' THEN 'PR'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'RG' THEN 'RG'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'RH' THEN 'RH'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'RM' THEN 'RM'
           WHEN TRANSLATE(substring(responsys_engaged_list.postal_code,1,2), '1234567890', '') = 'S' THEN 'S'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'SA' THEN 'SA'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'SE' THEN 'SE'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'SG' THEN 'SG'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'SK' THEN 'SK'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'SL' THEN 'SL'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'SM' THEN 'SM'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'SN' THEN 'SN'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'SO' THEN 'SO'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'SP' THEN 'SP'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'SR' THEN 'SR'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'SS' THEN 'SS'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'ST' THEN 'ST'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'SW' THEN 'SW'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'SY' THEN 'SY'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'TA' THEN 'TA'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'TD' THEN 'TD'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'TF' THEN 'TF'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'TN' THEN 'TN'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'TQ' THEN 'TQ'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'TR' THEN 'TR'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'TS' THEN 'TS'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'TW' THEN 'TW'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'UB' THEN 'UB'
           WHEN TRANSLATE(substring(responsys_engaged_list.postal_code,1,2), '1234567890', '') = 'W' THEN 'W'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'WA' THEN 'WA'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'WC' THEN 'WC'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'WD' THEN 'WD'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'WF' THEN 'WF'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'WN' THEN 'WN'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'WR' THEN 'WR'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'WS' THEN 'WS'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'WV' THEN 'WV'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'YO' THEN 'YO'
           WHEN substring(responsys_engaged_list.postal_code,1,2) = 'ZE' THEN 'ZE'
      END
       AS "responsys_engaged_list.postal_area1",
        CASE
        WHEN UPPER(responsys_engaged_list.postal_code) LIKE '[A-Z][A-Z][0-9][0-9][A-Z][A-Z]' THEN LEFT(UPPER(responsys_engaged_list.postal_code),3)+' '+RIGHT(UPPER(responsys_engaged_list.postal_code),3)
        WHEN UPPER(responsys_engaged_list.postal_code) LIKE '[A-Z][0-9][0-9][A-Z][A-Z]' THEN LEFT(UPPER(responsys_engaged_list.postal_code),2)+' '+RIGHT(UPPER(responsys_engaged_list.postal_code),3)
        WHEN UPPER(responsys_engaged_list.postal_code) LIKE '[A-Z][0-9][0-9][0-9][A-Z][A-Z]' THEN LEFT(UPPER(responsys_engaged_list.postal_code),3)+' '+RIGHT(UPPER(responsys_engaged_list.postal_code),3)
        WHEN UPPER(responsys_engaged_list.postal_code) LIKE '[A-Z][0-9][A-Z][0-9][A-Z][A-Z]' THEN LEFT(UPPER(responsys_engaged_list.postal_code),3)+' '+RIGHT(UPPER(responsys_engaged_list.postal_code),3)
        WHEN UPPER(responsys_engaged_list.postal_code) LIKE '[A-Z][A-Z][0-9][0-9][0-9][A-Z][A-Z]' THEN LEFT(UPPER(responsys_engaged_list.postal_code),4)+' '+RIGHT(UPPER(responsys_engaged_list.postal_code),3)
        WHEN UPPER(responsys_engaged_list.postal_code) LIKE '[A-Z][A-Z][0-9][A-Z][0-9][A-Z][A-Z]' THEN LEFT(UPPER(responsys_engaged_list.postal_code),4)+' '+RIGHT(UPPER(responsys_engaged_list.postal_code),3)
        WHEN UPPER(responsys_engaged_list.postal_code) LIKE 'UK%' THEN 'Unknown'
        WHEN UPPER(responsys_engaged_list.postal_code) LIKE 'UNITED KIN%' THEN 'Unknown'
        WHEN UPPER(responsys_engaged_list.postal_code) LIKE 'OTHER%' THEN 'Unknown'
        WHEN UPPER(responsys_engaged_list.postal_code) LIKE 'IRELAND%' THEN 'Unknown'
        WHEN UPPER(responsys_engaged_list.postal_code) LIKE 'FULL%' THEN 'Unknown'
        WHEN UPPER(responsys_engaged_list.postal_code) LIKE 'N/A%' THEN 'Unknown'
        WHEN UPPER(responsys_engaged_list.postal_code) LIKE '0%' THEN 'Unknown'
        WHEN UPPER(responsys_engaged_list.postal_code) LIKE 'GB%' THEN 'Unknown'
        WHEN UPPER(responsys_engaged_list.postal_code) LIKE 'ERIRE%' THEN 'Unknown'
        WHEN UPPER(responsys_engaged_list.postal_code) LIKE 'NONE%' THEN 'Unknown'
        WHEN UPPER(responsys_engaged_list.postal_code) LIKE 'ZZZ%' THEN 'Unknown'
        ELSE UPPER(responsys_engaged_list.postal_code)
      END
       AS "responsys_engaged_list.postal_code",
        CASE
        WHEN responsys_brand_permissions.brandcode LIKE '%campaign_brand%' THEN NULL
        WHEN responsys_brand_permissions.brandcode LIKE '%BRANDCODE%' THEN NULL
        ELSE responsys_brand_permissions.brandcode
      END
       AS "responsys_brand_permissions.brandcode",
        CASE
        WHEN responsys_newsletter_permissions.brandcode LIKE '%campaign_brand%' THEN NULL
        WHEN responsys_newsletter_permissions.brandcode LIKE '%BRANDCODE%' THEN NULL
        WHEN responsys_newsletter_permissions.brandcode = '106' THEN 'YHS'
        WHEN responsys_newsletter_permissions.brandcode = '107' THEN 'YRS'
        WHEN responsys_newsletter_permissions.brandcode = '108' THEN 'ZOO'
        WHEN responsys_newsletter_permissions.brandcode = '109' THEN 'ZOO'
        WHEN responsys_newsletter_permissions.brandcode = '110' THEN 'AIR'
        WHEN responsys_newsletter_permissions.brandcode = '111' THEN 'CFM'
        WHEN responsys_newsletter_permissions.brandcode = '112' THEN 'CL1'
        WHEN responsys_newsletter_permissions.brandcode = '113' THEN 'CL2'
        WHEN responsys_newsletter_permissions.brandcode = '114' THEN 'CL3'
        WHEN responsys_newsletter_permissions.brandcode = '115' THEN 'COO'
        WHEN responsys_newsletter_permissions.brandcode = '116' THEN 'FO1'
        WHEN responsys_newsletter_permissions.brandcode = '117' THEN 'HAL'
        WHEN responsys_newsletter_permissions.brandcode = '118' THEN 'KER'
        WHEN responsys_newsletter_permissions.brandcode = '119' THEN 'KEY'
        WHEN responsys_newsletter_permissions.brandcode = '120' THEN 'KIS'
        WHEN responsys_newsletter_permissions.brandcode = '121' THEN 'KRR'
        WHEN responsys_newsletter_permissions.brandcode = '122' THEN 'MAG'
        WHEN responsys_newsletter_permissions.brandcode = '123' THEN 'MET'
        WHEN responsys_newsletter_permissions.brandcode = '124' THEN 'MFR'
        WHEN responsys_newsletter_permissions.brandcode = '125' THEN 'AI2'
        WHEN responsys_newsletter_permissions.brandcode = '126' THEN 'KE2'
        WHEN responsys_newsletter_permissions.brandcode = '127' THEN 'RC2'
        WHEN responsys_newsletter_permissions.brandcode = '128' THEN 'TF2'
        WHEN responsys_newsletter_permissions.brandcode = '129' THEN 'ME2'
        WHEN responsys_newsletter_permissions.brandcode = '130' THEN 'VI2'
        WHEN responsys_newsletter_permissions.brandcode = '131' THEN 'HA2'
        WHEN responsys_newsletter_permissions.brandcode = '132' THEN 'NO1'
        WHEN responsys_newsletter_permissions.brandcode = '133' THEN 'NO2'
        WHEN responsys_newsletter_permissions.brandcode = '134' THEN 'RBO'
        WHEN responsys_newsletter_permissions.brandcode = '135' THEN 'RCT'
        WHEN responsys_newsletter_permissions.brandcode = '136' THEN 'ROC'
        WHEN responsys_newsletter_permissions.brandcode = '137' THEN 'TA2'
        WHEN responsys_newsletter_permissions.brandcode = '138' THEN 'TAF'
        WHEN responsys_newsletter_permissions.brandcode = '139' THEN 'TFM'
        WHEN responsys_newsletter_permissions.brandcode = '140' THEN 'VIK'
        WHEN responsys_newsletter_permissions.brandcode = '141' THEN 'WVE'
        WHEN responsys_newsletter_permissions.brandcode = '142' THEN 'RO2'
        WHEN responsys_newsletter_permissions.brandcode = '143' THEN 'TST'
        WHEN responsys_newsletter_permissions.brandcode = '144' THEN 'AUM'
        WHEN responsys_newsletter_permissions.brandcode = '145' THEN 'BWT'
        WHEN responsys_newsletter_permissions.brandcode = '146' THEN 'CCW'
        WHEN responsys_newsletter_permissions.brandcode = '147' THEN 'CLC'
        WHEN responsys_newsletter_permissions.brandcode = '148' THEN 'CMC'
        WHEN responsys_newsletter_permissions.brandcode = '149' THEN 'FLN'
        WHEN responsys_newsletter_permissions.brandcode = '150' THEN 'GAN'
        WHEN responsys_newsletter_permissions.brandcode = '151' THEN 'GTM'
        WHEN responsys_newsletter_permissions.brandcode = '152' THEN 'MAT'
        WHEN responsys_newsletter_permissions.brandcode = '153' THEN 'MDR'
        WHEN responsys_newsletter_permissions.brandcode = '154' THEN 'PFX'
        WHEN responsys_newsletter_permissions.brandcode = '155' THEN 'RAI'
        WHEN responsys_newsletter_permissions.brandcode = '156' THEN 'CTK'
        WHEN responsys_newsletter_permissions.brandcode = '157' THEN 'DOW'
        WHEN responsys_newsletter_permissions.brandcode = '158' THEN 'DTC'
        WHEN responsys_newsletter_permissions.brandcode = '159' THEN 'FO3'
        WHEN responsys_newsletter_permissions.brandcode = '160' THEN 'KE3'
        WHEN responsys_newsletter_permissions.brandcode = '161' THEN 'ME3'
        WHEN responsys_newsletter_permissions.brandcode = '162' THEN 'MF2'
        WHEN responsys_newsletter_permissions.brandcode = '163' THEN 'MF3'
        WHEN responsys_newsletter_permissions.brandcode = '164' THEN 'RC3'
        WHEN responsys_newsletter_permissions.brandcode = '165' THEN 'RO3'
        WHEN responsys_newsletter_permissions.brandcode = '166' THEN 'TA3'
        WHEN responsys_newsletter_permissions.brandcode = '167' THEN 'TF3'
        WHEN responsys_newsletter_permissions.brandcode = '168' THEN 'VI3'
        WHEN responsys_newsletter_permissions.brandcode = '169' THEN 'WES'
        WHEN responsys_newsletter_permissions.brandcode = '170' THEN 'WSF'
        WHEN responsys_newsletter_permissions.brandcode = '171' THEN 'WST'
        WHEN responsys_newsletter_permissions.brandcode = '172' THEN 'HIT'
        WHEN responsys_newsletter_permissions.brandcode = '173' THEN '2F1'
        WHEN responsys_newsletter_permissions.brandcode = '174' THEN '2F1'
        WHEN responsys_newsletter_permissions.brandcode = '175' THEN 'AUM'
        WHEN responsys_newsletter_permissions.brandcode = '177' THEN 'BIK'
        WHEN responsys_newsletter_permissions.brandcode = '178' THEN 'BIK'
        WHEN responsys_newsletter_permissions.brandcode = '179' THEN 'BWT'
        WHEN responsys_newsletter_permissions.brandcode = '180' THEN 'BWT'
        WHEN responsys_newsletter_permissions.brandcode = '181' THEN 'CAR'
        WHEN responsys_newsletter_permissions.brandcode = '182' THEN 'CAR'
        WHEN responsys_newsletter_permissions.brandcode = '183' THEN 'CLB'
        WHEN responsys_newsletter_permissions.brandcode = '184' THEN 'CLB'
        WHEN responsys_newsletter_permissions.brandcode = '185' THEN 'CCS'
        WHEN responsys_newsletter_permissions.brandcode = '186' THEN 'CCS'
        WHEN responsys_newsletter_permissions.brandcode = '187' THEN 'CCW'
        WHEN responsys_newsletter_permissions.brandcode = '188' THEN 'CCW'
        WHEN responsys_newsletter_permissions.brandcode = '189' THEN 'CIN'
        WHEN responsys_newsletter_permissions.brandcode = '190' THEN 'CIN'
        WHEN responsys_newsletter_permissions.brandcode = '191' THEN 'CLB'
        WHEN responsys_newsletter_permissions.brandcode = '192' THEN 'CLB'
        WHEN responsys_newsletter_permissions.brandcode = '193' THEN 'CLC'
        WHEN responsys_newsletter_permissions.brandcode = '194' THEN 'CLC'
        WHEN responsys_newsletter_permissions.brandcode = '195' THEN 'CLC'
        WHEN responsys_newsletter_permissions.brandcode = '196' THEN 'CLC'
        WHEN responsys_newsletter_permissions.brandcode = '197' THEN 'CLO'
        WHEN responsys_newsletter_permissions.brandcode = '198' THEN 'CLO'
        WHEN responsys_newsletter_permissions.brandcode = '199' THEN 'CMC'
        WHEN responsys_newsletter_permissions.brandcode = '200' THEN 'CMC'
        WHEN responsys_newsletter_permissions.brandcode = '201' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '202' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '203' THEN 'EMP'
        WHEN responsys_newsletter_permissions.brandcode = '204' THEN 'EMP'
        WHEN responsys_newsletter_permissions.brandcode = '205' THEN 'FHM'
        WHEN responsys_newsletter_permissions.brandcode = '206' THEN 'FHM'
        WHEN responsys_newsletter_permissions.brandcode = '207' THEN 'FLN'
        WHEN responsys_newsletter_permissions.brandcode = '208' THEN 'FLN'
        WHEN responsys_newsletter_permissions.brandcode = '209' THEN 'GAN'
        WHEN responsys_newsletter_permissions.brandcode = '210' THEN 'GAN'
        WHEN responsys_newsletter_permissions.brandcode = '211' THEN 'GNW'
        WHEN responsys_newsletter_permissions.brandcode = '212' THEN 'GNW'
        WHEN responsys_newsletter_permissions.brandcode = '213' THEN 'GNW'
        WHEN responsys_newsletter_permissions.brandcode = '214' THEN 'GOF'
        WHEN responsys_newsletter_permissions.brandcode = '215' THEN 'GOF'
        WHEN responsys_newsletter_permissions.brandcode = '216' THEN 'GRA'
        WHEN responsys_newsletter_permissions.brandcode = '217' THEN 'GRA'
        WHEN responsys_newsletter_permissions.brandcode = '218' THEN 'GTB'
        WHEN responsys_newsletter_permissions.brandcode = '219' THEN 'GTB'
        WHEN responsys_newsletter_permissions.brandcode = '220' THEN 'GTM'
        WHEN responsys_newsletter_permissions.brandcode = '221' THEN 'GTM'
        WHEN responsys_newsletter_permissions.brandcode = '222' THEN 'GWD'
        WHEN responsys_newsletter_permissions.brandcode = '223' THEN 'GWD'
        WHEN responsys_newsletter_permissions.brandcode = '224' THEN 'HDE'
        WHEN responsys_newsletter_permissions.brandcode = '225' THEN 'HDE'
        WHEN responsys_newsletter_permissions.brandcode = '226' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '227' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '228' THEN 'CLC'
        WHEN responsys_newsletter_permissions.brandcode = '229' THEN 'LFT'
        WHEN responsys_newsletter_permissions.brandcode = '230' THEN 'LFT'
        WHEN responsys_newsletter_permissions.brandcode = '231' THEN 'LRO'
        WHEN responsys_newsletter_permissions.brandcode = '232' THEN 'LRO'
        WHEN responsys_newsletter_permissions.brandcode = '233' THEN 'LSC'
        WHEN responsys_newsletter_permissions.brandcode = '234' THEN 'LSC'
        WHEN responsys_newsletter_permissions.brandcode = '235' THEN 'MAB'
        WHEN responsys_newsletter_permissions.brandcode = '236' THEN 'MAB'
        WHEN responsys_newsletter_permissions.brandcode = '237' THEN 'MAT'
        WHEN responsys_newsletter_permissions.brandcode = '238' THEN 'MAT'
        WHEN responsys_newsletter_permissions.brandcode = '239' THEN 'MCN'
        WHEN responsys_newsletter_permissions.brandcode = '240' THEN 'MCN'
        WHEN responsys_newsletter_permissions.brandcode = '241' THEN 'MCN'
        WHEN responsys_newsletter_permissions.brandcode = '242' THEN 'MCN'
        WHEN responsys_newsletter_permissions.brandcode = '243' THEN 'MDR'
        WHEN responsys_newsletter_permissions.brandcode = '244' THEN 'MDR'
        WHEN responsys_newsletter_permissions.brandcode = '245' THEN 'MOJ'
        WHEN responsys_newsletter_permissions.brandcode = '246' THEN 'MOJ'
        WHEN responsys_newsletter_permissions.brandcode = '247' THEN 'PAN'
        WHEN responsys_newsletter_permissions.brandcode = '248' THEN 'PAN'
        WHEN responsys_newsletter_permissions.brandcode = '249' THEN 'PBK'
        WHEN responsys_newsletter_permissions.brandcode = '250' THEN 'PBK'
        WHEN responsys_newsletter_permissions.brandcode = '251' THEN 'PCP'
        WHEN responsys_newsletter_permissions.brandcode = '252' THEN 'PCP'
        WHEN responsys_newsletter_permissions.brandcode = '253' THEN 'PCP'
        WHEN responsys_newsletter_permissions.brandcode = '254' THEN 'PCP'
        WHEN responsys_newsletter_permissions.brandcode = '255' THEN 'PFI'
        WHEN responsys_newsletter_permissions.brandcode = '256' THEN 'PFI'
        WHEN responsys_newsletter_permissions.brandcode = '257' THEN 'PFX'
        WHEN responsys_newsletter_permissions.brandcode = '258' THEN 'PFX'
        WHEN responsys_newsletter_permissions.brandcode = '259' THEN 'PPM'
        WHEN responsys_newsletter_permissions.brandcode = '260' THEN 'PPM'
        WHEN responsys_newsletter_permissions.brandcode = '261' THEN 'PRC'
        WHEN responsys_newsletter_permissions.brandcode = '262' THEN 'PRC'
        WHEN responsys_newsletter_permissions.brandcode = '263' THEN 'PRS'
        WHEN responsys_newsletter_permissions.brandcode = '264' THEN 'PRS'
        WHEN responsys_newsletter_permissions.brandcode = '265' THEN 'QQQ'
        WHEN responsys_newsletter_permissions.brandcode = '266' THEN 'QQQ'
        WHEN responsys_newsletter_permissions.brandcode = '267' THEN 'RAI'
        WHEN responsys_newsletter_permissions.brandcode = '268' THEN 'RAI'
        WHEN responsys_newsletter_permissions.brandcode = '269' THEN 'RDE'
        WHEN responsys_newsletter_permissions.brandcode = '270' THEN 'RDE'
        WHEN responsys_newsletter_permissions.brandcode = '271' THEN 'SAN'
        WHEN responsys_newsletter_permissions.brandcode = '272' THEN 'SAN'
        WHEN responsys_newsletter_permissions.brandcode = '273' THEN 'SRA'
        WHEN responsys_newsletter_permissions.brandcode = '274' THEN 'SRA'
        WHEN responsys_newsletter_permissions.brandcode = '275' THEN 'TDG'
        WHEN responsys_newsletter_permissions.brandcode = '276' THEN 'TDG'
        WHEN responsys_newsletter_permissions.brandcode = '277' THEN 'TDG'
        WHEN responsys_newsletter_permissions.brandcode = '278' THEN 'TDG'
        WHEN responsys_newsletter_permissions.brandcode = '279' THEN 'TDG'
        WHEN responsys_newsletter_permissions.brandcode = '280' THEN 'TDG'
        WHEN responsys_newsletter_permissions.brandcode = '281' THEN 'TRL'
        WHEN responsys_newsletter_permissions.brandcode = '282' THEN 'TRL'
        WHEN responsys_newsletter_permissions.brandcode = '283' THEN 'TRR'
        WHEN responsys_newsletter_permissions.brandcode = '284' THEN 'TRR'
        WHEN responsys_newsletter_permissions.brandcode = '285' THEN 'TST'
        WHEN responsys_newsletter_permissions.brandcode = '286' THEN 'TST'
        WHEN responsys_newsletter_permissions.brandcode = '287' THEN 'WIN'
        WHEN responsys_newsletter_permissions.brandcode = '288' THEN 'WIN'
        WHEN responsys_newsletter_permissions.brandcode = '289' THEN 'YHS'
        WHEN responsys_newsletter_permissions.brandcode = '290' THEN 'YHS'
        WHEN responsys_newsletter_permissions.brandcode = '291' THEN 'YRS'
        WHEN responsys_newsletter_permissions.brandcode = '292' THEN 'YRS'
        WHEN responsys_newsletter_permissions.brandcode = '293' THEN 'ZOO'
        WHEN responsys_newsletter_permissions.brandcode = '294' THEN 'ZOO'
        WHEN responsys_newsletter_permissions.brandcode = '295' THEN 'AI3'
        WHEN responsys_newsletter_permissions.brandcode = '296' THEN 'AI3'
        WHEN responsys_newsletter_permissions.brandcode = '297' THEN 'AIR'
        WHEN responsys_newsletter_permissions.brandcode = '298' THEN 'AIR'
        WHEN responsys_newsletter_permissions.brandcode = '299' THEN 'CFM'
        WHEN responsys_newsletter_permissions.brandcode = '300' THEN 'CFM'
        WHEN responsys_newsletter_permissions.brandcode = '301' THEN 'CL1'
        WHEN responsys_newsletter_permissions.brandcode = '302' THEN 'CL1'
        WHEN responsys_newsletter_permissions.brandcode = '303' THEN 'CL2'
        WHEN responsys_newsletter_permissions.brandcode = '304' THEN 'CL2'
        WHEN responsys_newsletter_permissions.brandcode = '305' THEN 'CL3'
        WHEN responsys_newsletter_permissions.brandcode = '306' THEN 'CL3'
        WHEN responsys_newsletter_permissions.brandcode = '307' THEN 'COO'
        WHEN responsys_newsletter_permissions.brandcode = '308' THEN 'COO'
        WHEN responsys_newsletter_permissions.brandcode = '309' THEN 'CTK'
        WHEN responsys_newsletter_permissions.brandcode = '310' THEN 'CTK'
        WHEN responsys_newsletter_permissions.brandcode = '311' THEN 'DOW'
        WHEN responsys_newsletter_permissions.brandcode = '312' THEN 'DOW'
        WHEN responsys_newsletter_permissions.brandcode = '313' THEN 'DTC'
        WHEN responsys_newsletter_permissions.brandcode = '314' THEN 'DTC'
        WHEN responsys_newsletter_permissions.brandcode = '315' THEN 'FO1'
        WHEN responsys_newsletter_permissions.brandcode = '316' THEN 'FO1'
        WHEN responsys_newsletter_permissions.brandcode = '317' THEN 'FO3'
        WHEN responsys_newsletter_permissions.brandcode = '318' THEN 'FO3'
        WHEN responsys_newsletter_permissions.brandcode = '319' THEN 'HAL'
        WHEN responsys_newsletter_permissions.brandcode = '320' THEN 'HAL'
        WHEN responsys_newsletter_permissions.brandcode = '321' THEN 'KE3'
        WHEN responsys_newsletter_permissions.brandcode = '322' THEN 'KE3'
        WHEN responsys_newsletter_permissions.brandcode = '323' THEN 'KER'
        WHEN responsys_newsletter_permissions.brandcode = '324' THEN 'KER'
        WHEN responsys_newsletter_permissions.brandcode = '325' THEN 'KEY'
        WHEN responsys_newsletter_permissions.brandcode = '326' THEN 'KEY'
        WHEN responsys_newsletter_permissions.brandcode = '327' THEN 'KIS'
        WHEN responsys_newsletter_permissions.brandcode = '328' THEN 'KIS'
        WHEN responsys_newsletter_permissions.brandcode = '329' THEN 'KRR'
        WHEN responsys_newsletter_permissions.brandcode = '330' THEN 'KRR'
        WHEN responsys_newsletter_permissions.brandcode = '331' THEN 'MAG'
        WHEN responsys_newsletter_permissions.brandcode = '332' THEN 'MAG'
        WHEN responsys_newsletter_permissions.brandcode = '333' THEN 'ME3'
        WHEN responsys_newsletter_permissions.brandcode = '334' THEN 'ME3'
        WHEN responsys_newsletter_permissions.brandcode = '335' THEN 'MET'
        WHEN responsys_newsletter_permissions.brandcode = '336' THEN 'MET'
        WHEN responsys_newsletter_permissions.brandcode = '337' THEN 'MF2'
        WHEN responsys_newsletter_permissions.brandcode = '338' THEN 'MF2'
        WHEN responsys_newsletter_permissions.brandcode = '339' THEN 'MF3'
        WHEN responsys_newsletter_permissions.brandcode = '340' THEN 'MF3'
        WHEN responsys_newsletter_permissions.brandcode = '341' THEN 'MFR'
        WHEN responsys_newsletter_permissions.brandcode = '342' THEN 'MFR'
        WHEN responsys_newsletter_permissions.brandcode = '343' THEN 'AI2'
        WHEN responsys_newsletter_permissions.brandcode = '344' THEN 'AI2'
        WHEN responsys_newsletter_permissions.brandcode = '345' THEN 'KE2'
        WHEN responsys_newsletter_permissions.brandcode = '346' THEN 'KE2'
        WHEN responsys_newsletter_permissions.brandcode = '347' THEN 'RC2'
        WHEN responsys_newsletter_permissions.brandcode = '348' THEN 'RC2'
        WHEN responsys_newsletter_permissions.brandcode = '349' THEN 'TF2'
        WHEN responsys_newsletter_permissions.brandcode = '350' THEN 'TF2'
        WHEN responsys_newsletter_permissions.brandcode = '351' THEN 'ME2'
        WHEN responsys_newsletter_permissions.brandcode = '352' THEN 'ME2'
        WHEN responsys_newsletter_permissions.brandcode = '353' THEN 'VI2'
        WHEN responsys_newsletter_permissions.brandcode = '354' THEN 'VI2'
        WHEN responsys_newsletter_permissions.brandcode = '355' THEN 'HA2'
        WHEN responsys_newsletter_permissions.brandcode = '356' THEN 'HA2'
        WHEN responsys_newsletter_permissions.brandcode = '357' THEN 'NO1'
        WHEN responsys_newsletter_permissions.brandcode = '358' THEN 'NO1'
        WHEN responsys_newsletter_permissions.brandcode = '359' THEN 'NO1'
        WHEN responsys_newsletter_permissions.brandcode = '360' THEN 'NO2'
        WHEN responsys_newsletter_permissions.brandcode = '361' THEN 'NO2'
        WHEN responsys_newsletter_permissions.brandcode = '362' THEN 'RBO'
        WHEN responsys_newsletter_permissions.brandcode = '363' THEN 'RBO'
        WHEN responsys_newsletter_permissions.brandcode = '364' THEN 'RC3'
        WHEN responsys_newsletter_permissions.brandcode = '365' THEN 'RC3'
        WHEN responsys_newsletter_permissions.brandcode = '366' THEN 'RCT'
        WHEN responsys_newsletter_permissions.brandcode = '367' THEN 'RCT'
        WHEN responsys_newsletter_permissions.brandcode = '368' THEN 'RO3'
        WHEN responsys_newsletter_permissions.brandcode = '369' THEN 'RO3'
        WHEN responsys_newsletter_permissions.brandcode = '370' THEN 'ROC'
        WHEN responsys_newsletter_permissions.brandcode = '371' THEN 'ROC'
        WHEN responsys_newsletter_permissions.brandcode = '372' THEN 'TA3'
        WHEN responsys_newsletter_permissions.brandcode = '373' THEN 'TA3'
        WHEN responsys_newsletter_permissions.brandcode = '374' THEN 'TA2'
        WHEN responsys_newsletter_permissions.brandcode = '375' THEN 'TA2'
        WHEN responsys_newsletter_permissions.brandcode = '376' THEN 'TAF'
        WHEN responsys_newsletter_permissions.brandcode = '377' THEN 'TAF'
        WHEN responsys_newsletter_permissions.brandcode = '378' THEN 'TF3'
        WHEN responsys_newsletter_permissions.brandcode = '379' THEN 'TF3'
        WHEN responsys_newsletter_permissions.brandcode = '380' THEN 'TFM'
        WHEN responsys_newsletter_permissions.brandcode = '381' THEN 'TFM'
        WHEN responsys_newsletter_permissions.brandcode = '382' THEN 'VI3'
        WHEN responsys_newsletter_permissions.brandcode = '383' THEN 'VI3'
        WHEN responsys_newsletter_permissions.brandcode = '384' THEN 'VIK'
        WHEN responsys_newsletter_permissions.brandcode = '385' THEN 'VIK'
        WHEN responsys_newsletter_permissions.brandcode = '386' THEN 'WES'
        WHEN responsys_newsletter_permissions.brandcode = '387' THEN 'WES'
        WHEN responsys_newsletter_permissions.brandcode = '388' THEN 'WSF'
        WHEN responsys_newsletter_permissions.brandcode = '389' THEN 'WSF'
        WHEN responsys_newsletter_permissions.brandcode = '390' THEN 'ALO'
        WHEN responsys_newsletter_permissions.brandcode = '391' THEN 'WST'
        WHEN responsys_newsletter_permissions.brandcode = '392' THEN 'ALO'
        WHEN responsys_newsletter_permissions.brandcode = '393' THEN 'WST'
        WHEN responsys_newsletter_permissions.brandcode = '394' THEN 'ALO'
        WHEN responsys_newsletter_permissions.brandcode = '395' THEN 'WVE'
        WHEN responsys_newsletter_permissions.brandcode = '396' THEN 'WVE'
        WHEN responsys_newsletter_permissions.brandcode = '397' THEN 'HIT'
        WHEN responsys_newsletter_permissions.brandcode = '398' THEN 'HIT'
        WHEN responsys_newsletter_permissions.brandcode = '399' THEN 'RO2'
        WHEN responsys_newsletter_permissions.brandcode = '400' THEN 'RO2'
        WHEN responsys_newsletter_permissions.brandcode = '401' THEN 'CPL'
        WHEN responsys_newsletter_permissions.brandcode = '402' THEN 'CPL'
        WHEN responsys_newsletter_permissions.brandcode = '403' THEN 'CPL'
        WHEN responsys_newsletter_permissions.brandcode = '404' THEN 'FO2'
        WHEN responsys_newsletter_permissions.brandcode = '405' THEN 'FO2'
        WHEN responsys_newsletter_permissions.brandcode = '406' THEN 'FO2'
        WHEN responsys_newsletter_permissions.brandcode = '407' THEN 'HA3'
        WHEN responsys_newsletter_permissions.brandcode = '408' THEN 'HA3'
        WHEN responsys_newsletter_permissions.brandcode = '409' THEN 'HA3'
        WHEN responsys_newsletter_permissions.brandcode = '410' THEN 'CLO'
        WHEN responsys_newsletter_permissions.brandcode = '411' THEN 'CLO'
        WHEN responsys_newsletter_permissions.brandcode = '412' THEN 'PAN'
        WHEN responsys_newsletter_permissions.brandcode = '413' THEN 'PAN'
        WHEN responsys_newsletter_permissions.brandcode = '414' THEN 'PAN'
        WHEN responsys_newsletter_permissions.brandcode = '415' THEN 'SRA'
        WHEN responsys_newsletter_permissions.brandcode = '416' THEN 'TRL'
        WHEN responsys_newsletter_permissions.brandcode = '417' THEN 'AI3'
        WHEN responsys_newsletter_permissions.brandcode = '418' THEN 'PAN'
        WHEN responsys_newsletter_permissions.brandcode = '419' THEN 'GAN'
        WHEN responsys_newsletter_permissions.brandcode = '420' THEN 'PPM'
        WHEN responsys_newsletter_permissions.brandcode = '421' THEN 'ABR'
        WHEN responsys_newsletter_permissions.brandcode = '422' THEN 'PLR'
        WHEN responsys_newsletter_permissions.brandcode = '176' THEN 'BUT'
        WHEN responsys_newsletter_permissions.brandcode = '2' THEN 'CLO'
        WHEN responsys_newsletter_permissions.brandcode = '3' THEN 'CLO'
        WHEN responsys_newsletter_permissions.brandcode = '4' THEN 'CLO'
        WHEN responsys_newsletter_permissions.brandcode = '5' THEN 'CLO'
        WHEN responsys_newsletter_permissions.brandcode = '6' THEN 'CLO'
        WHEN responsys_newsletter_permissions.brandcode = '7' THEN 'CLO'
        WHEN responsys_newsletter_permissions.brandcode = '8' THEN 'CLO'
        WHEN responsys_newsletter_permissions.brandcode = '9' THEN 'CLO'
        WHEN responsys_newsletter_permissions.brandcode = '10' THEN 'CLO'
        WHEN responsys_newsletter_permissions.brandcode = '11' THEN 'CLO'
        WHEN responsys_newsletter_permissions.brandcode = '12' THEN 'CLO'
        WHEN responsys_newsletter_permissions.brandcode = '13' THEN 'CLO'
        WHEN responsys_newsletter_permissions.brandcode = '14' THEN 'CLO'
        WHEN responsys_newsletter_permissions.brandcode = '15' THEN 'CLO'
        WHEN responsys_newsletter_permissions.brandcode = '16' THEN 'GRA'
        WHEN responsys_newsletter_permissions.brandcode = '17' THEN 'GRA'
        WHEN responsys_newsletter_permissions.brandcode = '18' THEN 'GRA'
        WHEN responsys_newsletter_permissions.brandcode = '19' THEN 'GRA'
        WHEN responsys_newsletter_permissions.brandcode = '20' THEN 'GRA'
        WHEN responsys_newsletter_permissions.brandcode = '21' THEN 'GRA'
        WHEN responsys_newsletter_permissions.brandcode = '22' THEN 'GRA'
        WHEN responsys_newsletter_permissions.brandcode = '23' THEN 'GRA'
        WHEN responsys_newsletter_permissions.brandcode = '24' THEN 'GRA'
        WHEN responsys_newsletter_permissions.brandcode = '25' THEN 'GRA'
        WHEN responsys_newsletter_permissions.brandcode = '26' THEN 'GRA'
        WHEN responsys_newsletter_permissions.brandcode = '27' THEN 'GRA'
        WHEN responsys_newsletter_permissions.brandcode = '28' THEN 'GRA'
        WHEN responsys_newsletter_permissions.brandcode = '29' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '30' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '31' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '32' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '33' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '34' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '35' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '36' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '37' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '38' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '39' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '40' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '41' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '42' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '43' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '44' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '45' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '46' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '47' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '48' THEN 'HEA'
        WHEN responsys_newsletter_permissions.brandcode = '49' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '50' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '51' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '52' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '53' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '54' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '55' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '56' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '57' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '58' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '59' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '60' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '61' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '62' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '63' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '64' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '65' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '66' THEN 'DBF'
        WHEN responsys_newsletter_permissions.brandcode = '67' THEN 'EMP'
        WHEN responsys_newsletter_permissions.brandcode = '68' THEN 'EMP'
        WHEN responsys_newsletter_permissions.brandcode = '69' THEN 'EMP'
        WHEN responsys_newsletter_permissions.brandcode = '70' THEN 'EMP'
        WHEN responsys_newsletter_permissions.brandcode = '71' THEN 'EMP'
        WHEN responsys_newsletter_permissions.brandcode = '72' THEN 'EMP'
        WHEN responsys_newsletter_permissions.brandcode = '73' THEN 'EMP'
        WHEN responsys_newsletter_permissions.brandcode = '74' THEN 'EMP'
        WHEN responsys_newsletter_permissions.brandcode = '75' THEN 'EMP'
        WHEN responsys_newsletter_permissions.brandcode = '76' THEN 'BIK'
        WHEN responsys_newsletter_permissions.brandcode = '77' THEN 'CAR'
        WHEN responsys_newsletter_permissions.brandcode = '78' THEN 'CLB'
        WHEN responsys_newsletter_permissions.brandcode = '79' THEN 'CCS'
        WHEN responsys_newsletter_permissions.brandcode = '80' THEN 'CIN'
        WHEN responsys_newsletter_permissions.brandcode = '81' THEN 'CLC'
        WHEN responsys_newsletter_permissions.brandcode = '82' THEN 'FHM'
        WHEN responsys_newsletter_permissions.brandcode = '83' THEN 'GNW'
        WHEN responsys_newsletter_permissions.brandcode = '84' THEN 'GOF'
        WHEN responsys_newsletter_permissions.brandcode = '85' THEN 'GTB'
        WHEN responsys_newsletter_permissions.brandcode = '86' THEN 'HDE'
        WHEN responsys_newsletter_permissions.brandcode = '87' THEN 'LFT'
        WHEN responsys_newsletter_permissions.brandcode = '88' THEN 'LRO'
        WHEN responsys_newsletter_permissions.brandcode = '89' THEN 'MAB'
        WHEN responsys_newsletter_permissions.brandcode = '90' THEN 'MCN'
        WHEN responsys_newsletter_permissions.brandcode = '91' THEN 'MOJ'
        WHEN responsys_newsletter_permissions.brandcode = '92' THEN 'PAN'
        WHEN responsys_newsletter_permissions.brandcode = '93' THEN 'PBK'
        WHEN responsys_newsletter_permissions.brandcode = '94' THEN 'PCP'
        WHEN responsys_newsletter_permissions.brandcode = '95' THEN 'PCP'
        WHEN responsys_newsletter_permissions.brandcode = '96' THEN 'PFI'
        WHEN responsys_newsletter_permissions.brandcode = '97' THEN 'PRC'
        WHEN responsys_newsletter_permissions.brandcode = '98' THEN 'QQQ'
        WHEN responsys_newsletter_permissions.brandcode = '99' THEN 'RDE'
        WHEN responsys_newsletter_permissions.brandcode = '100' THEN 'TDG'
        WHEN responsys_newsletter_permissions.brandcode = '101' THEN 'LSC'
        WHEN responsys_newsletter_permissions.brandcode = '102' THEN 'PRS'
        WHEN responsys_newsletter_permissions.brandcode = '103' THEN '2F1'
        WHEN responsys_newsletter_permissions.brandcode = '104' THEN 'TDG'
        WHEN responsys_newsletter_permissions.brandcode = '105' THEN 'TRR'
        ELSE responsys_newsletter_permissions.brandcode
      END
       AS "responsys_newsletter_permissions.brandcode",
        CASE
        WHEN responsys_brand_permissions.optin = '6' THEN '0'
        ELSE responsys_brand_permissions.optin
      END
       AS "responsys_brand_permissions.optin",
        CASE
        WHEN responsys_newsletter_permissions.optin = '6' THEN '0'
        ELSE responsys_newsletter_permissions.optin
      END
       AS "responsys_newsletter_permissions.optin",
        DATE(TO_DATE(responsys_brand_permissions.optin_date,'YYYY-MM-DD')) AS "responsys_brand_permissions.Boptin_date_date",
        DATE(TO_DATE(responsys_brand_permissions.unsub_date,'YYYY-MM-DD')) AS "responsys_brand_permissions.Bunsub_date_date",
        DATE(TO_DATE(responsys_brand_permissions.modified_date,'YYYY-MM-DD')) AS "responsys_brand_permissions.Bmodified_date_date",
        DATE(TO_DATE(responsys_brand_permissions.created_date,'YYYY-MM-DD')) AS "responsys_brand_permissions.Bcreated_date_date",
        DATE(TO_DATE(responsys_newsletter_permissions.created_date,'YYYY-MM-DD')) AS "responsys_newsletter_permissions.Ncreated_date_date",
        DATE(TO_DATE(responsys_newsletter_permissions.optin_date,'YYYY-MM-DD')) AS "responsys_newsletter_permissions.Noptin_date_date",
        DATE(TO_DATE(responsys_newsletter_permissions.unsub_date,'YYYY-MM-DD')) AS "responsys_newsletter_permissions.Nunsub_date_date",
        DATE(TO_DATE(responsys_newsletter_permissions.modified_date,'YYYY-MM-DD')) AS "responsys_newsletter_permissions.Nmodified_date_date"
      FROM responsys.responsys_engaged_list_temp AS responsys_engaged_list
      LEFT JOIN responsys.responsys_newsletter_permissions_temp AS responsys_newsletter_permissions ON responsys_engaged_list.email_address = responsys_newsletter_permissions.email_address
      LEFT JOIN responsys.responsys_brand_permissions_temp AS responsys_brand_permissions ON responsys_engaged_list.email_address = responsys_brand_permissions.email_address
     
    sql_trigger_value: SELECT FLOOR(EXTRACT(epoch from GETDATE()) / (1*60*60))
    distkey: responsys_engaged_list.email_address
    sortkeys: [responsys_engaged_list.email_address]  
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
  fields:
  
  - dimension: age_banding
    type: string
    sql: |
     CASE
       WHEN ${TABLE}.responsys_engaged_list.age_banding = ' ' THEN 'Unknown'
       WHEN ${TABLE}.responsys_engaged_list.age_banding IS NULL THEN 'Unknown'
       ELSE ${TABLE}.responsys_engaged_list.age_banding
     END
    
  - dimension: country
    type: string
    sql: ${TABLE}.responsys_engaged_list.country

  - dimension: email_address
    type: string
    sql: ${TABLE}.responsys_engaged_list.email_address

  - dimension: gender
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.responsys_engaged_list.gender = 'M' THEN 'Male'
        WHEN ${TABLE}.responsys_engaged_list.gender = 'm' THEN 'Male'
        WHEN ${TABLE}.responsys_engaged_list.gender = 'F' THEN 'Female'
        WHEN ${TABLE}.responsys_engaged_list.gender = 'f' THEN 'Female'
        WHEN ${TABLE}.responsys_engaged_list.gender = 'P' THEN 'Unknown'
        WHEN ${TABLE}.responsys_engaged_list.gender = 'p' THEN 'Unknown'
        WHEN ${TABLE}.responsys_engaged_list.gender = 'U' THEN 'Unknown'
        WHEN ${TABLE}.responsys_engaged_list.gender = 'u' THEN 'Unknown'
        WHEN ${TABLE}.responsys_engaged_list.gender = ' ' THEN 'Unknown'
        ELSE 'Unknown'
      END
        
        

  - dimension: postal_code
    type: string
    sql: |
         CASE
           WHEN UPPER(${TABLE}.responsys_engaged_list.postal_code) LIKE '[A-Z][A-Z][0-9][0-9][A-Z][A-Z]' THEN LEFT(UPPER(${TABLE}.responsys_engaged_list.postal_code),3)+' '+RIGHT(UPPER(${TABLE}.responsys_engaged_list.postal_code),3)
           WHEN UPPER(${TABLE}.responsys_engaged_list.postal_code) LIKE '[A-Z][0-9][0-9][A-Z][A-Z]' THEN LEFT(UPPER(${TABLE}.responsys_engaged_list.postal_code),2)+' '+RIGHT(UPPER(${TABLE}.responsys_engaged_list.postal_code),3)
           WHEN UPPER(${TABLE}.responsys_engaged_list.postal_code) LIKE '[A-Z][0-9][0-9][0-9][A-Z][A-Z]' THEN LEFT(UPPER(${TABLE}.responsys_engaged_list.postal_code),3)+' '+RIGHT(UPPER(${TABLE}.responsys_engaged_list.postal_code),3)
           WHEN UPPER(${TABLE}.responsys_engaged_list.postal_code) LIKE '[A-Z][0-9][A-Z][0-9][A-Z][A-Z]' THEN LEFT(UPPER(${TABLE}.responsys_engaged_list.postal_code),3)+' '+RIGHT(UPPER(${TABLE}.responsys_engaged_list.postal_code),3)
           WHEN UPPER(${TABLE}.responsys_engaged_list.postal_code) LIKE '[A-Z][A-Z][0-9][0-9][0-9][A-Z][A-Z]' THEN LEFT(UPPER(${TABLE}.responsys_engaged_list.postal_code),4)+' '+RIGHT(UPPER(${TABLE}.responsys_engaged_list.postal_code),3)
           WHEN UPPER(${TABLE}.responsys_engaged_list.postal_code) LIKE '[A-Z][A-Z][0-9][A-Z][0-9][A-Z][A-Z]' THEN LEFT(UPPER(${TABLE}.responsys_engaged_list.postal_code),4)+' '+RIGHT(UPPER(${TABLE}.responsys_engaged_list.postal_code),3)
           WHEN UPPER(${TABLE}.responsys_engaged_list.postal_code) LIKE 'UK%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.responsys_engaged_list.postal_code) LIKE 'UNITED KIN%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.responsys_engaged_list.postal_code) LIKE 'OTHER%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.responsys_engaged_list.postal_code) LIKE 'IRELAND%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.responsys_engaged_list.postal_code) LIKE 'FULL%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.responsys_engaged_list.postal_code) LIKE 'N/A%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.responsys_engaged_list.postal_code) LIKE '0%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.responsys_engaged_list.postal_code) LIKE 'GB%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.responsys_engaged_list.postal_code) LIKE 'ERIRE%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.responsys_engaged_list.postal_code) LIKE 'NONE%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.responsys_engaged_list.postal_code) LIKE 'ZZZ%' THEN 'Unknown'
           ELSE UPPER(${TABLE}.responsys_engaged_list.postal_code)
         END

  - dimension: postal_area1
    label: 'Postal Area'
    type: string
    sql: |
       CASE 
                        WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'AB' THEN 'AB'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'AL' THEN 'AL'
            WHEN TRANSLATE(substring(${TABLE}.responsys_engaged_list.postal_code,1,2), '1234567890', '') = 'B' THEN 'B'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'BA' THEN 'BA'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'BB' THEN 'BB'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'BD' THEN 'BD'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'BH' THEN 'BH'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'BL' THEN 'BL'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'BN' THEN 'BN'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'BR' THEN 'BR'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'BS' THEN 'BS'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'BT' THEN 'BT'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'CA' THEN 'CA'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'CB' THEN 'CB'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'CF' THEN 'CF'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'CH' THEN 'CH'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'CM' THEN 'CM'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'CO' THEN 'CO'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'CR' THEN 'CR'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'CT' THEN 'CT'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'CV' THEN 'CV'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'CW' THEN 'CW'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'DA' THEN 'DA'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'DD' THEN 'DD'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'DE' THEN 'DE'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'DG' THEN 'DG'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'DH' THEN 'DH'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'DL' THEN 'DL'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'DN' THEN 'DN'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'DT' THEN 'DT'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'DY' THEN 'DY'
            WHEN TRANSLATE(substring(${TABLE}.responsys_engaged_list.postal_code,1,2), '1234567890', '') = 'E' THEN 'E'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'EC' THEN 'EC'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'EH' THEN 'EH'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'EN' THEN 'EN'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'EX' THEN 'EX'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'FK' THEN 'FK'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'FY' THEN 'FY'
            WHEN TRANSLATE(substring(${TABLE}.responsys_engaged_list.postal_code,1,2), '1234567890', '') = 'G' THEN 'G'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'GL' THEN 'GL'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'GU' THEN 'GU'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'HA' THEN 'HA'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'HD' THEN 'HD'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'HG' THEN 'HG'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'HP' THEN 'HP'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'HR' THEN 'HR'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'HS' THEN 'HS'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'HU' THEN 'HU'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'HX' THEN 'HX'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'IG' THEN 'IG'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'IP' THEN 'IP'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'IV' THEN 'IV'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'KA' THEN 'KA'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'KT' THEN 'KT'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'KW' THEN 'KW'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'KY' THEN 'KY'
            WHEN TRANSLATE(substring(${TABLE}.responsys_engaged_list.postal_code,1,2), '1234567890', '') = 'L' THEN 'L'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'LA' THEN 'LA'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'LD' THEN 'LD'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'LE' THEN 'LE'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'LL' THEN 'LL'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'LN' THEN 'LN'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'LS' THEN 'LS'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'LU' THEN 'LU'
            WHEN TRANSLATE(substring(${TABLE}.responsys_engaged_list.postal_code,1,2), '1234567890', '') = 'M' THEN 'M'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'ME' THEN 'ME'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'MK' THEN 'MK'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'ML' THEN 'ML'
            WHEN TRANSLATE(substring(${TABLE}.responsys_engaged_list.postal_code,1,2), '1234567890', '') = 'N' THEN 'N'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'NE' THEN 'NE'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'NG' THEN 'NG'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'NN' THEN 'NN'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'NP' THEN 'NP'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'NR' THEN 'NR'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'NW' THEN 'NW'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'OL' THEN 'OL'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'OX' THEN 'OX'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'PA' THEN 'PA'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'PE' THEN 'PE'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'PH' THEN 'PH'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'PL' THEN 'PL'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'PO' THEN 'PO'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'PR' THEN 'PR'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'RG' THEN 'RG'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'RH' THEN 'RH'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'RM' THEN 'RM'
            WHEN TRANSLATE(substring(${TABLE}.responsys_engaged_list.postal_code,1,2), '1234567890', '') = 'S' THEN 'S'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'SA' THEN 'SA'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'SE' THEN 'SE'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'SG' THEN 'SG'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'SK' THEN 'SK'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'SL' THEN 'SL'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'SM' THEN 'SM'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'SN' THEN 'SN'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'SO' THEN 'SO'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'SP' THEN 'SP'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'SR' THEN 'SR'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'SS' THEN 'SS'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'ST' THEN 'ST'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'SW' THEN 'SW'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'SY' THEN 'SY'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'TA' THEN 'TA'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'TD' THEN 'TD'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'TF' THEN 'TF'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'TN' THEN 'TN'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'TQ' THEN 'TQ'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'TR' THEN 'TR'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'TS' THEN 'TS'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'TW' THEN 'TW'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'UB' THEN 'UB'
            WHEN TRANSLATE(substring(${TABLE}.responsys_engaged_list.postal_code,1,2), '1234567890', '') = 'W' THEN 'W'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'WA' THEN 'WA'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'WC' THEN 'WC'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'WD' THEN 'WD'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'WF' THEN 'WF'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'WN' THEN 'WN'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'WR' THEN 'WR'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'WS' THEN 'WS'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'WV' THEN 'WV'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'YO' THEN 'YO'
            WHEN substring(${TABLE}.responsys_engaged_list.postal_code,1,2) = 'ZE' THEN 'ZE'
       END

  - dimension: riid
    type: string
    sql: ${TABLE}.responsys_engaged_list.riid

  - measure: unique_users
    type: count_distinct
    sql: ${TABLE}.responsys_engaged_list.email_address












  - dimension: commercial_brandcode
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.responsys_brand_permissions.brandcode LIKE '%campaign_brand%' THEN NULL
        WHEN ${TABLE}.responsys_brand_permissions.brandcode LIKE '%BRANDCODE%' THEN NULL
        ELSE ${TABLE}.responsys_brand_permissions.brandcode
      END
      
  - dimension: commercial_created_date
    label: 'Created'
    type: time
    timeframes: [day_of_week, date, week, month]    
    convert_tz: false
    sql: TO_DATE(${TABLE}.responsys_brand_permissions.created_date,'YYYY-MM-DD')

  - dimension: commercial_modified_date
    label: 'Updated'
    type: time
    timeframes: [day_of_week, date, week, month]    
    convert_tz: false
    sql: TO_DATE(${TABLE}.responsys_brand_permissions.modified_date,'YYYY-MM-DD')

  - dimension: commercial_optin
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.responsys_brand_permissions.optin = '6' THEN '0'
        ELSE ${TABLE}.responsys_brand_permissions.optin
      END

  - dimension: commercial_optin_date
    label: 'Optin'
    type: time
    timeframes: [day_of_week, date, week, month]    
    convert_tz: false
    sql: TO_DATE(${TABLE}.responsys_brand_permissions.optin_date,'YYYY-MM-DD')

  - dimension: commercial_unsub_date
    label: 'Unsub'
    type: time
    timeframes: [day_of_week, date, week, month]    
    convert_tz: false
    sql: TO_DATE(${TABLE}.responsys_brand_permissions.unsub_date,'YYYY-MM-DD')

  - measure: brand_optins
    label: 'Commercial/Marketing Optins'
    type: count_distinct
    sql: ${TABLE}.responsys_engaged_list.email_address
    filters:
      commercial_optin: '1'









  - dimension: newsletter_brandcode
    type: string
    sql: ${TABLE}.responsys_newsletter_permissions.brandcode

  - dimension: newsletter_created_date
    label: 'Created'
    type: time
    timeframes: [day_of_week, date, week, month]    
    convert_tz: false
    sql: TO_DATE(${TABLE}.responsys_newsletter_permissions.created_date,'YYYY-MM-DD')

  - dimension: newsletter_modified_date
    label: 'Updated'
    type: time
    timeframes: [day_of_week, date, week, month]    
    convert_tz: false
    sql: TO_DATE(${TABLE}.responsys_newsletter_permissions.modified_date,'YYYY-MM-DD')

  - dimension: newsletter_optin
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.responsys_newsletter_permissions.optin = '6' THEN '0'
        ELSE ${TABLE}.responsys_newsletter_permissions.optin
      END

  - dimension: newsletter_optin_date
    label: 'Optin'
    type: time
    timeframes: [day_of_week, date, week, month]    
    convert_tz: false
    sql: TO_DATE(${TABLE}.responsys_newsletter_permissions.optin_date,'YYYY-MM-DD')

  - dimension: newsletter_unsub_date
    label: 'Unsub'
    type: time
    timeframes: [day_of_week, date, week, month]    
    convert_tz: false
    sql: TO_DATE(${TABLE}.responsys_newsletter_permissions.unsub_date,'YYYY-MM-DD')
    
  - measure: newsletter_newsletter_optins
    type: count_distinct
    sql: ${TABLE}.responsys_engaged_list.email_address
    filters:
      newsletter_optin: '1'
      
      
      