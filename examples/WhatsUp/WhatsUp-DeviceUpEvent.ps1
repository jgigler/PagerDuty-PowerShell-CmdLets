﻿# Resolve Event
# 
# Add in the "Action Library" in WhatsUp
# Make sure you run "Set-ExecutionPolicy RemoteSigned" on the x86 version of PowerShell as this is what WhatsUp uses.

$DeviceDisplayName = "%Device.DisplayName"
$DeviceState = "%Device.State"

. C:\WhatsUpScripts\PagerDuty\PagerDutyCmdLets.ps1

try
{
    $resultText = Send-PagerDutyEvent -Resolve -ServiceKey 1111111111111111111111111 -Description ('WhatsUp Sydney - ' + $DeviceDisplayName + ' is ' + $DeviceState) -IncidentKey $DeviceDisplayName
    $resultText = $resultText.Status

    $actionResult = 0
}

catch
{
    $resultText = $_.Exception.Message
    $actionResult = 1
}

finally
{
    $Context.SetResult($actionResult, $resultText)
}