# Configuration du provider AWS
provider "aws" {
  region = "eu-west-1"
}

# Création d'un cluster Kubernetes EKS
resource "aws_eks_cluster" "infoline_cluster" {
  name     = "infoline-cluster"
  role_arn = "arn:aws:iam::123456789012:role/eks-role"
}

# Fonction Lambda pour authentification
resource "aws_lambda_function" "auth_function" {
  function_name = "infoline-auth"
  runtime       = "java17"
  handler       = "com.infoline.AuthHandler"
  role          = "arn:aws:iam::123456789012:role/lambda-role"
}
