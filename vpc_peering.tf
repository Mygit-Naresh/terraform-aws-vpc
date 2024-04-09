resource "aws_vpc_peering_connection" "vpc_peer" {
    
  count  =  var.is_vpc_peer_required ? 1 : 0
  peer_vpc_id   = var.accepter_peer_id == "" ? data.aws_vpc.default.id : var.accepter_peer_id
  vpc_id        = aws_vpc.myvpc.id
  auto_accept   = true

  tags = merge(local.commontag, 
       { 
        Name = "${local.name}-DEFAULT-MYVPC-PEERING"
        Create_date_time = local.time
      })
}

resource "aws_route" "peer_acceptor" {

  count = var.is_vpc_peer_required ? 1 : 0
  route_table_id            = data.aws_route_table.default.id
  destination_cidr_block    = var.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer[count.index].id
}
resource "aws_route" "peer_Private" {
   count = var.is_vpc_peer_required ? 1 : 0
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer[count.index].id
}
resource "aws_route" "peer_db" {
   count = var.is_vpc_peer_required ? 1 : 0
  route_table_id            = aws_route_table.dbrt.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer[count.index].id
}
resource "aws_route" "peer_pub" {
   count = var.is_vpc_peer_required ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer[count.index].id
}


