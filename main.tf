#module "rds_role" {
#  source             = "modules/role"
#  role_name          = "${local.project_name_prefix}-rds"
#  role_description   = "Rds Role"
#  assume_role_policy = local.rds_assume_role_policy
#  common_tags        = local.common_tags
#}

module "security_group" {
  count = var.create_rds_security_group ? 1 : 0
  source = "modules/security-group"
  sg_name = "${local.project_name_prefix}-rds-sg"
  sg_description = var.sg_description
  vpc_id = var.vpc_id
  from_port = var.from_port
  to_port = var.to_port
  protocol = var.protocol
  node_group_sg = var.node_group_sg
  tags  = merge(local.common_tags, tomap({ "Name" : "${local.project_name_prefix}-rds-sg" }))
}

module "rds_cluster" {
  source = "modules/rds-mysql"
  availability_zones     = var.availability_zones
  cluster_engine         = var.cluster_engine
  cluster_engine_version = var.cluster_engine_version  
  database_name          = var.database_name
  master_username        = var.username
  master_password        = var.password
  instance_type          = var.instance_type
  kms_key_id_arn         = var.kms_id == "" ?  "aws/kms" : var.kms_id
  security_groups        = var.security_groups == "" ? module.security_group[0].rds_mysql_sg_id : var.security_groups
  subnets                = var.subnet_ids
  rds_name                    = "${local.project_name_prefix}-database"
  tags                        = local.common_tags
  option_engine_name          = var.option_engine_name    
  option_major_engine_version = var.option_major_engine_version
  backup_retention_period = var.backup_retention_period
  skip_final_snapshot     = var.skip_final_snapshot
  storage_encrypted       = var.storage_encrypted
  apply_immediately       = var.apply_immediately
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  parameter_family        = var.parameter_family         
  preferred_backup_window = var.preferred_backup_window   
  maintenance_window      = var.maintenance_window     
  cw_logs                 = var.cw_logs
  port                    = var.port
}
