# This file MUST be named chocolateyuninstall.ps1 or thirdpatchuninstall.ps1 and located in the \tools\ subfolder.

	# This file is responsible for uninstalling the package. It is essentially the inverse of the installation 	# file, and is useful for more in-depth cleanup upon uninstalling the package.

	# This specifies that we want the cleanup to stop if an error occurs.
		$ErrorActionPreference = 'Stop'

	# This specifies the package name.
		$packageName = 'example-msi-package'

	#This specifies the MSI file included in the "tools" folder.
	# Replace example.msi with the real application MSI.
		$msiFile = Join-Path $toolsDir 'example.msi'


	#Uninstall the MSI package.
		Write-Host "$packageName cleanup started..."

	# Check if the MSI file exists.
		if (Test-Path $msiFile) 
		{
			$packageArgs = @{
				packageName = $packageName
				fileType = 'msi'
				file = $msiFile
				# MSI silent uninstall arguments.
				silentArgs = '/qn /norestart'
				validExitCodes = @(0, 3010)
			}

		# Uninstall the package.
			Uninstall-ChocolatelyPackage @packageArgs
		# Print success message.
			Write-Host "$packageName uninstalled successfully."
		}
		else 
		{
			# Print error message.
			Write-Host "MSI file not found."
		}


