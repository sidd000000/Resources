resource "google_monitoring_alert_policy" "alert_policy" {
  display_name =  var.display_name
  combiner     =  var.combiner
  enabled      =  var.enabled
  user_labels  =  var.user_labels
  project      =  var.project
  notification_channels = var.notification_channels

  dynamic "conditions" {
    for_each = length(keys(var.conditions)) == 0 ? [] : [var.conditions]

    content {
      name                                = conditions.value.name
      ##condition_monitoring_query_language = lookup(conditions.value, "condition_monitoring_query_language", null)
      display_name                        = conditions.value.display_name
     
      
      dynamic "condition_absent" {
         
        for_each = lookup(conditions.value, "condition_absent", [])

        content {
          duration  = condition_absent.value.duration
          filter    = lookup(condition_absent.value, "filter", null)

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
                    count     = lookup(trigger.value, "count", null)
                }
            }
        }
    }   

       dynamic "condition_monitoring_query_language" {
         
        for_each = lookup(conditions.value, "condition_monitoring_query_language", [])
            content {
                duration             = condition_monitoring_query_language.value.duration
                query           = condition_monitoring_query_language.value.query
                
                dynamic "trigger" {
                        for_each = lookup(condition_monitoring_query_language.value, "trigger", [])
                        content {
                             percent       = lookup(trigger.value, "percent", null)
                             count         = lookup(trigger.value, "count", null)             
                        }
                    }
            }
       }

           
       dynamic "condition_threshold" {
         for_each = lookup(conditions.value, "condition_threshold", [])
                content {
                    threshold_value      = lookup(condition_threshold.value, "threshold_value", null)
                    denominator_filter   = lookup(condition_threshold.value, "denominator_filter", null)
                    duration             = condition_threshold.value.duration
                    comparison           = condition_threshold.value.comparison
                    filter               = lookup(condition_threshold.value, "filter", null)

                    dynamic "denominator_aggregations" {
                        for_each = lookup(condition_threshold.value, "denominator_aggregations", [])
                        content {
                             per_series_aligner      = lookup(denominator_aggregations.value, "per_series_aligner", null)
                             group_by_fields         = lookup(denominator_aggregations.value, "group_by_fields", null)
                             alignment_period        = lookup(denominator_aggregations.value, "alignment_period", null)
                             cross_series_reducer    = lookup(denominator_aggregations.value, "cross_series_reducer", null)

                        }
                    }

                    dynamic "trigger" {
                        for_each = lookup(condition_threshold.value, "trigger", [])
                        content {
                             percent       = lookup(trigger.value, "percent", null)
                             count         = lookup(trigger.value, "count", null)             
                        }
                    }

                    dynamic "aggregations" {
                        for_each = lookup(condition_threshold.value, "aggregations", [])
                        content {
                             per_series_aligner      = lookup(aggregations.value, "per_series_aligner", null)
                             group_by_fields         = lookup(aggregations.value, "group_by_fields", null)
                             alignment_period        = lookup(aggregations.value, "alignment_period", null)
                             cross_series_reducer    = lookup(aggregations.value, "cross_series_reducer", null)   

                        }
                    }

                }

            }

                dynamic "condition_matched_log" {
                    for_each = lookup(conditions.value, "condition_matched_log", [])
                        content {
                             filter                   = lookup(condition_matched_log.value, "filter", null)
                             label_extractors         = lookup(condition_matched_log.value, "label_extractors", null)
                             

                        }
                    }
         }
    }

    dynamic "alert_strategy" {
    for_each = length(keys(var.alert_strategy)) == 0 ? [] : [var.alert_strategy]

    content {
      notification_rate_limit = lookup(alert_strategy.value, "notification_rate_limit", null)
      auto_close              = lookup(alert_strategy.value, "auto_close", null)
      
      dynamic "notification_rate_limit" {
           for_each = lookup(alert_strategy.value, "notification_rate_limit", [])
             content {
                period       = lookup(notification_rate_limit.value, "period", null)         
              }
          }
    }
}

    dynamic "documentation" {
    for_each = length(keys(var.documentation)) == 0 ? [] : [var.documentation]

    content {
      content   = lookup(documentation.value, "content", null)
      mime_type = lookup(documentation.value, "mime_type", null)
    }
}
      

}
