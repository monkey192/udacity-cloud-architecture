terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}



resource "aws_iam_policy" "lambda_execute_policy" {
  name = "lambda_execute_policy"
  policy = templatefile("./lambda_execute_policy.json",
    {
      aws_region     = data.aws_region.current.id,
      aws_account_id = data.aws_caller_identity.current.account_id
  })
}

resource "aws_iam_role" "lambda_execute_role" {
  name = "lambda_execute_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_execute_role_attachment" {
  role       = aws_iam_role.lambda_execute_role.name
  policy_arn = aws_iam_policy.lambda_execute_policy.arn
}


resource "aws_lambda_function" "greet_lambda" {
  function_name    = "udacity_greet_lambda"
  runtime          = "python3.8"
  handler          = "greet_lambda.lambda_handler"
  timeout          = 10
  memory_size      = 128
  role             = aws_iam_role.lambda_execute_role.arn
  filename         = "greet_lambda.zip"
  source_code_hash = filebase64sha256("greet_lambda.zip")
  environment {
    variables = {
      greeting = "Udacity"
    }
  }
}

data "archive_file" "lambda_function" {
  type        = "zip"
  source_file = "greet_lambda.py"
  output_file_mode = "0666"
  output_path = "greet_lambda.zip"
}