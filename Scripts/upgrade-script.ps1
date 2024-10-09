# upgrade-script.ps1

# Define the URL for downloading the Windows Upgrade Assistant
$upgradeAssistantUrl = "http://example.com/windows-upgrade-assistant"
$upgradeAssistantPath = "C:\UpgradeAssistant.exe"

# Step 1: Download the Windows Upgrade Assistant
Write-Host "Downloading the Windows Upgrade Assistant..."
Invoke-WebRequest -Uri $upgradeAssistantUrl -OutFile $upgradeAssistantPath

# Step 2: Run the Windows Upgrade Assistant
Write-Host "Running the Windows Upgrade Assistant..."
Start-Process -FilePath $upgradeAssistantPath -ArgumentList "/quiet" -Wait

# Step 3: Stop critical services before OS upgrade (e.g., SQL Server, IIS)
Write-Host "Stopping critical services..."
Stop-Service -Name "MSSQLSERVER" -Force
Stop-Service -Name "W3SVC" -Force

# Step 4: Start the OS upgrade process
Write-Host "Starting the OS upgrade process..."
Start-Process -FilePath "C:\Windows10Upgrade\Setup.exe" -ArgumentList "/auto upgrade /quiet" -Wait

# Step 5: Restart the system to complete the OS upgrade
Write-Host "Restarting the system to complete the OS upgrade..."
Restart-Computer -Force
