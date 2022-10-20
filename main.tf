module "rds_cluster" {
  source = "../modules/rds"
  availability_zones     = var.availability_zones
  cluster_engine         = var.cluster_engine
  cluster_engine_version = var.cluster_engine_version  
  database_name          = var.database_name
  master_username        = local.db_creds.username
  master_password        = local.db_creds.password
  instance_type          = var.instance_type
  kms_key_id_arn         = var.kms_id                         #OPTION TO CHOOSE
  security_groups        = var.rds_sg                         #CREATE
  subnets =              = var.subnet_ids
  rds_name                    = "${local.project_name_prefix}-database"
  tags                        = local.common_tags
  option_engine_name          = var.option_engine_name    
  option_major_engine_version = var.option_major_engine_version    
  iam_roles = [
  data.terraform_remote_state.iam_roles.outputs.rds_role_arn] #CREATE
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
