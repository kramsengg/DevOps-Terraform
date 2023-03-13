variable "account" {
    type = string
    default = "610430157502"
}

variable "dimension" {
}

variable "cosmos_regions" {
  type    = list(any)
  default = ["ap-south-1"]
}
