#!/bin/bash

echo "Creating VNet Peering..."

# Hub → Spoke
az network vnet peering create \
  --name hub-to-spoke \
  --resource-group rg-hub \
  --vnet-name vnet-hub \
  --remote-vnet /subscriptions/$(az account show --query id -o tsv)/resourceGroups/rg-spoke/providers/Microsoft.Network/virtualNetworks/vnet-spoke \
  --allow-vnet-access

# Spoke → Hub
az network vnet peering create \
  --name spoke-to-hub \
  --resource-group rg-spoke \
  --vnet-name vnet-spoke \
  --remote-vnet /subscriptions/$(az account show --query id -o tsv)/resourceGroups/rg-hub/providers/Microsoft.Network/virtualNetworks/vnet-hub \
  --allow-vnet-access

echo "VNet peering completed."
