# This file MUST be named thirdpatchuninstall.ps1 and located in the \tools\ subfolder.


	# This file is responsible for uninstalling the package. It is essentially the inverse of the installation file, and is useful for more in-depth 	# cleanup upon uninstalling the package.


	# This specifies that we want the cleanup to stop if an error occurs.
		$ErrorActionPreference = 'Stop'

	# This specifies the package name.
		$packageName = 'YOUR_PACKAGE_NAME'
	
	# Find the installation directory. This should be where you installed it in the ProgramData folder of your system.
	$InstallDir = Join-Path $env:ProgramData 'PROGRAM_FOLDER_NAME'

	# This specifies the ZIP file name. MUST match the ZIP file name used by thirdpatchinstall.ps1 file.
		$zipFileName = 'REPLACE_ME.zip'

	# Print message to start uninstalling the ZIP file.
		Write-Host "$packageName cleanup started..."

	# Uninstall the ZIP file (This method uninstalls the ZIP contents specifically).
		# Uninstall-ThirdPatchZipPackage `
			# -PackageName $packageName `
			# -ZipFileName $zipFileName
	# Uninstall the ZIP file (This method removes everything inside of a folder).
		
		if (Test-Path $installDir) {
			Remove-item -Path $installDir -Recurse -Force
			Write-Host "Removed install directory: $installDir"
		}
		else {
			Write-Host "Install directory not found."
		}
		Write-Host "$packageName uninstalled successfully."
		


