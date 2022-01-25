resource "google_logging_metric" "main" {
  count            = var.create_resource ? 1 : 0
  name             = var.name
  project          = var.project
  filter           = var.filter
  description      = var.description
  value_extractor  = var.value_extractor
  label_extractors = var.label_extractors

  // Dynamic blocks configurations

  # Metric Descriptor capped to 1 block
  dynamic "metric_descriptor" {
    for_each = length(keys(var.metric_descriptor)) == 0 ? [] : [var.metric_descriptor]

    content {
      unit         = lookup(metric_descriptor.value, "unit", null)
      value_type   = metric_descriptor.value.value_type
      metric_kind  = metric_descriptor.value.metric_kind
      display_name = lookup(metric_descriptor.value, "display_name", null)

      # Labels allowing several blocks
      dynamic "labels" {
        for_each = lookup(metric_descriptor.value, "labels", [])

        content {
          key         = labels.value.key
          description = lookup(labels.value, "description", null)
          value_type  = lookup(labels.value, "value_type", null)
        }
      }
    }
  }