view: comma_dt {
  derived_table: {
    sql: (SELECT "testthing" AS stringcol) UNION ALL (SELECT "otherthing") UNION ALL (SELECT "thing, you see") UNION ALL (SELECT "final thing") ;;
  }

  dimension: stringcol {
    type: string
  }

  filter: testfilter {
    suggest_dimension: stringcol

  }
}
