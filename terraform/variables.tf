variable "aws_region" {
  description = "La région AWS"
  type        = string
  default     = "us-east-1"  
}

variable "cluster_name" {
  description = "Nom du cluster EKS"
  type        = string
  default     = "mykubernetes" 
}

variable "role_arn" {
  description = "ARN du rôle IAM pour EKS"
  type        = string
  default     = "arn:aws:iam::517718669595:role/LabRole"
}
