variable "account_number" {
  type    = string
  default = "610430157502"
}
variable "account" {
  type    = string
  default = "production"
}
variable "dimension" {
  type    = string
  default = "production"
}
variable "glue_dimension" {
  type    = string
  default = "production"
}
variable "region" {
  type    = string
  default = "ap-south-1"
}
variable "skip_emrfs_autoscaling" {
  description = "Don't enable autoscaling on the EMR filesystem. This should be set to true for new regions until the clusters are up, then set back to false"
  type        = bool
  default     = false
}

# variable "global_module" {}

variable "dynamodb_warning_threshold" {
  default = 90
}

variable "notify_warning" {
  description = "Map of dimension to DataDog notification @ mention."

  default = {
    datastag = "@slack-data-eng-robots"
    dataprod = "@slack-data-eng-robots"
  }
}

variable "notify_alert" {
  description = "Map of dimension to DataDog notification @ mention."

  default = {
    datastag = "@slack-data-eng-robots"
    dataprod = "@slack-data-eng-robots"
  }
}

# variable "required_resource_tags" {}

variable "additional_permitted_athena_iam_users" {
  type        = list(string)
  default     = []
  description = "List of additional roles that can assume the athena auth role. Should include all regions that are running the auth API outside of the current region"
}

# variable "cosmos_regions" {
#   type = list(any)
# }

# variable "paypal_sftp_bucket_arn" {}

variable "paypal_risk_get_policy_arn" {
  description = "Role policy ARN for allowing access to paypal risk deliver bucket"
  default     = ""
}
