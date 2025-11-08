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

## 💼 Author
**Séverin Kouemo**  
Cloud & DevOps Enthusiast | AWS Solution Architect (in progress)  
📍 Canada  
🔗 [LinkedIn](https://linkedin.com/in/your-link-here) | [GitHub](https://github.com/your-github-here)

---

## 📜 License
This project is licensed under the [MIT License](LICENSE).
