// https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_alert_policy
/*
  Meta variables
*/

variable "create_resource" {
  description = "Specify wheter or not to create the resource."
  type        = bool
  default     = true
}

variable "project" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
  default     = null
}

variable "name" {
  description = "The identifier of this resource."
  type        = string
}

/*
  Resource variables
*/

variable "display_name" {
  description = "A short name or phrase used to identify the policy in dashboards, notifications, and incidents."
  type        = string
}

variable "combiner" {
  description = "How to combine the results of multiple conditions to determine if an incident should be opened. Possible values are AND, OR, and AND_WITH_MATCHING_RESOURCE"
  type        = string
  default     = null
}

variable "conditions" {
  description = "A list of conditions for the policy. The conditions are combined by AND or OR according to the combiner field. If the combined conditions evaluate to true, then an incident is created. A policy can have from one to six conditions."
  type        = any
  default     = {}
}

variable "label_extractors" {
  description = "A map from a label key string to an extractor expression which is used to extract data from a log entry field and assign as the label value. Each label key specified in the LabelDescriptor must have an associated extractor expression in this map. The syntax of the extractor expression is the same as for the valueExtractor field."
  type        = map(string)
  default     = {}
}



variable "bucket_options" {
  description = "Map containing bucketOptions. The bucketOptions are required when the logs-based metric is using a DISTRIBUTION value type and it describes the bucket boundaries used to create a histogram of the extracted values."
  type        = any
  default     = {}
}
