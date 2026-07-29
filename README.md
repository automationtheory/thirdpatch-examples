# ThirdPatch Templates

## What is ThirdPatch?

ThirdPatch is an RMM-neutral third-party patching solution for MSPs with flat-rate pricing and support for custom applications. Because it works anywhere PowerShell can run, ThirdPatch integrates with multiple RMM platforms, including ConnectWise Automate, Atera, JumpCloud, and others.

## What is a package?

A package is a NuGet file (essentially a ZIP archive) used to install and manage custom applications. By combining reusable components such as install and uninstall scripts, packages provide a simple way to deploy applications a business may need.

For more information on creating and configuring packages, see the ThirdPatch documentation:

https://docs.thirdpartypatching.com/en/creating-packages

This repository provides package templates for different application formats that can be customized and used with ThirdPatch.

# Package Templates

The ZIP, MSI, and EXE templates all use the same basic structure.

1. The `.nuspec` file contains package metadata, including the package name, version, author, and other information used by ThirdPatch to identify and manage the package.

2. The `thirdpatchinstall.ps1` file is required and installs the application. **This file must be named `thirdpatchinstall.ps1` for the package to function properly.**

3. The optional `thirdpatchuninstall.ps1` file manages application removal and cleanup. **This file must be named `thirdpatchuninstall.ps1` if it is included.**

4. The optional `thirdpatchbeforemodify.ps1` file performs checks before updates, removals, or other package modifications. It can be used to verify prerequisites, dependencies, available disk space, or any other conditions required before continuing.  **This file must be named `thirdpatchbeforemodify.ps1` if it is included.**

5. Place the application installer or archive inside the `tools` folder alongside the PowerShell scripts. Update the filename references in the scripts to match your application (for example, replace `template.zip`, `template.msi`, or `template.exe` with the appropriate filename).

## Package-Specific Notes

### ZIP Packages

- The install script extracts the ZIP archive to the desired installation location.
- Because ZIP files do not include uninstall information, `thirdpatchuninstall.ps1` typically removes the installed files and folders.
- **It is important to note where you install the program files when using ZIP file format, as it is required when uninstalling the program**.

### MSI Packages

- The installer must support **silent installation**. Configure the appropriate silent installation arguments in `thirdpatchinstall.ps1`. The template includes a clearly marked section indicating where these arguments should be added.
- The uninstall script typically launches the uninstall process provided by the MSI.

### EXE Packages

- The installer must support **silent installation**. Configure the appropriate silent installation arguments in `thirdpatchinstall.ps1`. The template includes a clearly marked section indicating where these arguments should be added.
- If an uninstall script is included, configure it to run the application's silent uninstall command.

# Templates

Templates for ZIP, MSI, and EXE packages are available here:

https://github.com/automationtheory/thirdpatch-examples

The repository contains templates for each package type. Template fields that require changes are marked for easier editing, allowing you to download the appropriate package format, customize it, and use it with ThirdPatch once completed.
