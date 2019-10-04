view: max_date_sql_dt {
  derived_table: {
    sql: SELECT
  users.state  AS `state`,
  DATE(MAX((DATE(users.created_at ))) ) AS `max_date`
FROM demo_db.orders  AS orders
LEFT JOIN demo_db.users  AS users ON orders.user_id = users.id

GROUP BY 1
ORDER BY DATE(MAX((DATE(users.created_at ))) ) DESC
LIMIT 500 ;;

  indexes: ["state"]
  persist_for: "24 hours"
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: max_date {
    type: date
    sql: ${TABLE}.max_date ;;
  }

}
