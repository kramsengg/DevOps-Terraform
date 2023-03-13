# https://github.braintreeps.com/braintree/knowledge/blob/aws-tags/cosmos/architecture/resource_tagging.md

locals {
  allowed_lifespans = ["permanent", "temporary"]

  # Required tags
  owner       = lower(replace(replace(var.owner_slack_channel, "_", "-"), " ", "-"))
  dimension   = lower(replace(replace(var.dimension, "_", "-"), " ", "-"))
  environment = var.environment == "" ? local.dimension : lower(replace(replace(var.environment, "_", "-"), " ", "-"))
  application = lower(replace(replace(var.application, "_", "-"), " ", "-"))
  lifespan    = lower(var.lifespan)
  silenceable = var.silenceable

  # Additional non-required tags
  team = var.team == "" ? local.owner : lower(replace(replace(var.team, "_", "-"), " ", "-"))

  resource_tags = {
    Owner       = local.owner
    Team        = local.team
    Dimension   = local.dimension
    Environment = local.environment
    Application = local.application
    Lifespan    = local.lifespan
    silenceable = local.silenceable
  }
}

resource "null_resource" "check_args" {
  triggers = {
    lifespan = var.lifespan
  }

  provisioner "local-exec" {
    interpreter = ["/usr/bin/env", "python3", "-c"]
    command     = <<EOF
allowed_values = [${join(", ", formatlist("'%s'", local.allowed_lifespans))}]
if '${local.lifespan}' not in allowed_values:
    raise ValueError(f"'${local.lifespan}' is not an allowed lifespan value for ${local.application} (allowed values: {allowed_values})")
EOF
  }
}

