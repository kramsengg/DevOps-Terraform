locals {
  glue_dimension = var.dimension
}

data "aws_iam_policy_document" "emr_cluster_events_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"

      identifiers = [
        "lambda.amazonaws.com",
      ]
    }
  }
}

resource "aws_iam_role" "emr_cluster_events_lambda" {
  count              = var.dimension == local.glue_dimension ? 1 : 0
  name               = "${var.dimension}_emr_cluster_events_${var.region}"
  assume_role_policy = data.aws_iam_policy_document.emr_cluster_events_assume_role.json
  # tags               = var.required_resource_tags.aws_tags
}

data "aws_iam_policy_document" "emr_cluster_events_lambda" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "arn:aws:logs:*:*:*",
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "elasticmapreduce:List*",
      "elasticmapreduce:Describe*",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "emr_cluster_events_lambda" {
  count  = var.dimension == local.glue_dimension ? 1 : 0
  role   = aws_iam_role.emr_cluster_events_lambda[0].id
  policy = data.aws_iam_policy_document.emr_cluster_events_lambda.json
}