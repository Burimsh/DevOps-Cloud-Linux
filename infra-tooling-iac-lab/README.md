# Infra Tooling IaC Lab – Terraform Module for Virtual Network Interfaces

This lab demonstrates **Infrastructure as Code (IaC)** using Terraform with **environment separation**, **modules**, and **controlled privilege escalation**. It simulates network interface provisioning using `veth` pairs for learning purposes.

---

## 📂 Lab Structure

```text
infra-tooling-iac-lab/
├── modules/
│   └── veth-network/       # Reusable module for veth interface setup
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── environments/
    ├── dev/                # Development environment
    │   ├── main.tf
    │   ├── variables.tf
    │   └── terraform.tfvars
    └── prod/               # Production environment (optional)
        ├── main.tf
        ├── variables.tf
        └── terraform.tfvars
