#!/bin/bash

echo "Listing VNet peerings (Hub):"
az network vnet peering list \
  --resource-group rg-hub \
  --vnet-name vnet-hub \
  --output table

echo "Listing VNet peerings (Spoke):"
az network vnet peering list \
  --resource-group rg-spoke \
  --vnet-name vnet-spoke \
  --output table
