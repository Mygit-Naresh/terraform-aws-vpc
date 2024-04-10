#################VPC CREATIONS############
inputs (required) : -

    cidr_block = 
    public_subnet =
    private_subnet =
    db_subnet = 
    environment = 
    project = 
    is_vpc_peer_required =
    accepter_peer_id = 

#get your cidr output with my_cidrblock in your command

outputs :-
 
 output "my_cidrblock"  {
    value = output_cidrblock.nareshvpc.cidr_block
 }

**********As an example you can see to create your VPC**********************

module "nareshownvpc" {
    source = "git::https://github.com/Mygit-Naresh/terraform-aws-vpc.git"
    cidr_block = "192.168.0.0/16"
    public_subnet = ["192.168.1.0/24","192.168.2.0/24"]
    private_subnet = ["192.168.11.0/24","192.168.12.0/24"]
    db_subnet = ["192.168.21.0/24","192.168.22.0/24"]
    environment = "TEST"
    project = "OWNPROJECT"
    is_vpc_peer_required = "true"
    accepter_peer_id = ""
}
