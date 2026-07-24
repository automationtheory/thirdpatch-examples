# This file MUST be named thirdpatchbeforemodify.ps1 and located in the \tools\ subfolder.


	# This file is meant to run before the package gets changed, updated, repaired, or removed.
	
	# If there is an error, this stops the process.
		$ErrorActionPreference = 'Stop'

	# This specifies the package name
		$packageName = 'your-package-name'


	# Run before the package is modified.
		Write-Host "$packageName before modify has started..."

	# This is where custom checks can be implemented before modifying the package.

	# For example, a package may want to stop running applications or services here or ensure there is enough disk space to modify/update the package.

		Write-Host "$packageName can be modified."

		Write-Host "$packageName before modify completed successfully."