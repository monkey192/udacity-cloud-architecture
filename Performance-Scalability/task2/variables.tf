# Define the variable for aws_region
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "env_name" {
  type        = string
  description = "Environment name"
  default     = "dev"
}