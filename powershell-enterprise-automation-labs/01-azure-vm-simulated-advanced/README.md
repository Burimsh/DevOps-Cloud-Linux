# Simulated Azure VM Compliance – Enhanced Local Lab

## Lab Overview

This lab simulates Azure VMs locally using PowerShell.  
It allows you to practice cloud automation concepts **without needing an Azure subscription**.

The lab includes:
- Simulated VMs with properties like PowerState, ResourceGroup, Location, and Tags
- Optional filtering by PowerState (e.g., "VM running", "VM stopped")
- Optional filtering by ResourceGroup (e.g., "rg-dev", "rg-prod")
- Detection of missing tags (Owner, Environment)
- Export of a CSV report

This lab is designed for beginners to intermediate users learning **PowerShell automation** and **report generation**.

---

## Features

| Feature | Description |
|---------|-------------|
| Simulated Azure VMs | Four sample VMs with varying states and tags |
| Filter by PowerState | Optional parameter to include only "VM running" or "VM stopped" |
| Filter by ResourceGroup | Optional parameter to include only a specific resource group |
| Tag Compliance | Detect missing required tags: `Owner` and `Environment` |
| CSV Export | Generates `outputs/vm-simulated-report.csv` |
| Fully Local | No Azure subscription required |

---

## Prerequisites

- PowerShell 7+ installed (Windows, Linux, or WSL)
- Basic familiarity with running PowerShell scripts

**Install PowerShell on Linux (simple method):**

```bash
sudo snap install powershell --classic
pwsh
