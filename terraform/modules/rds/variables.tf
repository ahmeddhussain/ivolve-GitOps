variable "vpc_id" { type = string }
variable "private_subnets" { type = list(string) }
variable "eks_node_security_group_id" { type = string }
variable "db_username" { type = string }
variable "db_password" { type = string }
variable "db_name" { type = string }
