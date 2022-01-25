output id {
  description = "The identifier for the resource with format {{name}}."
  value       = concat(google_monitoring_alert_policy.alert_policy.*.id, [""])[0]
}

output name {
  description = "The client-assigned metric identifier."
  value       = concat(google_monitoring_alert_policy.alert_policy.*.name, [""])[0]
}

