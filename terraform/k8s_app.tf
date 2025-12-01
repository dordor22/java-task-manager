locals {
  app_labels = {
    app = "java-task-manager"
  }

  app_image = "${aws_ecr_repository.task_api.repository_url}:${var.image_tag}"
}

resource "kubernetes_namespace" "app" {
  metadata {
    name = var.k8s_namespace
  }
}

resource "kubernetes_deployment" "java_task_manager" {
  metadata {
    name      = "java-task-manager"
    namespace = kubernetes_namespace.app.metadata[0].name
    labels    = local.app_labels
  }

  spec {
    replicas = 2

    selector {
      match_labels = local.app_labels
    }

    template {
      metadata {
        labels = local.app_labels
      }

      spec {
        container {
          name  = "java-task-manager"
          image = local.app_image

          port {
            container_port = 8080
          }

          resources {
            requests = {
              cpu    = "100m"
              memory = "256Mi"
            }

            limits = {
              cpu    = "500m"
              memory = "512Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "java_task_manager" {
  metadata {
    name      = "java-task-manager"
    namespace = kubernetes_namespace.app.metadata[0].name
  }

  spec {
    selector = local.app_labels

    port {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}
