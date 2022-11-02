locals {
    project_name_prefix = "${var.environment}-${var.project_name_prefix}"
    common_tags = merge(
        var.common_tags,
        tomap({
            "Project"     = var.project,
            "Environment" = var.environment
        })
    )

#    rds_assume_role_policy = {
#    Version : "2012-10-17",
#    Statement = [
#      {
#        Action = "sts:AssumeRole"
#        Effect = "Allow"
#        Principal = {
#          "Service" = "rds.amazonaws.com"
#        }
#        Sid = ""
#      }
#    ]
#  }
}
