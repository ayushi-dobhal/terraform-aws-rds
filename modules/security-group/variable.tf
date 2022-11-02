variable "sg_description" {
	type = string
	description = "A string to add description to the security group"
}
variable "sg_name" {
	type = string
	description = "A string to add name to security group"
}
variable "from_port" {
	type = number
	description = "To provide from which port traffic is to be allowed"
}

variable "to_port" {
	type = number
	description = "To provide to which port traffic is to be sent" 
}

variable "protocol" { 
	type = string
	description = "A string to define which protocol to allow in security group"
}

variable "tags" { 
	type = map(string)
	description = "A map of tags to add to all resources"
}

variable "node_group_sg" { 
	type = list(string)
	description = "A list of security groups from which traffic can be allowed in RDS"
}

variable "vpc_id" {
	type        = string
	default     = ""
	description = "A string value for VPC ID"
}

variable "create_rds_security_group" {
	type        = bool
	default     = ""
	description = "A boolean value for creating security group"
}