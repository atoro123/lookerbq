# view: merchant_mapping_key{
#   derived_table: {
#     sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
#     sql:
#       }
