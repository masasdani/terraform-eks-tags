# Terraform EKS Tags

## Terraform Version

```
terraform version
---
Terraform v1.0.6
+ provider registry.terraform.io/hashicorp/aws v3.61.0
+ provider registry.terraform.io/hashicorp/local v2.1.0
+ provider registry.terraform.io/hashicorp/null v3.1.0
+ provider registry.terraform.io/hashicorp/template v2.2.0
```

## Folder Structure

### **Core**

All the components inside `Core` folder are related with Backbone Network Service eg:

- VPC
- Subnet Configuration
- Internet Gateway
- NAT Gateway
- and others

### **Resources**

All the components inside `Resources` folder are related to AWS Services that related with application deployment, eg:

- EKS
- EC2
- S3
- and others

### **Modules (Terraform Submodules)**

- Official Repositories

  ```
  ./get-official.sh
  -- or --
  make sub-official
  ```

- Community Repositories

  ```
  ./get-community.sh
  -- or --
  make sub-community
  ```

## How-to-Use

- Clone this repository

  ```
  git clone git@gitlab.com:zeroc0d3lab-devops/terraform-eks-tags.git
  ```

- Pull Submodule repository

  ```
  git submodule update --init --recursive
  -- or --
  make sub-all
  ```

- Assume Role for Terraform command

  ```
  aws sts assume-role --role-arn arn-role-to-assume --role-session-name AWSCLI
  ```

- Terraform Execution
  ```
  terraform init
  terraform plan
  terraform apply
  ```
