# Azure Hub-Spoke Terraform Lab

## Overview
This lab demonstrates a production-style Azure Hub-Spoke network using Terraform.

## Architecture
- Hub VNet (10.0.0.0/16)
- Spoke VNet (10.1.0.0/16)
- Frontend subnet (public VM)
- Backend subnet (private VM)
- VNet peering
- Modular Terraform design

## Prerequisites
- Azure Subscription
- Azure CLI
- Terraform
- SSH key (~/.ssh/id_rsa.pub)

## Usage
```bash
az login
terraform init
terraform plan
terraform apply
