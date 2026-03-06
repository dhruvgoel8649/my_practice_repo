# DevOps Assessment - Full Stack Application

## Architecture
- **Backend**: Django 6.0 REST API
- **Frontend**: React (Vite + TypeScript)
- **Infrastructure**: AWS EC2, ECR
- **IaC**: Terraform
- **CI/CD**: GitHub Actions

## Prerequisites
- AWS Account with credentials
- GitHub repository
- EC2 Key Pair created in AWS

## GitHub Secrets Required
```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
EC2_KEY_NAME (name of your EC2 key pair)
EC2_SSH_KEY (private key content)
```

## Local Development
```bash
# Copy environment file
cp .env.example .env

# Run with docker-compose
docker-compose up --build

# Access
Frontend: http://localhost
Backend: http://localhost:8000/api/hello/
```

## Deployment Flow
1. Push to `main` branch
2. GitHub Actions triggers
3. Terraform provisions AWS infrastructure
4. Docker images built and pushed to ECR
5. EC2 pulls images and runs containers
6. Application accessible via EC2 public IP

## Manual Terraform
```bash
cd terraform
terraform init
terraform apply -var="key_name=YOUR_KEY_NAME"
```

## Architecture Diagram
```
GitHub → Actions → ECR
                    ↓
         Terraform → EC2 → [Backend + Frontend]
```

## Endpoints
- Frontend: `http://<EC2_IP>`
- Backend API: `http://<EC2_IP>:8000/api/hello/`
