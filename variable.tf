variable "rds_sg" {
  type    = string
  default = "sg-"
}

variable "kms_id" {
  type  = string
  default = ""
}

variable "instance_type" {
  type  = string
  default = "db.t3.medium"
}

#variable "monitoring_interval" {
#  type  = number
#  default = 0
#}

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

variable "project_name_prefix" {
    type        = string
    default     = "tothenew"
    description = "A string value to describe prefix of all the resources"
}

variable "region" {
    type        = string
    description = "A string value for Launch resources in which AWS Region"
    default     = "ap-south-1"
}

variable "environment" {
    type  = string
    description = "A string value for tag as Environment Name"
    default = "dev"
}

variable "project" {
    type        = string
    default     = "tothenew"
    description = "A string value for tag as Project Name"
}

variable "profile" {
    type        = string
    default     = "tothenew"
    description = "A string value for tag as Project Name"
}

variable "vpc_id" {
    type        = string
    default     = ""
    description = "A string value for VPC ID"
}

variable "username" {
  type        = string
  default     = ""
  description = "A string value for Username"
}

variable "password" {
  type        = string
  default     = ""
  description = "A string value for password"
}

variable "sg_description" {
  type = string
  default     = ""
  description = "A string to add description to the security group"
}
variable "sg_name" {
  type = string
  default     = ""
  description = "A string to add name to security group"
}
variable "from_port" {
  type = number
  default     = "3306"
  description = "To provide from which port traffic is to be allowed"
}

variable "to_port" {
  type = number
  default     = "3306"
  description = "To provide to which port traffic is to be sent"
}

variable "protocol" {
  type = string
  default     = "tcp"
  description = "A string to define which protocol to allow in security group"
}

variable "node_group_sg" {
  type = list(string)
  default     = [""]
  description = "A list of security groups from which traffic can be allowed in RDS"
}

variable "common_tags" {
  type        = map(string)
  description = "A map to add common tags to all the resources"
}

variable "create_rds_security_group" {
  type        = boolean
  default     = true
  description = "A map to add common tags to all the resources"
}

variable "security_groups" {
  type        = list(string)
  default     = [""]
  description = "A map to add common tags to all the resources"
}