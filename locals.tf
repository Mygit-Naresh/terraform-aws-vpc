locals { 
   name = "${var.project}-${var.environment}"
   time  = formatdate("YYYY-MM-DD hh:mm:ss ZZZ", timestamp())
}
locals {
   commontag  = var.common_tags
}
# locals {
#   tag = merge(local.commontag,local.name,local.time)
#         # { 
#         # Create_date_time = local.time
#         # } )
# }

