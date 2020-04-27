# Windows-DNS-Additions

# Description
Windows Power Shell Script to allow for the Bulk Addition of DNS Records.

## Environment

Required:
* Windows Remote Server Administration Tools

# Installation

You will need at a minimum the DNS Server tools installed. This feature comes as part of the Remote Server Administration Tools package.

# Usage

The script can be run from the Command Prompt using the following syntax:

	powershell.exe ./Add-DNS-Script.ps1


## CSV Layout

The script assumes that you have created a ".csv" file created using the following header and value format:
	
CSV File Layout:

	ServerName,ServerZone,ServerIP
  	test1,bestpath.io,10.1.1.1
  	test2,bestpath.io,10.1.1.2
  	test3,bestpath.io,10.1.1.3
