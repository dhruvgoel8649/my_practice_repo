# Quick Start Guide

## 1. Local Testing (5 minutes)
```bash
# Windows
setup.bat

# Linux/Mac
docker-compose up --build
```
Access: http://localhost

## 2. AWS Deployment Setup

### Step 1: Create EC2 Key Pair
```bash
aws ec2 create-key-pair --key-name devops-key --query 'KeyMaterial' --output text > devops-key.pem
```

### Step 2: Configure GitHub Secrets
Go to: Repository → Settings → Secrets and variables → Actions

Add these secrets:
- `AWS_ACCESS_KEY_ID`: Your AWS access key
- `AWS_SECRET_ACCESS_KEY`: Your AWS secret key
- `EC2_KEY_NAME`: `devops-key`
- `EC2_SSH_KEY`: Content of `devops-key.pem`

### Step 3: Deploy
```bash
git add .
git commit -m "Initial deployment"
git push origin main
```

### Step 4: Monitor
- Go to GitHub Actions tab
- Watch the deployment progress
- Get EC2 IP from workflow output

## 3. Access Application
```
http://<EC2_PUBLIC_IP>
```

## Troubleshooting

### Local Issues
```bash
docker-compose logs backend
docker-compose logs frontend
```

### AWS Issues
- Check GitHub Actions logs
- Verify AWS credentials
- Ensure EC2 key pair exists
- Check security group rules

## Architecture
```
Developer → GitHub → Actions
                       ↓
                   [Build Images]
                       ↓
                      ECR
                       ↓
                   [Terraform]
                       ↓
                      EC2
                       ↓
              [Backend + Frontend]
```

## Cleanup
```bash
cd terraform
terraform destroy -var="key_name=devops-key"
```
