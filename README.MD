#################VPC CREATIONS############
inputs (required) : -

cidr_block = 
environment = 
project = 
is_vpc_peer_required = 

#get your cidr output with my_cidrblock in your command

outputs :-
 
 output "my_cidrblock"  {
    value = output_cidrblock.nareshvpc.cidr_block
 }
   