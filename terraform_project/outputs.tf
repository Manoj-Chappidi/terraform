output "public_subnets_ids" {
  value = module.vpc.public_subnets_ids
}

output "private_subnets_ids" {
  value = module.vpc.private_subnets_ids
}

output "nat_gateway_ip" {
  value = module.route53.nat_gateway_ip
}
