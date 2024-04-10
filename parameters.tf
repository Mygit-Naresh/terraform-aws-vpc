# resource "aws_ssm_parameter" "vpc" {
#   name  = "${var.project}/${var.environment}/${var.vpc}"
#   type  = "String"
#   value = data.aws_vpc.myvpc.id
# }