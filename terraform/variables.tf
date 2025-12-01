variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-central-1"
}

variable "project_name" {
  description = "Base name for AWS resources"
  type        = string
  default     = "java-task-manager"
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.31"
}

variable "k8s_namespace" {
  description = "Kubernetes namespace for the application"
  type        = string
  default     = "app-java-task-manager"
}

variable "image_tag" {
  description = "Docker image tag to deploy from ECR"
  type        = string
  default     = "latest"
}
