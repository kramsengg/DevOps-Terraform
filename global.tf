data "aws_caller_identity" "current" {
}

locals {
  account_number = data.aws_caller_identity.current.account_id
}

# module "global" {
#   providers = {
#     aws = aws.ap-south-1
#   }

#   source         = "./global"
#   account        = var.account
#   account_number = local.account_number
#   dimension      = var.dimension
# }