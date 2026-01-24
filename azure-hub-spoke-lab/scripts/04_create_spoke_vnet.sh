#!/bin/bash

LOCATION="westeurope"

echo "Creating SPOKE VNet..."

az network vnet create \
  --resource-group rg-spoke \
  --name vnet-spoke \
  --address-prefix 10.1.0.0/16 \
  --subnet-name subnet-spoke \
  --subnet-prefix 10.1.0.0/24 \
  --location $LOCATION

echo "Spoke VNet created."
