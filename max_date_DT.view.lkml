# If necessary, uncomment the line below to include explore_source.
# include: "the_look.model.lkml"

view: max_date_DT {
  derived_table: {
    explore_source: orders {
      column: state { field: users.state }
      column: max_date { field: users.max_date}
    }
  }
#   dimension: country {}
  dimension: state {}
  dimension: max_date {
    type: date
  }
}
