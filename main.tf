resource "aws_vpc" "myvpc" {
  cidr_block       = var.cidr_block
 
   tags = merge(local.commontag, 
       { 
        Name = "${local.name}-VPC"
        Create_date_time = local.time
      })
    
  }
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
   tags =  merge(local.commontag, 
       { 
        Name = "${local.name}-IGW"
        Create_date_time = local.time
      })
  }   
resource "aws_subnet" "publicsubnet" {
  count = 2
  vpc_id     = aws_vpc.myvpc.id
  cidr_block =  var.public_subnet[count.index]
  availability_zone = var.availability_zone[count.index]
  #availability_zone = aws_subnet.publicsubnet
  enable_resource_name_dns_a_record_on_launch = true
  tags = merge(local.commontag, 
       { 
        Name = "${local.name}-PUB-${var.availability_zone[count.index]}"
        Create_date_time = local.time
      })
}
resource "aws_subnet"  "privatesubnet" {
     count = 2
     vpc_id  = aws_vpc.myvpc.id
     cidr_block = var.private_subnet[count.index]
     availability_zone = var.availability_zone[count.index]
      tags = merge(local.commontag, 
       { 
        Name = "${local.name}-PRIVATE-${var.availability_zone[count.index]}"
        Create_date_time = local.time
      })
}
resource "aws_subnet"  "dbsubnet" {
     count = 2
     vpc_id  = aws_vpc.myvpc.id
     cidr_block = var.db_subnet[count.index]
     availability_zone = var.availability_zone[count.index]
     tags = merge(local.commontag, 
       { 
        Name = "${local.name}-DATABASE-${var.availability_zone[count.index]}"
        Create_date_time = local.time
      })
}
resource "aws_eip" "eip" {
 domain   = "vpc"
 tags = merge(local.commontag, 
       { 
        Name = "${local.name}-ELASTIC_IP"
        Create_date_time = local.time
      })
}
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.publicsubnet[0].id

  tags = merge(local.commontag, 
       { 
        Name = "${local.name}-NAT"
        Create_date_time = local.time
      })
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.myigw]
}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.myvpc.id

  route {
    
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
  tags = merge(local.commontag, 
       { 
        Name = "${local.name}-RT-1-PUBLIC"
        Create_date_time = local.time
      })
}
resource "aws_route_table_association" "public_subnet_asso" {
 count =  length(var.public_subnet)
 subnet_id      = aws_subnet.publicsubnet[count.index].id
 route_table_id = aws_route_table.public.id
}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
     }
 tags = merge(local.commontag, 
       { 
        Name = "${local.name}-RT-2-PRIVATE"
        Create_date_time = local.time
      })
}
resource "aws_route_table_association" "private_subnet_asso" {
 count =  length(var.private_subnet)
 subnet_id      = aws_subnet.privatesubnet[count.index].id
 route_table_id = aws_route_table.private.id
}
resource "aws_route_table" "dbrt" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
     }
 tags = merge(local.commontag, 
       { 
        Name = "${local.name}-RT-3-DATABASE"
        Create_date_time = local.time
      })
}
resource "aws_route_table_association" "DB_subnet_asso" {
 count =  length(var.db_subnet)
 subnet_id      = aws_subnet.dbsubnet[count.index].id
 route_table_id = aws_route_table.dbrt.id
}




      




