view: templated_filter_dt {
  derived_table: {
    sql: SELECT id AS "id"
    FROM demo_db.users;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }
}
