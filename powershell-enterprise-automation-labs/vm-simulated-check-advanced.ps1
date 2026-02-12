<#
.SYNOPSIS
Enhanced Simulated Azure VM Compliance Lab (Local Only)

.DESCRIPTION
Simulates Azure VMs locally using PowerShell objects.
Optional filtering by PowerState and ResourceGroup.
Exports CSV report of VM compliance and missing tags.
#>

param (
    [string]$PowerState = "",
    [string]$ResourceGroup = ""
)

# ------------------------
# Simulated VMs
# ------------------------
$vms = @(
    [PSCustomObject]@{ Name="vm-dev-01"; ResourceGroup="rg-dev"; Location="westeurope"; PowerState="VM running"; Owner="Alice"; Environment="Dev" },
    [PSCustomObject]@{ Name="vm-dev-02"; ResourceGroup="rg-dev"; Location="westeurope"; PowerState="VM stopped"; Owner="Bob"; Environment="Dev" },
    [PSCustomObject]@{ Name="vm-prod-01"; ResourceGroup="rg-prod"; Location="westeurope"; PowerState="VM running"; Owner="Charlie"; Environment="Prod" },
    [PSCustomObject]@{ Name="vm-prod-02"; ResourceGroup="rg-prod"; Location="westeurope"; PowerState="VM stopped"; Owner=""; Environment="" }
)

# ------------------------
# Apply filters
# ------------------------
if ($PowerState) {
    $vms = $vms | Where-Object { $_.PowerState -eq $PowerState }
}

if ($ResourceGroup) {
    $vms = $vms | Where-Object { $_.ResourceGroup -eq $ResourceGroup }
}

# ------------------------
# Check missing tags
# ------------------------
$RequiredTags = @("Owner", "Environment")
$Report = @()

foreach ($vm in $vms) {
    $missingTags = @()
    foreach ($tag in $RequiredTags) {
        if (-not $vm.$tag) {
            $missingTags += $tag
        }
    }

    $Report += [PSCustomObject]@{
        VMName        = $vm.Name
        ResourceGroup = $vm.ResourceGroup
        Location      = $vm.Location
        PowerState    = $vm.PowerState
        MissingTags   = $missingTags -join ", "
    }
}

# ------------------------
# Export CSV
# ------------------------
$OutputFile = "./outputs/vm-simulated-report.csv"
$Report | Export-Csv -Path $OutputFile -NoTypeInformation

Write-Host "Simulated VM report created: $OutputFile"
Write-Host "VMs included in report: $($Report.Count)"
