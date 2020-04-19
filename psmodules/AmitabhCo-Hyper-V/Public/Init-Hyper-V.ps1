# Define external switch name
$ExternalSwitchName = "ExternalVirtualSwitch"

function New-External-Switch {

    # If the switch does not exists then create it
    $ExternalSwitches = Get-VMSwitch -SwitchType External
    if ($null -eq $ExternalSwitches) {
    
        # Identify the physical Network adapter
        $NetAdapter = Get-NetAdapter -Physical
        if ($null -eq $NetAdapter) {
            Write-Error "No Physical Network Adapter Found...Aborting"
            return $false
        }

        # Check if external switch is already created
        

        # Create a new External Switch
        New-VMSwitch -name $ExternalSwitchName  -NetAdapterName $NetAdapter -AllowManagementOS $true
    }

    # If the switch is already created and if it is not with the same name
    # then delete it and re-create it or try to rename it
    else {
    
    }
}

Export-ModuleMember -Variable $ExternalSwitchName
Export-ModuleMember -Function New-External-Switch



