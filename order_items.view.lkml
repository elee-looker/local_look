view: order_items {
  sql_table_name: demo_db.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
#     value_format: "0.000"
    sql: ${TABLE}.sale_price ;;
  }

  dimension: 100orno {
    type: number
    sql: CASE WHEN ${TABLE}.sale_price > 100 THEN 100
              WHEN ${TABLE}.sale_price > 50 THEN -100
              ELSE 0 END;;
  }

  dimension: pivot_yesno_testingjslsdfkbj {
    type: yesno
    sql: ${sale_price} > 50 ;;
  }

  measure: sale_price_average {
    type: average
    value_format: "0.###"
    sql: ${sale_price} ;;
  }

  measure: 100orno_avg {
    type: average
    sql: ${100orno} ;;
    value_format: "0.000"
  }

  measure: weird_measure {
    type: string
    sql: SUBSTR(CAST(SEC_TO_TIME(${sale_price_average}) AS CHAR), 4, 5) ;;
  }
}
