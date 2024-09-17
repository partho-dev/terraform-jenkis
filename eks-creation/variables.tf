variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = list(string)
}

variable "pub_sub" {
  type = list(string)
}

variable "priv_sub" {
  type = list(string)
}

variable "aws_profile" {
  description = "AWS CLI profile to use for authentication"
  type        = string
  default     = "ergonnex-infra-dev"
}