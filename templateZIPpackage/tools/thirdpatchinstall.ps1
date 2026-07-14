# This file MUST be named thirdpatchinstall.ps1 and located in the \tools\ subfolder.

	# This file is the installation file for the package. It is responsible for installing the ZIP file.

	# This specifies that we want the installation to stop if an error occurs.
		$ErrorActionPreference = 'Stop'

	# This specifies the package name.
		$packageName = 'your-package-name'

	# Define where the tools folder is.
		$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

	# This specifies the ZIP file included in the "tools" folder.
		$zipFile = Join-Path $toolsDir 'REPLACE_ME.zip'

	# This is the directory where the ZIP contents will be extracted.The 'YOUR_FOLDER_HERE\ExampleZipPackage' folders can be replaced with any other path 	# you want the ZIP contents extracted at. 
		$installDir = Join-Path $env:ProgramData 'YOUR_FOLDER_NAME\ExampleZipPackage'

	# Extract the ZIP file.
	Write-Host "$packageName installation started..."

		Install-ThirdPatchZipPackage `
			-PackageName $packageName `
			-File $zipFile `
			-UnzipLocation $installDir 

	# Print success message.
	Write-Host "$packageName installation successful."

