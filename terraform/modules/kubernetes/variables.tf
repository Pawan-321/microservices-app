variable "vpc_id" {
  description = "VPC ID where Kubernetes EC2 will be deployed"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for Kubernetes nodes and ALB"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Private subnet IDs (reserved for future worker nodes)"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type for Kubernetes master node"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name for SSH access"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}
