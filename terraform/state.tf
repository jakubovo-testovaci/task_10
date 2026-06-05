terraform {
  backend "s3" {
    bucket  = "ecs-nginx-demo-3-20260601" # Nahraďte názvem vašeho S3 bucketu
    key     = "ecs-demo/terraform.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }
}