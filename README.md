1. Clone Repository
git clone https://github.com/Pawan-321/microservices-app.git
cd microservices-app

2. Create SSH Key Pair
aws ec2 create-key-pair \
    --key-name <name>\
    --query 'KeyMaterial' \
    --output text > ~/.ssh/<name>.pem

chmod 400 ~/.ssh/<name>.pem

3. Configure Terraform Variables
cd terraform/environments/dev

# Create terraform.tfvars
cat > terraform.tfvars <<EOF
aws_region    = "ap-south-1"
environment   = "dev"
key_name      = "name"
db_username   = "dbadmin"
db_password   = "YourSecurePassword123!"
EOF
4. Deploy Infrastructure
# Initialize Terraform
terraform init

# Review the plan
terraform plan

# Deploy infrastructure
terraform apply -auto-approve

# Save outputs
terraform output > outputs.txt
5. Access Kubernetes Cluster
# Get master node IP from outputs
K8S_MASTER_IP=$(terraform output -raw k8s_master_ip)

# SSH to Kubernetes master
ssh -i ~/.ssh/<name>.pem ubuntu@$K8S_MASTER_IP

# Verify cluster status
kubectl get nodes
kubectl get pods --all-namespaces


🔄 CI/CD Pipeline
![cicd-architecture](https://github.com/user-attachments/assets/1a9dcd1a-a9c1-48e4-9f6f-12fd6aaea996)


📊 Monitoring & Observability
Prometheus + Grafana Setup
# SSH to Kubernetes master
ssh -i ~/.ssh/<name>.pem ubuntu@ip

# Add Prometheus Helm repository
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Create monitoring namespace
kubectl create namespace monitoring

#screenshots
<img width="1920" height="1080" alt="Screenshot 2026-02-03 172102" src="https://github.com/user-attachments/assets/cd3c6af3-8465-4501-8d0b-6bd135a3a766" />

 #grafana
 <img width="1920" height="1080" alt="Screenshot 2026-02-03 172259" src="https://github.com/user-attachments/assets/8a8be8ea-ad10-40ff-819d-e88dc91644b6" />

 #prometheus
 <img width="1920" height="1080" alt="Screenshot 2026-02-03 172446" src="https://github.com/user-attachments/assets/319d918d-0301-4302-9614-e9babef31170" />

#ci/cd deployment
<img width="1920" height="1080" alt="Screenshot 2026-02-03 172545" src="https://github.com/user-attachments/assets/c3143da6-7488-4925-a955-29f1b34cb96b" />

 


