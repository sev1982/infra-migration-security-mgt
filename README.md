# Simulated Infrastructure Migration and Security Access Management

## 🧩 Project Overview
This project simulates the migration of an on-premises infrastructure to a hybrid cloud environment (AWS + Azure), focusing on secure access management, infrastructure as code (IaC) automation, and compliance with cloud security best practices.  

It is designed as a **hands-on project** to demonstrate practical knowledge in:
- Cloud architecture design (AWS & Azure)
- Terraform for Infrastructure as Code (IaC)
- IAM and Role-based Access Control (RBAC)
- Secure networking and remote state management
- CI/CD and automation pipelines

---

## 🎯 Objectives
- **Simulate an enterprise migration** from on-premises to cloud using Terraform.
- **Deploy secure cloud infrastructure** (VPC, subnets, EC2, S3, Azure VM, etc.).
- **Implement IAM best practices** for users, roles, and policies.
- **Manage Terraform state** securely using remote backends (S3 + DynamoDB + Azure Blob).
- **Enable centralized access logging and monitoring**.
- **Showcase a professional DevOps and Cloud workflow** for your portfolio.

---

## 🧱 Architecture Overview
The project will be deployed in **two environments** (AWS and Azure) to simulate hybrid cloud connectivity and security access management.

### Main Components
- **AWS**
  - VPC with public/private subnets  
  - EC2 instances for web and app tiers  
  - S3 bucket for storage  
  - DynamoDB for remote Terraform state locking  
  - IAM roles, users, and policies

- **Azure**
  - Virtual Network (VNet) and Subnets  
  - Virtual Machine (VM) for app services  
  - Azure Storage Account for backend state  
  - Azure Active Directory integration (optional)

- **Security & Management**
  - Role-Based Access Control (RBAC)
  - Key Management & Secrets handling
  - Logging and Monitoring (CloudWatch / Azure Monitor)

---

## ⚙️ Tools & Technologies
- **Cloud Providers:** AWS, Azure  
- **IaC Tool:** Terraform  
- **Version Control:** Git & GitHub  
- **Automation:** Bash scripts / GitHub Actions  
- **Security:** IAM, RBAC, Secrets Manager  
- **Monitoring:** CloudWatch, Azure Monitor  

---

## 🧪 Project Structure
infra-migration-security-mgt/
│
├── terraform/
│ ├── aws/
│ ├── azure/
│ └── modules/
│
├── scripts/
│ ├── setup_backend.sh
│ ├── user_data.sh
│
├── architecture/
│ └── architecture-diagram.png
│
├── docs/
│ └── project-notes.md
│
└── README.md


---

## 🚀 Deployment Steps
1. Initialize Terraform backend (`terraform init -reconfigure`)
2. Plan the deployment (`terraform plan`)
3. Apply the configuration (`terraform apply`)
4. Validate the deployed infrastructure
5. Test IAM access and secure connectivity

---

# Day 2 — Terraform: Basic AWS Infrastructure Deployment

## Goal
Deploy a minimal but functional AWS environment using Terraform:
- VPC with a public subnet
- Internet Gateway and route table
- One EC2 instance (Apache web server) using `user_data`
- Security Group restricting access
- Terraform remote state stored in S3 with DynamoDB locking

## Files in this folder
- `provider.tf`      : AWS provider configuration
- `backend.tf`       : Terraform S3 backend configuration (remote state)
- `main.tf`          : VPC, subnet, IGW, route table, security group, EC2 resource
- `variables.tf`     : Variables used by the configuration
- `outputs.tf`       : Useful outputs (instance public IP, VPC ID, etc.)
- `user_data.sh`     : Bootstrapping script for the EC2 instance
- `README-day2.md`   : This file

## Prerequisites
- AWS account and AWS CLI configured (`aws configure`)
- Terraform installed (>= 1.4.0 recommended)
- S3 bucket and DynamoDB table created for the Terraform backend:
  - S3 bucket name: `infra-migration-tfstate`
  - DynamoDB table name: `terraform-lock`

You can create them manually or run the `scripts/setup_backend.sh` script.

## Quick start
1. Initialize Terraform (uses S3 backend defined in `backend.tf`):
   ```bash
   cd terraform
   terraform init -reconfigure


## 💼 Author
**Séverin Kouemo**  
Cloud & DevOps Enthusiast | AWS Solution Architect (in progress)  
📍 Canada  
🔗 [LinkedIn](https://linkedin.com/in/your-link-here) | [GitHub](https://github.com/your-github-here)

---

## 📜 License
This project is licensed under the [MIT License](LICENSE).
