# This file MUST be named chocolateybeforemodify.ps1 or thirdpatchbeforemodify.ps1 and located in the \tools\ subfolder.

	# This file is meant to run before the package gets changed, updated, repaired, or removed. It is responsible for checking whether the installation 	# folder exists.

	# This specifies that we want the process to stop if an error occurs.
		$ErrorActionPreference = 'Stop'

	# This specifies the package name
	$packageName = 'example-zip-package'

	# This is the directory where the ZIP contents were extracted when installed.
		$installDir = Join-Path $env:ProgramData 'ThirdPatch\ExampleZipPackage'

	# Run before the package is modified.
		Write-Host "$packageName before modify has started..."

	# Check if the installation directory exists.
		if (Test-Path $installDir) 
		{
			# Print success message.
			Write-Host "Install directory found. Package can be modified."
		}
		else 
		{
			# Print error message.
			Write-Host "Install directory not found."
		}

	# Print success message.
		Write-Host "$packageName before modify completed successfully."