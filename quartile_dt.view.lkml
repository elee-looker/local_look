view: quartile_dt {
  derived_table: {
    explore_source: inventory_items {
      column: cost {}
      column: id {}
      derived_column: max_cost {
        sql: MAX(${cost}) ;;
      }
    }
  }

  dimension: cost {
    type: number
  }

  dimension: id {
    type: number
    primary_key: yes
  }

#   dimension: max_cost {
#     type: number
#   }

#   dimension: quartiles {
#     type: string
#     case: {
#       when: {
#         sql: ${cost} < (0.25*${max_cost}) ;;
#         label: "1"
#       }
#       else: "5"
#     }
#   }
}
