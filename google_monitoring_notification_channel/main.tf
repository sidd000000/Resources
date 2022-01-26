resource "google_monitoring_notification_channel" "main" {
  type         = var.type
  user_labels  = var.user_labels
  description  = var.description
  display_name = var.display_name
  enabled      = var.enabled
  project      = var.project

  dynamic "labels" {
    for_each = lookup(each.value, "labels", [])
    content {
      email_address = labels.value.email_address
    }
  }

  dynamic "sensitive_labels" {
    for_each = lookup(each.value, "sensitive_labels", [])
    content {
        auth_token    = lookup(sensitive_labels.value, "auth_token", null)
        password    = lookup(sensitive_labels.value, "password", null)
        service_key    = lookup(sensitive_labels.value, "service_key", null)
    }
  }


}
  