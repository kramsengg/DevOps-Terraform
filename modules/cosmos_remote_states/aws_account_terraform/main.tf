data "terraform_remote_state" "at" {
  backend = "s3"

  config = {
    bucket = "cosmos-tfstates-${var.account}"
    key    = "aws-account-terraform/${var.account}-global.tfstate"
    region = "ap-south-1"
  }
}

data "terraform_remote_state" "at-region-specific" {
  count = length(var.cosmos_regions)

  backend = "s3"
  config = {
    bucket = "cosmos-tfstates-${var.account}"
    key    = "aws-account-terraform/${var.account}-${element(var.cosmos_regions, count.index)}.tfstate"
    region = "ap-south-1"
  }
}
