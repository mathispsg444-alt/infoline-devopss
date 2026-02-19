resource "aws_iam_role" "lambda_role" {
  name = "infoline_lambda_role"

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

resource "aws_lambda_function" "login" {
  function_name = "infoline-login"
  runtime       = "java17"
  handler       = "com.infoline.LoginHandler"
  role          = aws_iam_role.lambda_role.arn
  filename      = "lambda.zip"
  source_code_hash = filebase64sha256("lambda.zip")
}
