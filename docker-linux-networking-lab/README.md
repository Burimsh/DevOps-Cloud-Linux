# Docker & Linux Networking Lab (Namespaces + NAT)

## Overview
This lab demonstrates Linux networking fundamentals used in real-world
container and cloud environments:

- Network namespaces
- Linux bridges
- veth pairs
- NAT & IP forwarding
- Docker custom networking
- Firewall filtering (iptables)

## Architecture
- Namespace subnet: 10.10.0.0/24
- Docker subnet: 10.10.1.0/24
- Host acts as router + NAT gateway

## Lab Components
- `ns-client` network namespace
- Linux bridge `br-lab`
- Docker network `docker-lab-net`
- Nginx container (`web`)

## Setup
```bash
cd scripts
sudo ./01_create_namespaces.sh
sudo ./02_create_bridge.sh
sudo ./03_connect_veth.sh
sudo ./04_enable_nat.sh
sudo ./05_run_container.sh
