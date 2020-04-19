function Create-External-Switch {
    $ExternalSwitches = Get-VMSwitch -SwitchType External
    if ($ExternalSwitches -eq $null) {
    
        # Identify the phusical Network adapter
        $NetAdapter = Get-NetAdapter -Physical
        if ($null -eq $NetAdapter) {
            Write-Error "No Physical Network Adapter Found...Aborting"
            return $false
        }

        # Check if external switch is already created
        $ExternalSwitchName = "ExternalSwitch"

        # Create a new External Switch
        New-VMSwitch -name $ExternalSwitchName  -NetAdapterName $NetAdapter -AllowManagementOS $true
    }
    else {
    
    }
}


