terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "rams-devops-terraform-state"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-south-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "rams-devops-terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  alias  = "ap-south-1"
  region = "ap-south-1"
}