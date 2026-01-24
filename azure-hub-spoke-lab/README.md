# Azure Hub-and-Spoke Networking Lab

## Overview
This lab demonstrates an Azure Hub-and-Spoke network topology using Azure CLI.
It includes:
- Hub VNet
- Spoke VNet
- VNet Peering
- VM deployment in Spoke network

## Architecture
- Hub VNet: 10.0.0.0/16
- Spoke VNet: 10.1.0.0/16
- Bidirectional VNet peering

## Prerequisites
- Azure subscription
- Azure CLI installed
- Bash shell

## Deployment Steps
```bash
cd scripts
./01_login.sh
./02_create_resource_groups.sh
./03_create_hub_vnet.sh
./04_create_spoke_vnet.sh
./05_vnet_peering.sh
./06_deploy_spoke_vm.sh
./07_test_connectivity.sh
