# This file MUST be named chocolateyuninstall.ps1 or thirdpatchuninstall.ps1 and located in the \tools\ subfolder.

	# This file is responsible for uninstalling the package. It is essentially the inverse of the installation file, and is useful for more in-depth 	# cleanup upon uninstalling the package.


	# This specifies that we want the cleanup to stop if an error occurs.
		$ErrorActionPreference = 'Stop'

	# This specifies the package name.
		$packageName = 'example-zip-package'

	# This is the directory where the ZIP contents were extracted when installed. The 'Thirdpatch\ExampleZipPackage' 
	# can be modified to whatever path you installed the package at. 
		$installDir = Join-Path $env:ProgramData 'ThirdPatch\ExampleZipPackage'

	# Uninstall the ZIP file.
		Write-Host "$packageName cleanup started..."

	# Check if the installation directory exists.
		if (Test-Path $installDir)
		{
			# If it does, then remove everything inside of the 'ThirdPatch\ExampleZipPackage' folder using -Recurse to ensure everything 				# gets deleted properly. 
				Remove-Item $installDir -Recurse -Force

			# Print success message.
				Write-Host "Example ZIP package uninstalled successfully."
		}
		else 
		{
			# Print error message.
				Write-Host "Install directory not found. There is nothing to uninstall."
		}


