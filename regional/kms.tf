# resource "aws_kms_key" "emrfs_kms_key" {
#   description             = "Master key for EMRFS encryption"
#   deletion_window_in_days = 30
#   policy                  = local.remote_emrfs_kms_key_usage_enabled ? data.aws_iam_policy_document.emr_kms_with_remote_replication_policy.json : data.aws_iam_policy_document.emr_kms_key_policy.json
#   #tags                    = merge(var.required_resource_tags.aws_tags, { Role = "datalake" })

#   lifecycle {
#     prevent_destroy = false
#   }
# }