output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.vpc.cidr_block
}
output "default_route_table_id" {
  description = "The ID of the default route table"
  value       = aws_vpc.vpc.default_route_table_id
}
output "public_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.public_subnets[*].id
}
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private_subnets[*].id
}
output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = aws_route_table.route-table-public.id
}
output "private_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = aws_route_table.route-table-private.id
}
output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.gw.id
}
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = aws_eip.eip.public_ip
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnets.*.id
}
output "public_subnet_ids" {
  value = aws_subnet.public_subnets.*.id
}