# This file MUST be named chocolateyinstall.ps1 or thirdpatchinstall.ps1 and located in the \tools\ subfolder.


	# This file is the installation file for the package. It is responsible for installing the MSI.


	# This specifies that we want the installation to stop if an error occurs.
		$ErrorActionPreference = 'Stop'

	# This specifies the package name.
		$packageName = 'example-msi-package'

	# This specifies the MSI file included in the "tools" folder. It must be replaced with a real application MSI.
		$msiFile = Join-Path $toolsDir 'example.msi'

	# Install the MSI file.
		Write-Host "$packageName installation started..."

		$packageArgs = @{
			packageName = $packageName
			fileType = 'msi'
			file = $msiFile
			# MSI silent install arguments can be updated to other silent arguments found here:
			# Microsoft MSI command-line options:
 			#https://learn.microsoft.com/en-us/windows/win32/msi/standard-installer-command-line-options.
			silentArgs = '/qn /norestart'
			validExitCodes = @(0, 3010)
		} 

	# Install the package.
		Install-ChocolateyInstallPackage @packageArgs

	# Print success message.
		Write-Host "$packageName installation successful."

