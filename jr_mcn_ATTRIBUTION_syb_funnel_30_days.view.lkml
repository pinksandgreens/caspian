view: jr_mcn_syb_funnel_30_days {
  label: "MCN SYB Customer Journey"

  derived_table: {
    sql:
    SELECT
        Master_ClientID,
        Domain,
        From_Date,
        To_Date,
        Hostname,
        Medium,
        ChannelGrouping,
        Referral_Source,
        Session_Id,
        Visit_Number,
        PageURL,
        Site_Category,
        SessionStartDateTime,
        Hit_Sequence_Number,
        Hit_Type,
        Actual_Date,
        Hit_Time,
        Referral_Path,
        Campaign,
        Device,
        Browser,
        CityID,
        GA_Date,
        LandingPage,
        LandingPageFlag
      FROM
        ${jr_mcn_syb_tx_source_attribution_MCNClassifieds_part1.SQL_TABLE_NAME}
      WHERE LandingPageFlag = 1



    ;;

    }

    filter: date_filter {
      label: "Last Month"
      hidden: yes
      type: date
    }

    filter: date_filter2 {
      label: "Last 2 Months"
      hidden: yes
      type: date
    }

  dimension: Master_ClientID {
    label: "1.1 Master Client Id"
    sql: ${TABLE}.Master_ClientID ;;
#         description: "BFS Domain: Client Id"
  }

  dimension: DomainId {
    label: "1.2 Domain"
    sql: ${TABLE}.Domain ;;
#         description: "BFS Domain: Client Id"
  }

  dimension: From_Date {
    label: "1.3 From Date"
    sql: ${TABLE}.From_Date ;;
    description: "The First Visit to SYB Booking Page within last 4 weeks less 30 days"
  }

  dimension: To_Date {
    label: "1.4 To Date"
    sql: ${TABLE}.To_Date ;;
    description: "The Last Visit to SYB Booking Page within last 4 weeks"
  }

  dimension: Hostname {
    label: "1.5 Referral Hostname"
    sql: ${TABLE}.Hostname ;;
  }

  dimension: medium {
    label: "1.6 Source Traffic Medium"
    description: "The medium of the traffic source"
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: ChannelGrouping {
    label: "1.7 ChannelGrouping"
    description: "GA Assigned ChannelGrouping"
    sql: ${TABLE}.ChannelGrouping ;;
  }

  dimension: Referral_Source {
    label: "1.8 Referral Source"
    sql: ${TABLE}.Referral_Source ;;
  }

  dimension: Session_Id {
    label: "1.9 Session Id"
    type: number
    sql: ${TABLE}.Session_Id ;;
  }

  dimension: Visit_Number {
    label: "2.0 Visit Number"
    type: number
    sql: ${TABLE}.Visit_Number ;;
  }

  dimension: pagePath {
    label: "2.1 page URL"
    sql: ${TABLE}.pageURL ;;
  }

  dimension: Site_Category {
    label: "2.2 Site Category"
    sql: ${TABLE}.Site_Category ;;
  }

  dimension: SessionStartDateTime {
    label: "2.3 Session Start Date/Time"
    sql: ${TABLE}.SessionStartDateTime ;;
  }

  dimension: Sequenced_Hit_Number {
    label: "2.4 Hit Sequence Number"
    description: "Chronological sequenced number of hit in session"
    type: number
    sql: ${TABLE}.Hit_Sequence_Number ;;
  }

  dimension: Hit_Type {
    label: "2.5 Hit Type"
    sql: ${TABLE}.Hit_Type ;;
  }

  dimension: Actual_Date {
    label: "2.6 Date"
    sql: ${TABLE}.actual_date ;;
  }

  dimension: Hit_Time {
    label: "2.7 Hit Time"
    sql: ${TABLE}.Hit_Time ;;
  }

  dimension: trafficSource_referralPath {
    label: "2.8 Referral Path"
    type: string
    description: "If trafficSource.medium is 'referral', then this is set to the path of the referrer. (The host name of the referrer is in trafficSource.source.)"
    sql: ${TABLE}.Referral_Path ;;
  }

  dimension: trafficSource_campaign {
    label: "2.9 utm_campaign value"
    description: "The campaign value. Usually set by the utm_campaign URL parameter."
    type: string
    sql: ${TABLE}.Campaign ;;
  }

  dimension: devicetype {
    label: "3.0 Device"
    description: "The type of device (Mobile, Tablet, Desktop)."
    type: string
    sql: ${TABLE}.Device ;;
  }

  dimension: devicebrowser {
    label: "3.1 Device Browser"
#     description: "The type of device (Mobile, Tablet, Desktop)."
    type: string
    sql: ${TABLE}.Browser ;;
  }

  dimension: geoNetwork_cityId {
    label: "3.2 City Id"
#     description: "The type of device (Mobile, Tablet, Desktop)."
    type: string
    sql: ${TABLE}.CityID ;;
  }

  dimension:  LandingPage {
    label: "3.3 Landing Page"
    sql: ${TABLE}.LandingPage ;;

  }

  dimension: LandingPageFlag {
    label: "3.4 Landing Page Flag"
    type: number
    sql: ${TABLE}.LandingPageFlag ;;
    #         description: "BFS Domain: SYB Transaction Referral Source"
  }

  measure: count {
    label: "Referral Source Count"
    type: count


  }

#
#
# The below will be relevant for SYB Booking Page --> Tx and Tx only Analysis
# dimension: SYB_Booking_Page_1 {
#     label: "SYB Booking Page 1"
#     type: number
#     sql: ${TABLE}.SYB_Booking_Page_1 ;;
#     #         description: "BFS Domain: SYB Transaction Referral Source"
#   }

#
#
#   dimension:  Rank {
#     label: "3.7 Rank"
#     type: number
#     sql: ${TABLE}.Rank ;;

#   }
# ,
#         ${jr_mcn_syb_tx_source_attribution_MCN_part1.SQL_TABLE_NAME}

  }
