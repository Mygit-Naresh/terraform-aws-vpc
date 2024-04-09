variable "cidr_block" {
    type = string
    default = "10.0.0.0/16"
}
variable "common_tags" {
     type = map(string)
     default = {
        Createdby = "Terraform",
        Costcenter = "FIN-005-HYD-CLOUD-AWS",
        Admin_email = "admin.roboshop@gmail.com"
    }
}  
variable "vpc" {
   type = map
   default = {}
}
variable "project" {
    type   = string
}

variable "environment" {
    type   = string
}
variable "public_subnet" {
   type        = list(string)
   default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "private_subnet" {
    type        = list(string)
    default = ["10.0.11.0/24","10.0.12.0/24"]
}
variable "db_subnet" {
     type        = list(string)
     default = ["10.0.21.0/24","10.0.22.0/24"]
}
variable "availability_zone" {
     type        = list(string)
     default = ["us-east-1a","us-east-1b"]
}

variable "is_vpc_peer_required" {
       type = bool
       default = "false"   
   }
variable "accepter_peer_id" {
    type = string
    default = ""  
}