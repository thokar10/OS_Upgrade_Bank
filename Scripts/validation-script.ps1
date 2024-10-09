# validation-script.ps1

Write-Host "Validating system post-upgrade..."

# Step 1: Check if SQL Server is running
$sqlService = Get-Service -Name "MSSQLSERVER"
if ($sqlService.Status -eq 'Running') {
    Write-Host "SQL Server is running."
} else {
    Write-Host "ERROR: SQL Server is not running!"
}

# Step 2: Check if IIS (Internet Information Services) is running
$webService = Get-Service -Name "W3SVC"
if ($webService.Status -eq 'Running') {
    Write-Host "IIS is running."
} else {
    Write-Host "ERROR: IIS is not running!"
}

# Step 3: System resource usage (CPU, memory)
$cpuUsage = Get-Counter '\Processor(_Total)\% Processor Time'
$memoryUsage = Get-Counter '\Memory\Available MBytes'

Write-Host "CPU Usage: " $cpuUsage.CounterSamples.CookedValue "%"
Write-Host "Available Memory: " $memoryUsage.CounterSamples.CookedValue " MB"

Write-Host "Validation complete."
