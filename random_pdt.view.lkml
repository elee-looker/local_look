# If necessary, uncomment the line below to include explore_source.
# include: "the_look.model.lkml"

view: random_pdt {
  derived_table: {
    explore_source: orders {
      column: created_date {}
      column: id {}
      column: count {}
    }
    datagroup_trigger: the_look_default_datagroup
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
