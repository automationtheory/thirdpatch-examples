# This file MUST be named thirdpatchbeforemodify.ps1 and located in the \tools\ subfolder.


	# This file is meant to run before the package gets changed, updated, repaired, or removed. It is responsible for checking whether the installation 	# folder exists.

	# This specifies that we want the process to stop if an error occurs.
		$ErrorActionPreference = 'Stop'

	# This specifies the package name
		$packageName = 'YOUR_PACKAGE_NAME'

	# This is the directory where the ZIP contents were extracted when installed in the ProgramData folder of your system.
		$installDir = Join-Path $env:ProgramData 'YOUR_FOLDER_NAME'

	# Run before the package is modified.
		Write-Host "$packageName before modify has started..."

	# This is where custom checks can be implemented before modifying the package.

	# For example, a package may want to stop running applications or services here or ensure there is enough disk space to modify/update the package.
	# This example will test whether the install directory exists.
		if (Test-Path $installDir) 
		{
			Write-Host "Install directory found. Package can be modified."
		}
		else 
		{
			Write-Host "Install directory not found."
		}

	# Print success message.
		Write-Host "$packageName before modify completed successfully."