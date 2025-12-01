output "ecr_repository_url" {
  description = "ECR repository URL for pushing Docker images"
  value       = aws_ecr_repository.task_api.repository_url
}

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_region" {
  description = "AWS region of the EKS cluster"
  value       = var.aws_region
}

output "eks_cluster_arn" {
  description = "EKS cluster ARN"
  value       = module.eks.cluster_arn
}

output "k8s_namespace" {
  description = "Namespace where the app is deployed"
  value       = var.k8s_namespace
}

output "k8s_service_name" {
  description = "Kubernetes Service name for the app"
  value       = kubernetes_service.java_task_manager.metadata[0].name
}
