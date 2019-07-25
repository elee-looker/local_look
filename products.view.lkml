view: products {
  sql_table_name: demo_db.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: mandy_test {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: dept_with_null {
    type: string
    sql: CASE WHEN ${department} = "Men" THEN NULL
         ELSE ${department}
         END;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: retail_price_with_nulls_and_zeros {
    type: number
    sql: CASE WHEN ${TABLE}.retail_price > 0 THEN NULL END  ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
#
#   measure: null_sum1 {
#     type: sum
#     sql: CASE WHEN IS_NULL(${retail_price_with_nulls_and_zeros}) THEN  ;;
#   }
#
#   measure: null_sum2 {
#     type: number
#     value_format: "$#,##0.00"
#     sql: SUM(${retail_price_with_nulls_and_zeros}) ;;
#   }

  measure: sum_measure {
    type: sum
    value_format: "$#,##0.00"
    sql: ${retail_price}*0.01 ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }

  measure: count2 {
    label: "Drill Count"
    type: count
    drill_fields: [id, item_name, inventory_items.count]
    link: {
      label: "Show as scatter plot"
      url: "
      {% assign vis_config = '{\"type\": \"looker_bar\"}' %}
      {{ link }}&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000"
    }
  }
}
