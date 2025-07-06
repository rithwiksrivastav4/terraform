# Terraform Infrastructure Setup

This repository contains Terraform configurations for provisioning and managing cloud infrastructure using Infrastructure as Code (IaC) principles.

## 📌 Project Overview

This project leverages [Terraform](https://www.terraform.io/) to automate the deployment and configuration of infrastructure resources. It is designed to be modular, reusable, and scalable across different environments like development, staging, and production.

## 🛠️ Features

- Infrastructure as Code using Terraform  
- Modular and reusable Terraform components  
- Supports multiple environments (dev, staging, prod)  
- Easy initialization, planning, and deployment  
- Version-controlled infrastructure changes  

## 📁 Directory Structure

```plaintext
terraform/
├── main.tf              # Main configuration file
├── variables.tf         # Input variables
├── outputs.tf           # Output values
├── terraform.tfvars     # Variable assignments
├── providers.tf         # Provider configurations (e.g., AWS, Azure, etc.)
├── modules/             # Custom reusable modules
│   ├── vpc/
│   ├── ec2/
│   └── s3/
├── environments/        # Environment-specific configurations
│   ├── dev/
│   ├── staging/
│   └── prod/
```


## ✅ Prerequisites

- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads) v1.0 or higher  
- Cloud provider CLI (e.g., AWS CLI, Azure CLI, etc.)  
- Access credentials and permissions for your cloud provider  
- Git installed on your system  

## 🚀 Getting Started

Follow these steps to deploy infrastructure using this repo.

### 1. Clone the repository

```bash
git clone https://github.com/rithwiksrivastav4/terraform.git
cd terraform
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Review the execution plan

```bash
terraform plan
```

### 4. Apply the infrastructure changes

```bash
terraform apply
```

### 5. Destroy infrastructure (optional)

```bash
terraform destroy
```

### 🔧 Configuration
Customize input values using:

terraform.tfvars file

Inline command flags (e.g., -var="key=value")

Environment variables (e.g., TF_VAR_key=value)

### Example: terraform.tfvars

```hcl
region        = "us-east-1"
instance_type = "t2.micro"
environment   = "dev"
```

### 📦 Modules Included
The repo includes reusable modules:

vpc – Create a Virtual Private Cloud

ec2 – Launch EC2 compute instances

s3 – Provision S3 storage buckets

### 🧪 Environment Support
* Create separate configurations for each environment under environments/:

```plaintext
environments/
├── dev/
├── staging/
└── prod/
```
Each environment can have its own state file, variables, and module configurations.

### 📜 License
This project is licensed under the MIT License.

### 🙋‍♂️ Support
Feel free to open an issue for bugs or feature requests.

### Made with ❤️ using Terraform
