#!/bin/bash

LOCATION="westeurope"

echo "Creating resource groups..."

az group create \
  --name rg-hub \
  --location $LOCATION

az group create \
  --name rg-spoke \
  --location $LOCATION

echo "Resource groups created."
