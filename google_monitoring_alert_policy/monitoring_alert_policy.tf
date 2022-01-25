resource "google_monitoring_alert_policy" "alert_policy" {
  display_name = "My Alert Policy"
  combiner     = "OR"
  dynamic "conditions" {
    for_each = length(keys(var.conditions)) == 0 ? [] : [var.conditions]

    content {
      name                                = conditions.value.name
      condition_monitoring_query_language = lookup(conditions.value, "condition_monitoring_query_language", null)
      condition_threshold                 = lookup(conditions.value, "condition_threshold", null)
      display_name                        = conditions.value.display_name
      condition_matched_log               = conditions.value.condition_matched_log 

      

      # conditions_absent could be capped to 1 block
      dynamic "condition_absent" {
         
        for_each = lookup(conditions.value, "condition_absent", [])

        content {
          duration         = condition_absent.value.duration
          filter = lookup(condition_absent.value, "filter", null)

            dynamic "aggregations" {

                for_each = lookup(condition_absent.value, "aggregations", [])
                content {
                    per_series_aligner   = lookup(aggregations.value, "per_series_aligner", null)
                    group_by_fields      = lookup(aggregations.value, "group_by_fields", null)
                    alignment_period     = lookup(aggregations.value, "alignment_period", null)
                    cross_series_reducer = lookup(aggregations.value, "cross_series_reducer", null)
                }
            }

            dynamic "trigger" {

                for_each = lookup(condition_absent.value, "trigger", [])
                content {
                    percent   = lookup(trigger.value, "percent", null)
                    count      = lookup(trigger.value, "count", null)
                }
            }
  
        }
      }

      
    }
  }



  
}