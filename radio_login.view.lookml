- view: radio_login
  sql_table_name: publications.radio_login
  fields:

  - dimension: accountbauernewsletter
    label: 'Newsletter Optin'
    type: string
    sql: ${TABLE}."x.accountbauernewsletter."

  - dimension: accountbauerudid
    label: 'Bauer ID'
    type: string
    sql: ${TABLE}."x.accountbauerudid."

  - dimension: accountbirthdate
    label: 'Birth'
    type: string
    sql: ${TABLE}."x.accountbirthdate."

  - dimension: accountconfirmdate
    label: 'Reg Confirm'
    type: time
    sql: ${TABLE}."x.accountconfirmdate."::timestamp

  - dimension: accountemail
    label: 'Email Address'
    type: string
    sql: ${TABLE}."x.accountemail."

  - dimension: accountfullname
    label: 'Full Name'
    type: string
    sql: ${TABLE}."x.accountfullname."

  - dimension: accountgender
    label: 'Gender'
    type: string
    sql: ${TABLE}."x.accountgender."

  - dimension: accountid
    label: 'Reg ID'
    type: string
    sql: ${TABLE}."x.accountid."

  - dimension: accountorigin
    label: 'Brand Source'
    type: string
    sql: ${TABLE}."x.accountorigin."

  - dimension: accountpassword
    label: 'Password Hash'
    type: string
    sql: ${TABLE}."x.accountpassword."

  - dimension: accountpasswordreset
    label: 'Password Reset Hash'
    type: string
    sql: ${TABLE}."x.accountpasswordreset."

  - dimension: accountregisterdate
    label: 'Register Date'
    type: string
    sql: ${TABLE}."x.accountregisterdate."::timestamp

  - dimension: accountsecurityid
    label: 'Security ID'
    type: string
    sql: ${TABLE}."x.accountsecurityid."

  - dimension: accounttestuser
    label: 'Is Test User'
    type: string
    sql: ${TABLE}."x.accounttestuser."

  - dimension: accountthirdpartynewsletter
    label: 'Third Party Newsletter'
    type: string
    sql: ${TABLE}."x.accountthirdpartynewsletter."
    
  - measure: Unique_Users
    type: count_distinct
    sql: ${TABLE}."x.accountemail."
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

