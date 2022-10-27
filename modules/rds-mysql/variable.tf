variable "cluster_engine" {}
variable "cluster_engine_version" {}
variable "availability_zones" {
	type    = list(string)
}
variable "master_username" {
	type    = string
}
variable "master_password" {
	type    = string
}
variable "database_name" {
	type    = string
}
variable "copy_tags_to_snapshot" {
	type    = bool
	default = true
}
variable "instance_type" {
	type    = string
}
variable "security_groups" {
	type = list(string)
}
variable "subnets" {
	type = list(string)
}
variable "tags" {
	type = map(string)
}
variable "deletion_protection" {
	default = true
}
variable "rds_name" {
	type    = string
}
variable "maintenance_window" {}
variable "preferred_backup_window" { }
variable "kms_key_id_arn" {
	type    = string
}
variable "option_major_engine_version" {}
variable "option_engine_name" {}
#variable "iam_roles" {
#	type    = string
#}
variable "parameter_family" {
	type 	= string
}
variable "port" {
	type 	= number
}
variable "cw_logs" {
	type 	= list(string)
}
#variable "monitoring_interval" {
#	type 	= number
#}
#variable "monitoring_role_arn" {
#	type = string
#}
variable "backup_retention_period" {
	type = number
}
variable "skip_final_snapshot" {
	type = boolean
}
variable "storage_encrypted" {
	type = boolean
}
variable "apply_immediately" {
	type = boolean
}
variable "auto_minor_version_upgrade" {
	type = boolean
}