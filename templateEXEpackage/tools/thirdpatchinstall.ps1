# This file MUST be named chocolateyinstall.ps1 or thirdpatchinstall.ps1 and located in the \tools\ subfolder.



	# This file is the installation file for the package. It is responsible for installing the EXE.


	# This specifies that we want the installation to stop if an error occurs.
		$ErrorActionPreference = 'Stop'

	# This specifies the package name.
		$packageName = 'your_package_name'

	# Define where the tools folder is.
		$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

	# This specifies the EXE file included in the "tools" folder. It can be replaced with a real application EXE.
		$exeFile = Join-Path $toolsDir 'REPLACE_ME.exe'

	# Install the EXE file.
		Write-Host "$packageName installation started..."

		$packageArgs = @{
			packageName = $packageName
			fileType = 'exe'
			file = $exeFile
			# Please ensure you change the silentArgs to the arguments applicable to your EXE, since there are many
			# different silent arguments that can be used depending on who created the EXE.
			silentArgs = '/quiet /norestart'
			validExitCodes = @(0, 3010)
		} 
	
	# Install the package.
		Install-ChocolateyInstallPackage @packageArgs

	# Print success message.
		Write-Host "$packageName installation successful."

