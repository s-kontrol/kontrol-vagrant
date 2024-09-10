# Initialize and format disk G
$disk_g = Get-Disk -Number 1
if ($disk_g.PartitionStyle -eq "RAW")
{
    $disk_g | Initialize-Disk -PartitionStyle GPT -PassThru
} else
{
    Write-Output "Will NOT initialize disk. Disk 1 already initialized"
}
if (-Not (Get-Partition -DriveLetter g -ErrorAction SilentlyContinue | Get-Volume | Select-Object -ExpandProperty FileSystemType) -eq "NTFS")
{
    New-Partition -DriveLetter g -UseMaximumSize -DiskNumber 1
    Format-Volume -DriveLetter g -FileSystem NTFS -NewFileSystemLabel "data" -Confirm:$false
} else
{
    Write-Output "Will NOT format disk. Volume g already exists"
}

# Enable RDP
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# Create bootstrap directories. If they already exist, do nothing.
$directories = @(
    "G:\Accela\",
    "G:\download\",
    "G:\ACA\",
    "G:\ACA\current\"
)

$directories | ForEach-Object {
    New-Item -Type Directory -Path $_ -ErrorAction SilentlyContinue -Verbose
}

## Check if .NET Framework 4.8 is installed. If not, install Chocolatey 2.0.0
#Install-WindowsFeature -Name Web-Server -IncludeManagementTools
#$dotNetVersion = Get-ItemPropertyValue -Path "HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" -Name Version -ErrorAction SilentlyContinue
#
#if ($dotNetVersion -eq "4.8.0") {
#    Write-Output ".NET Framework 4.8 is installed."
#    $env:chocolateyVersion = "2.0.0"
#    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
#    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
#}
#else {
#    Write-Output ".NET Framework 4.8 is not installed. Installing Chocolatey 2.0.0."
#    $env:chocolateyVersion = "2.0.0"
#    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
#    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
#}
#
## Download and install PowerShell 7.3.7
#Write-Output "Installing Powershell 7.3.7"
#Invoke-WebRequest -Uri "https://github.com/PowerShell/PowerShell/releases/download/v7.3.7/PowerShell-7.3.7-win-x64.msi" -OutFile "PowerShell-7.3.7-win-x64.msi" -UseBasicParsing
#msiexec.exe /package .\PowerShell-7.3.7-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1 ADD_PATH=1
