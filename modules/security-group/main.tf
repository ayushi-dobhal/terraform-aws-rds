resource "aws_security_group" "rds_mysql_sg" {
  count = var.create_rds_security_group ? 1 : 0
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    security_groups  = var.node_group_sg
  }

  tags = var.tags
}
