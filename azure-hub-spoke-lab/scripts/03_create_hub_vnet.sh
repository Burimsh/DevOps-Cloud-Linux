#!/bin/bash

LOCATION="westeurope"

echo "Creating HUB VNet..."

az network vnet create \
  --resource-group rg-hub \
  --name vnet-hub \
  --address-prefix 10.0.0.0/16 \
  --subnet-name subnet-hub \
  --subnet-prefix 10.0.0.0/24 \
  --location $LOCATION

echo "Hub VNet created."
