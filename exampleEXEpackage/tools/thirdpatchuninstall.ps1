# This file MUST be named chocolateyuninstall.ps1 or thirdpatchuninstall.ps1 and located in the \tools\ subfolder.

	# This file is responsible for uninstalling the package. It is essentially the inverse of the installation file, and is useful for more in-depth 	# cleanup upon uninstalling the package.

	# This specifies that we want the cleanup to stop if an error occurs.
		$ErrorActionPreference = 'Stop'

	# This specifies the package name.
		$packageName = 'example-exe-package'

	# This is an example uninstall path.
	# Replace this with the real application's uninstall path.
		$uninstallerFile = Join-Path $env:ProgramFiles 'ExampleApplication\uninstall.exe'

	#Uninstall the EXE package.
		Write-Host "$packageName cleanup started..."

	# Check if the uninstaller file exists.
		if (Test-Path $uninstallerFile) 
		{
			$packageArgs = @{
				packageName = $packageName
				fileType = 'exe'
				file = $uninstallerFile
				# Update the silentArgs to match the EXE uninstaller used.
				silentArgs = '/quiet /norestart'
				validExitCodes = @(0, 3010)
			}
		# Uninstall the package.
			Uninstall-ChocolatelyPackage @packageArgs

		# Print success message.
			Write-Host "$packageName uninstalled successfully."
		}
		else 
		{
			Write-Host "Uninstaller not found."
		}


