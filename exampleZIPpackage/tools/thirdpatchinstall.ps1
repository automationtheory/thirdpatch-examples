# This file MUST be named chocolateyinstall.ps1 or thirdpatchinstall.ps1 and located in the \tools\ subfolder.

<#

The magic happens in this file. This PowerShell is run on package install and upgrade (or if the force install is used). There are companion files (chocolateybeforemodify.ps1 and chocolateyuninstall.ps1) for pre-upgrade and uninstall operations respectively, but we've ommitted them from this example for simplicity.

This file can be used in creative ways to meet a number of use cases. Some ideas to get you started:


* It can be used to install other packages (thus, you can create an MSP or client-specific "meta-package" that installs/updates/configures/etc. everything according to the template)
* The package can contain config files, executable utilities, other PowerShell, etc. that this script can deliver/run on an endpoint
* It can install software 


Some real world examples:
* Install a VPN client and deploy the config file
* Push out office templates to workstations
* Mass deploy custom applications with 1GB+ installers

#>


# ++++++++++++++++++

# This specifies that we want the installation to stop if an error occurs.
$ErrorActionPreference = 'Stop'

# This specifies the package name.
$packageName = 'example-zip-package'

#This specifies the ZIP file included in the "tools" folder. Right now, there is nothing inside of the ZIP folder for the sake of simplicity, but the zip folder can be replaced with real application ZIP.
$zipFile = Join-Path $toolsDir 'example.zip'

# This is the directory where the ZIP contents will be extracted.The "ThirdPatch" and "ExampleZipPackage" folders can be replaced with any other path you want the ZIP contents extracted at. 
$installDir = Join-Path $env:ProgramData 'ThirdPatch\ExampleZipPackage'

#Extract the ZIP file.
Write-Host "$packageName installation started..."

Get-ChocolateyUnzip `
	-FileFullPath $zipFile `
	-Destination $installDir `
	-PackageName $packageName 

Write-Host "$packageName installation successful."

