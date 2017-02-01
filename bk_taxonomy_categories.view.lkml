#- explore: bk_taxonomy_categories
view: bk_taxonomy_categories {
  sql_table_name: publications.bk_taxonomy_categories ;;

  dimension: bk_size {
    hidden: yes
    label: "BlueKai Audience Size"
    type: number
    sql: ${TABLE}.bk_size ;;
  }

  dimension_group: ddw_updated {
    label: "Updated"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.ddw_updated_date ;;
  }

  dimension: description {
    label: "Description"
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: fullpath {
    label: "Full Segment Path"
    type: string
    sql: ${TABLE}.fullpath ;;
  }

  dimension: leaf_node {
    label: "Leaf Node"
    type: yesno
    sql: ${TABLE}.leaf_node ;;
  }

  dimension: node_id {
    label: "Node ID"
    type: number
    sql: ${TABLE}.node_id ;;
  }

  dimension: node_name {
    label: "Node Name"
    type: string
    sql: ${TABLE}.node_name ;;
  }

  dimension: parent_node_id {
    label: "Parent Node ID"
    type: number
    sql: ${TABLE}.parent_node_id ;;
  }

  dimension: vertical {
    label: "Vertical Category"
    type: string
    sql: ${TABLE}.vertical ;;
  }

  measure: count {
    label: "Count"
    type: count
    drill_fields: [node_name]
  }

  measure: bk_size_number {
    label: "BlueKai Audience Size"
    type: number
    sql: sum(${bk_size}) ;;
  }

  measure: bk_size_count {
    hidden: yes
    label: "BlueKai Size Count"
    type: number
    sql: AVG(${bk_size}) ;;
  }
}
