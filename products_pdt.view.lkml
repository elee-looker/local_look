view: products_pdt {
  derived_table: {
    sql: SELECT brand, category, department, id
      FROM demo_db.products
       ;;
    sql_trigger_value: SELECT HOUR(CURTIME()) ;;
    publish_as_db_view: yes
    indexes: ["id"]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  set: detail {
    fields: [brand, category, department, id]
  }
}
