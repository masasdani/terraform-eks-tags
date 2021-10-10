/*
What is this tf script do:
  - Define Terraform providers (in this case is AWS)
  - Define common tags that can be used in all services
*/

provider "aws" {
  region = var.region_primary
}

locals {
  tags = {
    Environment     = "${var.environment}"
    Department      = "${var.department}"
    DepartmentGroup = "${var.environment}-${var.department}"
  }

}
