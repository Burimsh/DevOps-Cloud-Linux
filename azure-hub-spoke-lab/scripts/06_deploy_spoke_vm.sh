#!/bin/bash

LOCATION="westeurope"
ADMIN_USER="azureuser"

echo "Deploying VM in SPOKE VNet..."

az vm create \
  --resource-group rg-spoke \
  --name vm-spoke \
  --image Ubuntu2204 \
  --size Standard_B1s \
  --admin-username $ADMIN_USER \
  --generate-ssh-keys \
  --vnet-name vnet-spoke \
  --subnet subnet-spoke \
  --location $LOCATION

echo "VM deployed."
