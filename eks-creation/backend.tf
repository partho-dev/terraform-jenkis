# terraform {
#   backend "s3" {
#     bucket         = "my-terraform-state-bucket"
#     key            = "eks/terraform.tfstate"
#     region         = "ap-south-1"
#     dynamodb_table = "terraform-state-lock"
#   }
# }
