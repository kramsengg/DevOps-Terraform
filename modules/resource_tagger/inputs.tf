variable "dimension" {
  description = "Cosmos dimension"
}

variable "owner_slack_channel" {
  description = "Owner team slack channel. If possible, use service slack channel minus the '#'. If no service channel, use the team channel"
}

variable "application" {
  description = "Application the resource will be used for"
}

variable "lifespan" {
  description = "Allowed values: ['permanent', 'temporary']"
  default     = "permanent"
}

variable "environment" {
  description = "default to dimension if not set"
  default     = ""
}

variable "team" {
  description = "default to owner slack channel if not set"
  default     = ""
}

variable "silenceable" {
  type        = bool
  default     = false
  description = "Indicate if the intended datadog monitor can be automatically silenced via downtime script"
}
