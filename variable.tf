variable "rds_sg" {
  type    = string
  default = "sg-"
}

variable "kms_id" {
  type  = map(string)
  default = "arn:aws:kms:ap-south-1::"
}

variable "instance_type" {
  type  = string
  default = "db.t3.medium"
}

variable "monitoring_interval" {
  type  = number
  default = 0
}

variable "availability_zones" {
  default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "cluster_engine" {
  default = "aurora-mysql"
}

variable "cluster_engine_version" {
  default = "5.7.mysql_aurora.2.10.2"
}

variable "database_name" { 
  default = "ToTheNew"
}

variable "subnet_ids" {
  default = [""]
}

variable "option_engine_name" {
  default = "aurora-mysql"
}

variable "option_major_engine_version" {
  default = "5.7"
}

variable "backup_retention_period" {
  default = 7
}

variable "skip_final_snapshot" {
  default = true
}

variable "storage_encrypted" {
  default = true
}

variable "apply_immediately" {
  default = true
}

variable "auto_minor_version_upgrade" {
  default = true
}

variable "parameter_family" {
  default = "aurora-mysql5.7"
}

variable "preferred_backup_window" {
  default = "07:00-09:00"
}

variable "maintenance_window" {
  default = "Fri:09:00-Fri:09:30"
}

variable "cw_logs" {
  default = ["error", "slowquery", "audit", "general"]
}

variable "port" {
  default = 3306
}

