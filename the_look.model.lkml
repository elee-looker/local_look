connection: "the_look"

# include all the views
include: "*.view"
include: "//local_postgre/*.view"
include: "*.datagroup.lkml"
# include: "events.explore.lkml"

explore: hello_world {
  fields: [orders*]
  join: orders {
    type: left_outer
    sql_on: ${hello_world.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: max_date_DT {
    type: left_outer
    sql_on: ${users.state} = ${max_date_DT.state} ;;
    relationship: many_to_one
  }
}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

#   join: products {
#     type: left_outer
#     sql_on: ${inventory_items.product_id} = ${products.id} ;;
#     relationship: many_to_one
#   }
#
#   join: users {
#     type: left_outer
#     sql_on: ${orders.user_id} = ${users.id} ;;
#     relationship: many_to_one
#   }
}

explore: test {
  view_name: order_items
  extends: [order_items, inventory_items]
}

explore: orders {
#   sql_always_where: ${max_date_sql_dt.max_date}=${users.created_date} ;;
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

#   join: max_date_sql_dt {
#     type: left_outer
#     sql_on: ${users.state} = ${max_date_sql_dt.state} ;;
#     relationship:  many_to_one
#   }

#   join: max_date_DT {
#     type: left_outer
#     sql_on: ${users.state} = ${max_date_DT.state} ;;
#     relationship: many_to_one
#   }
}

explore: mygodman {
  view_name: products
  always_filter: {
    filters: {
      field: id_bool
      value: ""
    }
  }
}

explore: schema_migrations {}

explore: user_data {
  join: users {
    type: left_outer
    sql_on: ${user_data.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  join: max_date_DT {
    type: left_outer
    sql_on: ${users.state} = ${max_date_DT.state} ;;
    relationship: many_to_one
  }
}

explore: users {
#   sql_always_where: ${max_date_DT.max_date}=${users.created_date} ;;
#   join: max_date_DT {
#     type: left_outer
#     sql_on: ${users.state} = ${max_date_DT.state} ;;
#     relationship: many_to_one
#   }
}

explore: users_nn {}

explore: pdt_stuff {}

explore: comma_dt {}

explore: quartile_dt {}

explore: fromviewtest {
  from: events
  view_name: events
  fields: [ALL_FIELDS*, -events.value]
}

explore: random_pdt {}

explore: products_pdt {

}
