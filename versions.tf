terraform {
  required_version = ">= 1.3.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.32.0"
    }
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 2.26.1"
    }
  }
}
