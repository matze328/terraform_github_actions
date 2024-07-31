# Outputs für VPC und Subnetze
output "vpc_id" {
  value = aws_vpc.main.id
}

# Outputs für öffentliche Subnetze, benannt nach den statischen Namen
output "public_subnet_id_1a" {
  value = aws_subnet.public[0].id
}

output "public_subnet_id_1b" {
  value = aws_subnet.public[1].id
}

output "public_subnet_id_1c" {
  value = aws_subnet.public[2].id
}

# Outputs für private Subnetze, benannt nach den statischen Namen
output "private_subnet_id_1a" {
  value = aws_subnet.private[0].id
}

output "private_subnet_id_1b" {
  value = aws_subnet.private[1].id
}

output "private_subnet_id_1c" {
  value = aws_subnet.private[2].id
}