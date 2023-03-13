resource "aws_s3_bucket" "remote_state_bucket_prod" {
  bucket = "remote-backend-state-devops"

  tags = {
    name        = "backend-state"
    environment = "prod"
  }
}

resource "aws_s3_bucket_acl" "remote_state_bucket_prod_acl" {
  bucket = aws_s3_bucket.remote_state_bucket_prod.id
  acl    = "private"
}

















# resource "aws_s3_bucket" "log_bucket" {
#   bucket = "bt-${var.dimension}-emr-logs-${var.region}"
#   # tags   = var.required_resource_tags.aws_tags

#   #   versioning {
#   #     enabled = false
#   #   }

#   #   lifecycle {
#   #     prevent_destroy = false
#   #   }

#   #   lifecycle_rule {
#   #     id                                     = "clean_old_logs"
#   #     enabled                                = true
#   #     abort_incomplete_multipart_upload_days = 7

#   #     expiration {
#   #       days = 30
#   #     }
#   #   }

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm     = "aws:kms"
#         kms_master_key_id = aws_kms_key.emrfs_kms_key.id
#       }
#     }
#   }
# }

# resource "aws_s3_bucket_versioning" "log_bucket_versioning" {
#   bucket = aws_s3_bucket.log_bucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# resource "aws_s3_bucket_lifecycle_configuration" "log_bucket_lifecycle_config" {
#   bucket = aws_s3_bucket.log_bucket.id

#   rule {
#     id = "clean_old_logs"

#     status = "Enabled"

#     abort_incomplete_multipart_upload {
#       days_after_initiation = 7
#     }

#     expiration {
#       days = 30
#     }


#   }
#   # prevent_destroy = false

# }