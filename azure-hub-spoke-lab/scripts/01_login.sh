#!/bin/bash

echo "Logging into Azure..."
az login

echo "Active subscription:"
az account show --output table
