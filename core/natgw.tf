/*
What is this tf script do:
  - Define NAT Gateway for Private Subnet and enable EIP
  - Associate Route Table for Private Subnet with NAT Gateway
*/

locals {
  tags_private_rt = {
    ResourceGroup = "${var.environment}-RT"
    Name          = "devopscorner_vpc_private_rt"
  }

  tags_natgw = {
    ResourceGroup = "${var.environment}-NATGW"
    Name          = "devopscorner_vpc_private_rt"
  }
}

### Enable EIP for NAT Gateway
resource "aws_eip" "nat" { #1
  vpc = true
}

### Define NAT Gateway
resource "aws_nat_gateway" "ngw" {       #2
  allocation_id = aws_eip.nat.id         #3
  subnet_id     = aws_subnet.public_a.id #4

  tags = merge(local.tags, local.tags_natgw)
}

### Associate Route Table with NAT GAteway
resource "aws_route_table" "private" { #5
  vpc_id = aws_vpc.development.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id #6
  }

  tags = merge(local.tags, local.tags_private_rt)

}

### Associate Route Table with Private Subnets
resource "aws_route_table_association" "private_1a" { #7
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_1b" { #7
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private.id
}
