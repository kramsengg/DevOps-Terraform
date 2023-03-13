locals {
  canonical_dimensions = {
    experimental = "experimental"
    # even though `dev` no longer exists, it's still the canonical dimension
    # because changing it to `qa` requires deleting and recreating a number 
    # of resources
    dev             = "dev"
    sandbox         = "sand"
    production      = "prod"
    data-staging    = "datastag"
    data-production = "dataprod"
  }

  # Used to restrict access on Data Engineering clusters to Data Eng and Infrastructure teams
  # as well as the group for vulnerability detection + asset mangement service accounts
  # https://engineering.paypalcorp.com/jira/browse/DTBTDE-1766
  admin_ldap_groups = [
    "${var.account}-infra-admin",
    "infra-admin-multi-account",
    "authenticated-services-group",
  ]

  datalake_ingest_deployment_name             = "datalake_ingest"
  datalake_inspect_deployment_name            = "datalake_inspect"
  datalake_deliver_deployment_name            = "datalake_deliver"
  datalake_snapshot_deployment_name           = "datalake_snapshot"
  datalake_snapshot_secondary_deployment_name = "datalake_snapshot_secondary"
  datalake_validate_deployment_name           = "datalake_validate"
  merchant_reporting_deployment_name          = "merchant_reporting"
  datalake_public_deployment_name             = "datalake_public"
  data_services_deployment_name               = "data_services"
  transient_cluster_deployment_name           = "transient"

  # Support pocket-dimension testing
  canonical_dimension     = lookup(local.canonical_dimensions, var.account)
  is_pocket_dimension     = local.canonical_dimension != var.dimension
  pocket_dimension_suffix = local.is_pocket_dimension ? "-${var.dimension}" : ""
}

module "merchant_reporting_tags" {
  source = "../modules/resource_tagger"

  owner_slack_channel = "service-reporting"
  application         = "merchant-reporting"
  dimension           = var.dimension
  team                = "merchant-reporting"
}

module "external_reporting_tags" {
  source = "../modules/resource_tagger"

  owner_slack_channel = "service-ext-reporting"
  application         = "external-reporting"
  dimension           = var.dimension
  team                = "external-reporting"
}

module "data_engineering_tags" {
  source = "../modules/resource_tagger"

  owner_slack_channel = "service-reporting"
  application         = "merchant-reporting"
  dimension           = var.dimension
  team                = "data-engineering"
}
