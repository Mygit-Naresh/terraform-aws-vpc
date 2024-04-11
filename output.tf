# output "EIP_ip" {
#   value = aws_eip.eip.address
# }
# output "public_ip" {

#     value = aws_subnet.publicsubnet[count.index].cidr_block
# }
# output "private_ip" {
# value = aws_subnet.privatesubnet[count.index].cidr_block
# }
# output "db_ip" {
# value = aws_subnet.dbsubnet[count.index].cidr_block
# }
output "vpc_id" {
    value = aws_vpc.myvpc.id
}
output "public_subnet_ids" {
    value = aws_subnet.publicsubnet[*].id
}
output "private_subnet_ids" {
    value = aws_subnet.privatesubnet[*].id
}
output "db_subnet_ids" {
    value = aws_subnet.dbsubnet[*].id
}