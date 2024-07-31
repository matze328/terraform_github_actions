# Erstelle eine öffentliche Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

# Verbinde öffentliche Subnetze mit der öffentlichen Route Table
resource "aws_route_table_association" "public_rta" {
  count          = length(local.azs)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

# Erstelle eine private Route Table (optional für NAT)
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private-route-table"
  }
}

# Verbinde private Subnetze mit der privaten Route Table
resource "aws_route_table_association" "private_rta" {
  count          = length(local.azs)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_rt.id
}