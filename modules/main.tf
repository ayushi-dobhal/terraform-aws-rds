resource "aws_db_subnet_group" "subnet-group" {
	name       = "${var.rds_name}-subnet-group"
	subnet_ids = var.subnets
	tags       = merge(var.tags, tomap({"Name": "${var.rds_name}-subnet-group"}))
}

resource "aws_db_option_group" "option-group" {
	name                     = "${var.rds_name}-option-group"
	engine_name              = var.option_engine_name
	major_engine_version     = var.option_major_engine_version
	tags                     = merge(var.tags, tomap({"Name": "${var.rds_name}-option-group"}))
}

resource "aws_rds_cluster_parameter_group" "parameter-group-cluster" {
	name   = "${var.rds_name}-cluster-parameter-group"
	family = var.parameter_family
	tags   = merge(var.tags, tomap({"Name": "${var.rds_name}-cluster-parameter-group"}))
}

resource "aws_db_parameter_group" "parameter-group" {
	name   = "${var.rds_name}-parameter-group"
	family = var.parameter_family
	tags   = merge(var.tags, tomap({"Name": "${var.rds_name}-parameter-group"}))
}

resource "aws_rds_cluster" "rds_cluster" {
	cluster_identifier      = var.rds_name
	engine                  = var.cluster_engine
	engine_version          = var.cluster_engine_version
	availability_zones      = var.availability_zones
	database_name           = var.database_name
	master_username         = var.master_username
	master_password         = var.master_password
	backup_retention_period = var.backup_retention_period											#7
	deletion_protection     = var.deletion_protection
	db_subnet_group_name    = aws_db_subnet_group.subnet-group.name
	iam_roles               = var.iam_roles
	vpc_security_group_ids  = var.security_groups
	skip_final_snapshot     = var.skip_final_snapshot												#true
	storage_encrypted       = var.storage_encrypted													#true
	kms_key_id				= var.kms_key_id_arn
	preferred_backup_window = var.preferred_backup_window
	db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.parameter-group-cluster.name
	enabled_cloudwatch_logs_exports	= var.cw_logs
	port							= var.port
	tags                            = merge(var.tags, tomap({"Name": var.rds_name}))
}

resource "aws_rds_cluster_instance" "rds" {
	identifier                   = var.rds_name
	cluster_identifier           = aws_rds_cluster.rds_cluster.cluster_identifier
	engine                       = aws_rds_cluster.rds_cluster.engine
	engine_version               = aws_rds_cluster.rds_cluster.engine_version
	db_subnet_group_name         = aws_rds_cluster.rds_cluster.db_subnet_group_name
	db_parameter_group_name      = aws_db_parameter_group.parameter-group.name
	instance_class               = var.instance_type
	copy_tags_to_snapshot        = var.copy_tags_to_snapshot
	preferred_maintenance_window = var.maintenance_window
	apply_immediately            = var.apply_immediately											#true
	auto_minor_version_upgrade   = var.auto_minor_version_upgrade									#true
	monitoring_interval			 = var.monitoring_interval
	monitoring_role_arn          = var.monitoring_role_arn
	tags                         = merge(var.tags, tomap({"Name": var.rds_name}))
}

