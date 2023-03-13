resource "aws_iam_user" "nest_datalake_ro_user" {
  name = "${var.dimension}_nest_datalake_ro_${var.region}"
  # tags = var.required_resource_tags.aws_tags

  lifecycle {
    prevent_destroy = false
  }
}

# resource "aws_iam_user" "treasury_funding_user" {
#   name = "${var.dimension}_treasury_funding_user_${var.region}"
#   tags = merge(var.required_resource_tags.aws_tags, { Team = "treasury", Owner = "service-treasury" })

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "aws_iam_user" "airflow_sox_user" {
#   name = "${var.dimension}_airflow_sox_user_${var.region}"
#   tags = merge(var.required_resource_tags.aws_tags, { Team = "data-services", Owner = "service-data" })

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "aws_iam_user" "airflow_jenkins_s3_deploy_user" {
#   name = "${var.dimension}_airflow_jenkins_s3_deploy_user_${var.region}"
#   tags = merge(var.required_resource_tags.aws_tags, { Team = "data-services", Owner = "service-data" })

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "aws_iam_user" "airflow_not_sox_user" {
#   name = "${var.dimension}_airflow_not_sox_user_${var.region}"
#   tags = merge(var.required_resource_tags.aws_tags, { Team = "data-services", Owner = "service-data" })

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "aws_iam_user" "airflow_paypal_unified_sftp_user" {
#   name = "${var.dimension}_airflow_paypal_unified_sftp_user_${var.region}"
#   tags = merge(var.required_resource_tags.aws_tags, { Team = "data-services", Owner = "service-data" })

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "aws_iam_user" "external_reporting_airflow" {
#   name = "${var.dimension}_external_reporting_airflow_${var.region}"
#   tags = merge(var.required_resource_tags.aws_tags, { Team = "external-reporting", Owner = "service-ext-reporting" })

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "aws_iam_user" "external_reporting_jenkins_access" {
#   name = "${var.dimension}_external_reporting_jenkins_access_${var.region}"
#   tags = merge(var.required_resource_tags.aws_tags, { Team = "external-reporting", Owner = "service-ext-reporting" })

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "aws_iam_user" "airflow_aws_sftp_user" {
#   name = "${var.dimension}_airflow_aws_sftp_user_${var.region}"
#   tags = merge(var.required_resource_tags.aws_tags, { Team = "merchant-reporting", Owner = "service-reporting" })

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "aws_iam_user" "gateway_aws_sftp_user" {
#   name = "${var.dimension}_gateway_aws_sftp_user_${var.region}"
#   tags = merge(var.required_resource_tags.aws_tags, { Team = "merchant-reporting", Owner = "service-reporting" })

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "aws_iam_user" "looker_athena_user" {
#   count = var.dimension == local.glue_dimension ? 1 : 0
#   name  = "${var.dimension}_looker_athena_${local.region}"
#   tags  = merge(var.required_resource_tags.aws_tags, { Application = "datalake-auth" })

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "aws_iam_user" "paypal_deliver_consume_user" {
#   name = "${var.dimension}_paypal_deliver_consume_${local.region}"
#   tags = var.required_resource_tags.aws_tags

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "aws_iam_user" "paypal_rdm_deliver_user" {
#   name = "${var.dimension}_paypal_rdm_deliver_${local.region}"
#   tags = var.required_resource_tags.aws_tags

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "aws_iam_user" "report_monitoring_user" {
#   name = "${var.dimension}_report_monitoring_user_${var.region}"
#   tags = merge(var.required_resource_tags.aws_tags, { Team = "report-monitoring", Owner = "reporting-o11y-insights-team" })

#   lifecycle {
#     prevent_destroy = true
#   }
# }
