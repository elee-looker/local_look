view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      hour,
      date,
      week,
      month,
      quarter,
      year,
      day_of_week,
      yesno
    ]
    sql: ${TABLE}.created_at ;;
  }


  dimension: shifted_week {
    type: date
    sql: CASE
        WHEN ${created_day_of_week} = "Wednesday" THEN ${created_date}
        WHEN ${created_day_of_week} = "Thursday" THEN date_add(${created_date}, INTERVAL -1 DAY)
        WHEN ${created_day_of_week} = "Friday" THEN date_add(${created_date}, INTERVAL -2 DAY)
        WHEN ${created_day_of_week} = "Saturday" THEN date_add(${created_date}, INTERVAL -3 DAY)
        WHEN ${created_day_of_week} = "Sunday" THEN date_add(${created_date}, INTERVAL -4 DAY)
        WHEN ${created_day_of_week} = "Monday" THEN date_add(${created_date}, INTERVAL -5 DAY)
        WHEN ${created_day_of_week} = "Tuesday" THEN date_add(${created_date}, INTERVAL -6 DAY)
      END;;
  }

  dimension: status1 {
    type: string
    sql: ${TABLE}.status ;;
    html: <a href="https://www.google.com/search?q={{ value | replace: "ed", "^," }}">{{ value | replace: "ed", "^,"}}</a> ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    html: <a href="https://localhost:9999/dashboards/1">{{ value }}</a> ;;
#     drill_fields: [detail*]
  }

  measure: count_pct {
    type: number
    sql: ${count}/1109.0 ;;
    value_format: "0.0%"
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.first_name,
      users.last_name,
      users.id,
      hello_world.count,
      order_items.count
    ]
  }

  filter: last_x_days {
    type: number
  }

  set: orders_test_set {
    fields: [count, user_id]
  }
}
