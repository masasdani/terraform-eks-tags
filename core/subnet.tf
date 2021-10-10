/*
What is this tf script do:
  - Define Public and Private Subnets
*/

locals {
  tags_public_subnet = {
    ResourceGroup = "${var.environment}-PUB-SUBNET"
    Name          = "devopscorner_vpc"
  }

  tags_private_subnet = {
    ResourceGroup = "${var.environment}-PRIV-SUBNET"
  }
}

### Public and Private for AZ A
resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.development.id
  cidr_block        = "172.212.0.0/20"
  availability_zone = "ap-southeast-1a"

  tags = merge(local.tags, local.tags_private_subnet, { Name = "${var.vpc_name}_private_1a" })
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.development.id
  cidr_block              = "172.212.16.0/20"
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = true

  tags = merge(local.tags, local.tags_public_subnet, { Name = "${var.vpc_name}_public_1a" })

}

### Public and Private for AZ B
resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.development.id
  cidr_block        = "172.212.32.0/20"
  availability_zone = "ap-southeast-1b"

  tags = merge(local.tags, local.tags_private_subnet, { Name = "${var.vpc_name}_private_1b" })
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.development.id
  cidr_block              = "172.212.64.0/20"
  availability_zone       = "ap-southeast-1b"
  map_public_ip_on_launch = true

  tags = merge(local.tags, local.tags_public_subnet, { Name = "${var.vpc_name}_public_1b" })
}
