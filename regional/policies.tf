data "aws_iam_policy_document" "emr_kms_key_policy" {
  statement {
    effect = "Allow"

    actions = ["kms:*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${var.account_number}:root",
      ]
    }

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "kms:Decrypt",
    ]

    principals {
      type        = "AWS"
      identifiers = [local.redshift_cross_account_arn]
    }

    resources = ["*"]
  }
}

data "aws_iam_policy_document" "emr_kms_with_remote_replication_policy" {
  source_json = data.aws_iam_policy_document.emr_kms_key_policy.json

  statement {
    sid    = "AllowRemoteDimensionToReplicateIntoDatastream"
    effect = "Allow"

    # TODO: maybe separate these out. datastream only needs Encrypt, backups only need Decrypt
    actions = [
      "kms:Decrypt",
      "kms:Encrypt",
      "kms:GenerateDataKey*",
      "kms:ReEncrypt",
    ]

    principals {
      type = "AWS"

      identifiers = compact(flatten([
        local.remote_datastream_replication_role_arn,
        local.remote_bridge_data_replication_role_arn,
        local.remote_datalake_backup_replication_role_arns
      ]))
    }

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "kms:Decrypt",
    ]

    principals {
      type        = "AWS"
      identifiers = [local.redshift_cross_account_arn]
    }

    resources = ["*"]
  }
}