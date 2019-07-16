view: yet_another_pdt {
  derived_table: {
    explore_source: orders {
      column: created_date {}
      column: id {}
      column: count {}
    }
    datagroup_trigger: the_look_default_datagroup
    indexes: ["id"]
  }
  dimension: created_date {
    type: date
  }
  dimension: id {
    type: number
  }
  dimension: count {
    type: number
  }

}
