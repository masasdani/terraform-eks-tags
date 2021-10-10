
## Specifies the S3 Bucket and DynamoDB table used for the durable backend and state locking

terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "devopscorner-poc-tf-remote-state"
    dynamodb_table = "devopscorner-poc-tf-state-lock"
    key            = "devopscorner-poc-dev/resources/eks/terraform.tfstate"
    region         = "ap-southeast-1"
  }
}
