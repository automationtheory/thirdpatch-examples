# This file MUST be named chocolateybeforemodify.ps1 or thirdpatchbeforemodify.ps1 and located in the \tools\ subfolder.


	# This file is meant to run before the package gets changed, updated, repaired, or removed.

	# This specifies that we want the process to stop if an error occurs.
		$ErrorActionPreference = 'Stop'

	# This specifies the package name
		$packageName = 'example-exe-package'


	# Run before the package is modified.
		Write-Host "$packageName before modify has started..."

	# This is where custom checks can be implemented before modifying the package.

	# For example, a package may want to stop running applications or services here, or ensure there is enough disk space to modify/update the package.

	# Print message saying the package can be modified, as well as a success message.
		Write-Host "$packageName can be modified."

		Write-Host "$packageName before modify completed successfully."