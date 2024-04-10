output "EIP_ip" {
  value = aws_eip.eip.address
}
output "public_ip" {
    value = aws_subnet.publicsubnet.cidr_block
}
output "private_ip" {
    value = aws_subnet.privatesubnet.cidr_block
}
output "db_ip" {
    value = aws_subnet.dbsubnet.cidr_block
}
output "vpc_id" {
    value = aws_vpc.myvpc.id
}
