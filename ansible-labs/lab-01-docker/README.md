# Lab 01 – Ansible Basics & Docker Installation

## Overview
This lab demonstrates how to use Ansible to automate the installation and configuration
of Docker Engine on Ubuntu Server virtual machines.

The lab is executed from an Ubuntu Desktop control node using SSH and Ansible playbooks.

## Architecture
- Control Node: Ubuntu Desktop
- Managed Node(s): Ubuntu Server VM(s)
- Automation Tool: Ansible
- Service Installed: Docker Engine

## Requirements
- Ubuntu Desktop with Ansible installed
- Ubuntu Server VM with SSH access
- User `cloudadmin` with passwordless sudo
- SSH key-based authentication configured

## Inventory
The inventory defines the managed nodes and connection details.

