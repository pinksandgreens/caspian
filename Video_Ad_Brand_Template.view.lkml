view: video_ad_brand_template {
  derived_table: {
      sql:  SELECT
              Ad_Sub_Unit_Name,
              Parent_Brand,
              Brand
            FROM
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'Aire' AS Brand) UNION
              (SELECT 'SSPT_Angling-Times' AS Ad_Sub_Unit_Name, 'Angling Times' AS Parent_Brand, 'Angling Times' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'Borders' AS Brand) UNION
              (SELECT 'SMOD_Car' AS Ad_Sub_Unit_Name, 'Car Magazine' AS Parent_Brand, 'Car Magazine' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'CFM Radio' AS Brand) UNION
              (SELECT 'SAUT_Classic-Cars-for-Sale' AS Ad_Sub_Unit_Name, 'CCFS' AS Parent_Brand, 'CCFS' AS Brand) UNION
              (SELECT 'LWLN_Closer' AS Ad_Sub_Unit_Name, 'Closer' AS Parent_Brand, 'Closer' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'Clyde 1' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'Downtown' AS Brand) UNION
              (SELECT 'LMENS_Empire' AS Ad_Sub_Unit_Name, 'Empire Magazine' AS Parent_Brand, 'Empire Magazine' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'Forth 1' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'Free' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'Gem 106' AS Brand) UNION
              (SELECT 'LWLN_Grazia' AS Ad_Sub_Unit_Name, 'Grazia' AS Parent_Brand, 'Grazia' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'Hallam FM' AS Brand) UNION
              (SELECT 'LWLN_Heatworld' AS Ad_Sub_Unit_Name, 'Heat' AS Parent_Brand, 'Heat' AS Brand) UNION
              (SELECT 'RNAT_heat' AS Ad_Sub_Unit_Name, 'Heat Radio' AS Parent_Brand, 'Heat Radio' AS Brand) UNION
              (SELECT 'SPET_Horse-Deals' AS Ad_Sub_Unit_Name, 'Horse Deals' AS Parent_Brand, 'Horse Deals' AS Brand) UNION
              (SELECT 'RNAT_kerrang' AS Ad_Sub_Unit_Name, 'Kerrang! Radio' AS Parent_Brand, 'Kerrang! Radio' AS Brand) UNION
              (SELECT 'LMENS_Kerrang' AS Ad_Sub_Unit_Name, 'Kerrang' AS Parent_Brand, 'Kerrang' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'Key 103' AS Brand) UNION
              (SELECT 'RNAT_kiss' AS Ad_Sub_Unit_Name, 'KISS FM' AS Parent_Brand, 'KISS FM' AS Brand) UNION
              (SELECT 'SAUT_LRO' AS Ad_Sub_Unit_Name, 'LRO' AS Parent_Brand, 'LRO' AS Brand) UNION
              (SELECT 'RNAT_magic' AS Ad_Sub_Unit_Name, 'Magic Radio' AS Parent_Brand, 'Magic Radio' AS Brand) UNION
              (SELECT 'SMOT_MCN' AS Ad_Sub_Unit_Name, 'MCN' AS Parent_Brand, 'MCN' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'Metro Radio' AS Brand) UNION
              (SELECT 'LMENS_Mojo' AS Ad_Sub_Unit_Name, 'Mojo' AS Parent_Brand, 'Mojo' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'Moray Firth Radio' AS Brand) UNION
              (SELECT 'SWSP_Mother-and-Baby' AS Ad_Sub_Unit_Name, 'Mother&Baby' AS Parent_Brand, 'Mother&Baby' AS Brand) UNION
              (SELECT 'SMOD_Mustard' AS Ad_Sub_Unit_Name, 'Mustard' AS Parent_Brand, 'Mustard' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'Northsound 1' AS Brand) UNION
              (SELECT 'SMOD_Parkers' AS Ad_Sub_Unit_Name, 'Parkers' AS Parent_Brand, 'Parkers' AS Brand) UNION
              (SELECT 'RNAT_planet-rock' AS Ad_Sub_Unit_Name, 'Planet Rock' AS Parent_Brand, 'Planet Rock' AS Brand) UNION
              (SELECT 'SLEI_Practical-Photography' AS Ad_Sub_Unit_Name, 'Practical Photography Magazine' AS Parent_Brand, 'Practical Photography Magazine' AS Brand) UNION
              (SELECT 'LMENS_Q' AS Ad_Sub_Unit_Name, 'Q4music' AS Parent_Brand, 'Q4music' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'Radio City 96.7' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'Tay' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'TFM Radio' AS Brand) UNION
              (SELECT 'LWLN_The-Debrief' AS Ad_Sub_Unit_Name, 'The Debrief' AS Parent_Brand, 'The Debrief' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'The Hits Official' AS Brand) UNION
              (SELECT 'SSPT_Todays-Golfer' AS Ad_Sub_Unit_Name, 'Today''s Golfer' AS Parent_Brand, 'Today''s Golfer' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'Viking FM' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'Wave 105' AS Brand) UNION
              (SELECT 'RBCN_video' AS Ad_Sub_Unit_Name, 'BCN' AS Parent_Brand, 'Westsound' AS Brand) UNION
              (SELECT 'SPET_Your-Horse' AS Ad_Sub_Unit_Name, 'Your Horse Online' AS Parent_Brand, 'Your Horse Online' AS Brand) UNION
              (SELECT 'SWSP_Yours' AS Ad_Sub_Unit_Name, 'Yours' AS Parent_Brand, 'Yours' AS Brand) ;;

              }

  dimension: Ad_Sub_Unit_Name {
    type: string
    primary_key: yes
    sql: ${TABLE}.Ad_Sub_Unit_Name;;
  }

  dimension: Parent_Brand {
    type: string
    sql: ${TABLE}.Parent_Brand;;
  }

  dimension: Brand {
    type: string
    sql: ${TABLE}.Brand;;
  }




              }
