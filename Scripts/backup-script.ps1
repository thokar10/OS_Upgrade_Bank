# backup-script.ps1

# Define the backup directory
$backupDir = "C:\Backup\SystemBackup"

# Create the backup directory if it does not exist
if (!(Test-Path -Path $backupDir)) {
    New-Item -ItemType Directory -Path $backupDir
}

# Step 1: Backup important files (e.g., SQL database, configuration files)
Write-Host "Backing up critical files..."
Copy-Item -Path "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup" -Destination $backupDir -Recurse
Copy-Item -Path "C:\inetpub\wwwroot" -Destination $backupDir -Recurse

# Step 2: Export system state backup
Write-Host "Backing up system state..."
wbadmin start systemstatebackup -backuptarget:$backupDir

Write-Host "Backup complete."
