Write-Verbose "Setting Arguments" -Verbose
$StartDTM = (Get-Date)

$Vendor = "Microsoft"
$Product = "Windows Defender"
$LogPS = "${env:SystemRoot}" + "\Temp\$Vendor $Product PS Wrapper.log"
$Feature = "Windows-Defender*"

Start-Transcript $LogPS

Write-Verbose "Install $Product Features" -Verbose
Get-WindowsFeature -Name $Feature | Install-WindowsFeature

Write-Verbose "Get $Product Features" -Verbose
Get-WindowsFeature $Feature

Write-Verbose "Stop logging" -Verbose
$EndDTM = (Get-Date)
Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalSeconds) Seconds" -Verbose
Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalMinutes) Minutes" -Verbose
Stop-Transcript
