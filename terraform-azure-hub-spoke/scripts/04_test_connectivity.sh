#!/bin/bash
hub_ip=$(terraform output -raw hub_subnet_id)
spoke_ip=$(terraform output -raw spoke_vm_ip)

echo "Testing connectivity from hub to spoke"
ssh azureuser@$hub_ip ping -c 3 $spoke_ip
