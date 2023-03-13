data "terraform_remote_state" "dt" {
  backend = "s3"

  config = {
    bucket = "cosmos-tfstates-${var.account}"
    key    = "dimension-terraform/${var.dimension}-${var.region}/terraform.tfstate"
    region = "ap-south-1"
  }
}

locals {
  availability_zones = split(",", data.terraform_remote_state.dt.outputs.availability_zones_dsv)
  public_subnet_ids  = split(",", data.terraform_remote_state.dt.outputs.public_subnet_ids_dsv)
  private_subnet_ids = split(",", data.terraform_remote_state.dt.outputs.private_subnet_ids_dsv)
}
