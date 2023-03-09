# RDS

resource "aws_db_subnet_group" "subnet-group" {
  name                            = "${var.cluster_identifier}-subnet-group"
  subnet_ids                      = var.private_subnet_groups
  tags = {
    Name = "DB subnet group"
  }
}


resource "aws_rds_cluster" "rds-db-cluster" {
    cluster_identifier            = "${var.cluster_identifier}-rds"
    availability_zones            = var.availability_zones
    database_name                 = var.database_name
    master_username               = var.master_username
    master_password               = var.master_password
    engine                        = var.engine
    engine_version                = var.engine_version
    backup_retention_period       = var.backup_retention_period
    db_subnet_group_name          = aws_db_subnet_group.subnet-group.name
    skip_final_snapshot           = var.skip_final_snapshot
    apply_immediately             = var.apply_immediately
    deletion_protection           = var.deletion_protection

    lifecycle {
      ignore_changes = [
        arn,
        availability_zones,
        backtrack_window,
        cluster_identifier_prefix,
        cluster_members,
        cluster_resource_id,
        db_cluster_parameter_group_name,
        deletion_protection,
        enabled_cloudwatch_logs_exports,
        endpoint,
        engine_version_actual,
        hosted_zone_id,
        iam_database_authentication_enabled,
        iam_roles,
        id,
        kms_key_id,
        port,
        preferred_backup_window,
        preferred_maintenance_window,
        reader_endpoint,
        storage_encrypted,
        tags,
        tags_all,
      ]
    }
}

resource "aws_rds_cluster_instance" "cluster_instances" {
    count                     = var.db_count
    identifier                = "${aws_rds_cluster.rds-db-cluster.cluster_identifier}-${count.index}"
    cluster_identifier        = aws_rds_cluster.rds-db-cluster.id
    instance_class            = var.instance_class
    engine                    = aws_rds_cluster.rds-db-cluster.engine
    engine_version            = aws_rds_cluster.rds-db-cluster.engine_version
    publicly_accessible       = var.publicly_accessible
    apply_immediately         = var.apply_immediately
    performance_insights_enabled = var.performance_insights_enabled
}
