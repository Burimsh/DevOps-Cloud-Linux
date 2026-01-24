# Azure Hub-and-Spoke Terraform Lab

## Goal
Deploy a hub-and-spoke network architecture in Azure using Terraform.

## Architecture
- Hub VNet: central network with firewall
- Spoke VNet: connected via VNet peering
- VM deployed in spoke for testing connectivity

## Prerequisites
- Azure subscription
- Terraform >= 1.5
- Azure CLI

## Usage
1. `./scripts/01_login.sh` – login to Azure
2. `terraform init`
3. `./scripts/02_create_hub.sh` – deploy hub
4. `./scripts/03_create_spoke.sh` – deploy spoke
5. `./scripts/04_test_connectivity.sh` – test network connectivity

## Notes
- This repo can be pushed to GitHub and reviewed without deploying on Azure.
- Update `<YOUR_SUBSCRIPTION_ID>` in `01_login.sh`.
