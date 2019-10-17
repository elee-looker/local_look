view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: id_currency_string {
    type: string
    sql: CONCAT({% parameter currency_param %}, CAST(${TABLE}.id AS CHAR)) ;;
  }

  dimension: another_param_test {
    sql: CASE WHEN {% parameter another_param %} = "Eugene" THEN "EUGENE"
         WHEN {% parameter another_param %} = "Patricia" THEN "PAT"
         ELSE "" END;;
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
      day_of_month,
      yesno
    ]
    group_label: "testing"
    sql: ${TABLE}.created_at ;;

  }

  dimension_group: created_duration {
    type: duration
    sql_start: ${created_date} ;;
    sql_end: DATE_ADD(${created_date}, INTERVAL 1 DAY) ;;
    intervals: [day]
  }

  measure: add_durations {
    type: sum
    sql: ${days_created_duration} ;;
  }
#   dimension: date_string {
#     type: string
#     sql: CAST(${created_date} AS CHAR) ;;
#     html:  {% if _value == "now" | date: "%Y-%m-%d" %}<p "background-color: lightblue">{{ rendered_value }}</p> ;;
#   }

  parameter: thingo {
    type: number
    allowed_value: {
      label: "January"
      value: "1"
    }
    allowed_value: {
      label: "February"
      value: "2"
    }
  }

  dimension: other_thingo {
    type: yesno
    sql: CASE WHEN MONTH(${created_date}) = {{ thingo._parameter_value }} THEN TRUE
    WHEN MONTH(DATE_ADD(${created_date}, INTERVAL 1 MONTH)) = {{ thingo._parameter_value }} THEN TRUE
    ELSE FALSE
    END;;
  }

  parameter: date_param_test {
    type: date
    suggest_dimension: created_month
  }

  filter: test_date_filter {
    type: date
    sql: ${created_date} >  ;;
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

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
#     html: {% if orders.status._value == "pending" %} <p style="color: gray; background-color: lightblue">{{ rendered_value }}</p>
#           {% elsif orders.status._value == "complete" %} <p style="color: black; background-color: green">{{ rendered_value }}</p> {% endif %} ;;
#     html: <a href="https://www.google.com/search?q={{ value | replace: "ed", "^," }}">{{ value | replace: "ed", "^,"}}</a> ;;
  }

  dimension: statusnumber {
    type: number
    sql: CASE WHEN ${status}="pending" THEN 1 ELSE 0 END ;;
  }

  dimension: statuswithnull {
    type: number
    sql: CASE WHEN ${status}="pending" THEN NULL ELSE 0 END ;;
    html: {% if orders.statusnumber._value == 0 %}
    <p style="background-color: green">{{ rendered_value }}</p>
    {% else %}
    <p style="background-color: red">{{ rendered_value }}</p>
    {% endif %};;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
#     html: {% if value > 1000 %}<p style="color: black; background-color: green">{{ rendered_value }}</p>
#           {% else %}<p style="color: black; background-color: red">{{ rendered_value }}</p>{% endif %} ;;
    html: <a href="/looks/7?&f[orders.status]=complete">{{ value }}</a> ;;
#     html: {% if orders.status._in_query %}
#             {% if orders.status._value == "pending" %} <p style="color: gray; background-color: lightblue">{{ rendered_value }}</p>
#             {% elsif orders.status._value == "complete" %} <p style="color: black; background-color: green">{{ rendered_value }}</p>  {% endif %}
#           {% else %} {{ rendered_value }} {% endif %} ;;
#     drill_fields: [detail*]
  }

  measure: value_format_count {
    type: count
    html: {{ value | round: -2 }} ;;
  }

  measure: max_time {
    type: max
    sql: ${created_time} ;;
  }

  measure: count_pct {
    type: number
    sql: ${count}/1109.0 ;;
    value_format: "0.0%"
  }

  parameter: currency_param {
    type: string
    allowed_value: {
      label: "Dollars"
      value: "$"
    }
    allowed_value: {
      label: "Euros"
      value: "EUR"
    }
  }


  parameter: another_param {
    type: string
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

  filter: date_filter {
    type: date
  }

  filter: practice_name_filter {
    label: "Practice Name Filter"
    sql:
        {% condition %} ${status} {% endcondition %} ;;
  }

  set: orders_test_set {
    fields: [count, user_id]
  }
}
