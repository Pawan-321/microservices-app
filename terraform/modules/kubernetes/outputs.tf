output "k8s_master_id" {
  description = "ID of the Kubernetes master instance"
  value       = aws_instance.k8s_master.id
}

output "k8s_master_public_ip" {
  description = "Public IP of the Kubernetes master"
  value       = aws_instance.k8s_master.public_ip
}

output "k8s_master_private_ip" {
  description = "Private IP of the Kubernetes master"
  value       = aws_instance.k8s_master.private_ip
}

output "k8s_security_group_id" {
  description = "ID of the Kubernetes security group"
  value       = aws_security_group.k8s_master.id
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.main.dns_name
}

output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.main.arn
}

output "alb_zone_id" {
  description = "Zone ID of the Application Load Balancer"
  value       = aws_lb.main.zone_id
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.frontend.arn
}
