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

variable "enabled" {
  description = "Whether or not the policy is enabled. The default is true"
  type        = bool
  default     = true
}

variable "notification_channels" {
  description = "How to combine the results of multiple conditions to determine if an incident should be opened. Possible values are AND, OR, and AND_WITH_MATCHING_RESOURCE"
  type        = any
  default     = null
}

variable "alert_strategy" {
  description = "Control over how this alert policy's notification channels are notified."
  type        = any
  default     = {}
}

variable "user_labels" {
  description = "This field is intended to be used for organizing and identifying the AlertPolicy objects"
  type        = any
  default     = {}
}

variable "documentation" {
  description = "Documentation that is included with notifications and incidents related to this policy."
  type        = any
  default     = {}
}

