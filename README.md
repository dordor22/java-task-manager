# 🚀 *Java Task Manager*

A clean end-to-end *DevOps + Backend* project built with **Java 17**, **Spring Boot**, **Docker**, **k3s Kubernetes**, **Terraform IaC** and **GitHub Actions CI**.

The project contains:
- Java Spring Boot REST API  
- Docker containerization  
- Local Kubernetes deployment using k3s  
- GitHub Actions CI pipeline  
- Complete AWS infrastructure defined with Terraform (VPC, ECR, EKS, and Kubernetes objects)

---

## ⭐ *Project Overview*

The **Java Task Manager** exposes a simple REST API for creating and listing tasks.  
It is fully containerized and can run locally inside a Kubernetes cluster, or theoretically be deployed to AWS using the included Terraform infrastructure.

This project demonstrates:
- Java backend development  
- REST API structure  
- Docker multi-stage builds  
- Local Kubernetes deployment  
- Infrastructure as Code with Terraform  
- CI automation with GitHub Actions  

---

## 🏗️ *Architecture*

```
Java Task Manager
│
├─ Spring Boot Backend
├─ Dockerfile
├─ k3s deployment (local kubernetes)
└─ terraform/
     ├─ VPC
     ├─ ECR
     ├─ EKS
     └─ Kubernetes deployment & service
```

---

## 📁 *Repository Structure*

```
java-task-manager/
│
├─ src/
├─ pom.xml
│
├─ Dockerfile
├─ .dockerignore
│
├─ k8s/
│   ├─ deployment.yaml
│   └─ service.yaml
│
├─ terraform/
│   ├─ main.tf
│   ├─ variables.tf
│   ├─ vpc.tf
│   ├─ eks.tf
│   ├─ ecr.tf
│   ├─ k8s_provider.tf
│   ├─ k8s_app.tf
│   └─ outputs.tf
│
└─ .github/workflows/
    └─ ci.yml
```

---

## ⚙️ *Backend - Spring Boot API*

Main endpoints:

```
GET /api/tasks
POST /api/tasks
```

The service keeps tasks in memory and provides a small, clean REST interface.

---

## 🐳 *Docker*

Multi-stage build:

```
docker build -t java-task-manager:latest .
docker run -p 8080:8080 java-task-manager:latest
```

---

## ☸️ *Local Kubernetes - k3s*

```
kubectl apply -f k8s/
kubectl port-forward svc/java-task-manager 8080:80
```

Access:

```
http://localhost:8080/api/tasks
```

---

## ☁️ *Terraform - AWS Infrastructure (IaC)*

The project includes full AWS infrastructure definition using Terraform:

- VPC with public and private subnets  
- ECR repository for container images  
- EKS cluster with a managed node group  
- Kubernetes namespace, deployment and service (applied through Terraform)

Terraform files describe the full cloud environment, allowing the application to be deployed to AWS using one command in the future.

---

## 🔄 *Continuous Integration - GitHub Actions*

A CI workflow runs automatically on every push and pull request to:

- Checkout the repository  
- Set up Java 17  
- Build the project with Maven  

This ensures the application compiles successfully for every change pushed to the repository.

---

## 🎯 *Summary*

This repository brings together backend development, containerization, Kubernetes orchestration, Infrastructure as Code, and CI automation.  
It serves as a complete and well-structured example of modern DevOps practices applied to a Java application.

