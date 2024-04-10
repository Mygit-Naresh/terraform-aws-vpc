# output "EIP_ip" {
#   value = aws_eip.eip.address
# }
# output "public_ip" {

#     value = aws_subnet.publicsubnet[count.index].cidr_block
# }
# output "private_ip" {
#     value = aws_subnet.privatesubnet[count.index].cidr_block
# }
# output "db_ip" {
#     value = aws_subnet.dbsubnet[count.index].cidr_block
# }
output "vpc_id" {
    value = aws_vpc.myvpc.id
}
