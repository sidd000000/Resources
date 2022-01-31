
variable "project" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
  default     = null
}

variable "type" {
  description = "he type of the notification channel. This field matches the value of the NotificationChannelDescriptor"
  type        = string
}

variable "labels" {
  description = "Configuration fields that define the channel and its behavior. The permissible and required labels are specified in the NotificationChannelDescriptor corresponding to the type field"
  type        = any
  default     = {}
}

variable "sensitive_labels" {
  description = "Different notification type behaviors are configured primarily using the the labels field on this resource"
  type        = any
  default     = {}
}

variable "user_labels" {
  description = "User-supplied key/value data that does not need to conform to the corresponding NotificationChannelDescriptor's schema, unlike the labels field. This field is intended to be used for organizing and identifying the NotificationChannel objects.The field can contain up to 64 entries."
  type        = any
  default     = {}
}

variable "description" {
  description = "An optional human-readable description of this notification channel."
  type        = string
}

variable "display_name" {
  description = "An optional human-readable name for this notification channel."
  type        = string
}

variable "enabled" {
  description = "Whether notifications are forwarded to the described channel."
  type        = bool
  default     = true
}

variable "email_address" {
  description = "to be used in labels"
  type        = string
}



