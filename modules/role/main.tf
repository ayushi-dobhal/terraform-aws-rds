resource "aws_iam_role" "aws_role" {
	name        = "${var.role_name}-role"
	description = var.role_description
	max_session_duration = var.max_session_duration
	assume_role_policy = jsonencode(var.assume_role_policy)
	tags = merge(var.common_tags, tomap({"Name": "${var.role_name}-role"}))
}

resource "aws_iam_instance_profile" "aws_profile" {
	name = "${var.role_name}-profile"
	role = aws_iam_role.aws_role.name
}

