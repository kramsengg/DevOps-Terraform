locals {

  account_ids = {
    dataprod = "610430157502"
    datastag = "610430157502"
  }

  redshift_account_no        = "610430157502"
  redshift_cross_account_arn = "arn:aws:iam::${local.redshift_account_no}:role/RedshiftUnloadFromDatalake"

  # Grant access to use the kms key from another dimension or account. Note that the role needs to exist in the remote account before this can be applied.
  remote_datastream_replication_role_arns = {
    # datastag allows dataprod kinesis=>s3 replication lambda to write to datastag
    datastag_us-east-2 = "arn:aws:iam::${local.account_ids["dataprod"]}:role/dataprod_to_datastag_datastream_s3_replication_ap-south-1"
  }

  remote_datastream_replication_role_arn = lookup(local.remote_datastream_replication_role_arns, "${var.dimension}_${var.region}", "")
  remote_datastream_replication_enabled  = contains(keys(local.remote_datastream_replication_role_arns), "${var.dimension}_${var.region}")


  # Datalake bridge replication; role configured in regional/roles.tf
  remote_bridge_data_replication_role_arns = {
    datastag_us-east-2 = "arn:aws:iam::${local.account_ids["dataprod"]}:role/dataprod_to_datastag_bridge_data_replication_us-east-2"
  }
  remote_bridge_data_kms_key_arns = {
    dataprod_us-east-2 = "arn:aws:kms:us-east-2:${local.account_ids["datastag"]}:key/0db4c3c8-19fe-43c7-8e79-68c62e584725"
  }
  remote_bridge_data_replication_role_arn = lookup(local.remote_bridge_data_replication_role_arns, "${var.dimension}_${var.region}", "")
  remote_bridge_data_kms_key_arn          = lookup(local.remote_bridge_data_kms_key_arns, "${var.dimension}_${var.region}", "")



  remote_datalake_backup_replication_role_arn_mapping = {
    # dataprod allows datastag snapshot to read dataprod backups for reinitializing datastag
    dataprod_us-east-2 = [
      "arn:aws:iam::${local.account_ids["datastag"]}:role/datastag_datalake_snapshot_instance_profile_ap-south-1",
    ]
  }
  remote_datalake_backup_replication_role_arns = lookup(local.remote_datalake_backup_replication_role_arn_mapping, "${var.dimension}_${var.region}", [])
  remote_datalake_backup_replication_enabled   = contains(keys(local.remote_datalake_backup_replication_role_arn_mapping), "${var.dimension}_${var.region}")


  remote_emrfs_kms_key_usage_enabled = (local.remote_datastream_replication_enabled || local.remote_datalake_backup_replication_enabled
  )
}