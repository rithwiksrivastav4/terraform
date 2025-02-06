output "vpc_id" {
  value       = aws_vpc.base.id
  description = "this is vpc id"
}

output "vpc_cidr" {
  value       = var.vpc_cidr
  description = "this is vpc cidr"
}

output "subnet_cidrs" {
  value       = var.public_subnets
  description = "this is subnets cidr"
}

output "azs" {
  value       = var.public_subnets
  description = "availability zones of subnets"
}
output "rtn" {
  value       = var.network_name
  description = "route table names"
}
output "web-url" {
  value = format("http://%s", aws_instance.web.public_ip)
}
output "ssh_command" {
  value = format(
    "ssh -i %s @%s",
    var.key_pair_path.private_key_path,
  aws_instance.web.public_ip)
}