# VPC Outputs
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = module.vpc.vpc_cidr
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

# Kubernetes Outputs
output "k8s_master_ip" {
  description = "Public IP of Kubernetes master node"
  value       = module.k8s_cluster.k8s_master_public_ip
}

output "k8s_master_private_ip" {
  description = "Private IP of Kubernetes master node"
  value       = module.k8s_cluster.k8s_master_private_ip
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.k8s_cluster.alb_dns_name
}

output "application_url" {
  description = "URL to access the application"
  value       = "http://${module.k8s_cluster.alb_dns_name}"
}

# RDS Outputs
output "rds_endpoint" {
  description = "RDS database endpoint"
  value       = module.rds.rds_endpoint
}

output "rds_address" {
  description = "RDS database address"
  value       = module.rds.rds_address
}

# Connection Information
output "ssh_command" {
  description = "Command to SSH into Kubernetes master"
  value       = "ssh -i ~/.ssh/devops-capstone-key.pem ubuntu@${module.k8s_cluster.k8s_master_public_ip}"
}

output "kubeconfig_command" {
  description = "Command to get kubeconfig from master"
  value       = "scp -i ~/.ssh/devops-capstone-key.pem ubuntu@${module.k8s_cluster.k8s_master_public_ip}:~/.kube/config ~/.kube/config"
}
