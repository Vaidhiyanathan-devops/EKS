output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "security_group_id" {
  value = aws_security_group.eks_sg.id
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}
