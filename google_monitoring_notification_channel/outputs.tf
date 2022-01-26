output id {
  description = "The identifier for the resource with format {{name}}."
  value       = concat(google_monitoring_notification_channel.main.*.id, [""])[0]
}

output name {
  description = "The client-assigned metric identifier."
  value       = concat(google_monitoring_notification_channel.main.*.name, [""])[0]
}

output verification_status {
  description = "Indicates whether this channel has been verified or not. On a ListNotificationChannels or GetNotificationChannel operation, this field is expected to be populated."
  value       = concat(google_monitoring_notification_channel.main.*.verification_status, [""])[0]
}

