datagroup: the_look_default_datagroup {
  sql_trigger: SELECT EXTRACT(DAY FROM CURRENT_DATE);;
  max_cache_age: "1 hour"
}

datagroup: test_ref_db {
  sql_trigger: SELECT COUNT(*) FROM demo_db.orders ;;
}
