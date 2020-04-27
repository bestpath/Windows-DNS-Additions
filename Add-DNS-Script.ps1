#powershell.exe ./Add-DNS-Script.ps1
#
# Windows PowerShell Script to ad multiple Windows DNS Entries on remote Server 
#
# Author: BestPath <info@bestpath.io>
# Version: 0.1
# Date: 27-04-2020
#



$yesNo = Read-Host -Prompt 'Have you Created a CSV File? 

EXAMPLE : 

ServerName,ServerZone,ServerIP
test1,bestpath.io,10.1.1.1
test2,bestpath.io,10.1.1.2
test3,bestpath.io,10.1.1.3


Y/N: '

#Insert your DNS Server Name or IP address into this variable

$TargetDnsServer = "ENTER-DNS-SERVER-NAME"

#Debugging Option
#Write-Host $TargetDnsServer

do {

Function Get-FileName($initialDirectory)
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = $initialDirectory
    $OpenFileDialog.filter = "CSV (*.csv)| *.csv"
    $OpenFileDialog.ShowDialog() | Out-Null
    $OpenFileDialog.filename
}


$FileName = Get-Filename

#Debugging Option
#Write-Host $FileName

$DNSRecords = Import-Csv $FileName

ForEach ($ARecord in $DNSRecords){ 
$ServerDnsName = $($ARecord.ServerName)
$ServerDnsIP = $($ARecord.ServerIP)
$ServerDnsZone = $($ARecord.ServerZone)

Add-DnsServerResourceRecordA -ComputerName $TargetDnsServer -Name $ServerDnsName" -ZoneName $ServerDnsZone -IPv4Address $ServerDnsIP -CreatePtr

Write-Host "Successfully Added FQDN" $ServerDnsName"."$ServerDnsZone "IP Address" $ServerDnsIP}
} until ($yesNo -eq "Y" -or "y")