# If necessary, uncomment the line below to include explore_source.
# include: "the_look.model.lkml"

view: pdt_stuff {
  derived_table: {
    sql: SELECT
  orders.status  AS `status`,
  COUNT(*) AS `count`
FROM demo_db.orders  AS orders

GROUP BY 1
ORDER BY COUNT(*) DESC;;
  }
  dimension: status {}
  dimension: count {
    type: number
  }
}
