data "aws_vpc" "default" {
    default = "true"
  #id = data.aws_vpc.default.vpc_id
}
data "aws_route_table"  "default" {
    vpc_id = data.aws_vpc.default.id
    
}
