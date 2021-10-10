/*
What is this tf script do:
  - Define VPC
  - Associate Private Subnets as Main Route Table
*/

locals {
  tags_vpc = {
    ResourceGroup = "${var.environment}-VPC"
    Name          = "${var.vpc_name}"
  }
}

resource "aws_vpc" "development" {
  cidr_block           = "172.212.0.0/16"
  enable_dns_hostnames = true

  tags = merge(local.tags, local.tags_vpc)
}

resource "aws_main_route_table_association" "private_subnet_association" {
  vpc_id         = aws_vpc.development.id
  route_table_id = aws_route_table.private.id
}
