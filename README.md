# ThirdPatch Examples and Templates

## What is ThirdPatch?
ThirdPatch is an RMM-neutral third-party patching solution for MSPs with flat-rate pricing and support for custom applications. Because it works anywhere PowerShell can run, ThirdPatch integrates with multiple RMM platforms, including ConnectWise Automate, Atera, JumpCloud, and others.

## What is a package?
A package is a NuGet file (essentially a ZIP archive) used to install and manage custom applications. By combining reusable components such as install and uninstall scripts, packages provide a simple way to deploy applications a business may need.

For more information on creating and configuring packages, see the ThirdPatch documentation:
https://docs.thirdpartypatching.com/en/creating-packages

This repository provides example packages for different application formats, along with editable templates that can be customized and used with ThirdPatch.

# Example Packages

## ZIP Package

1. The `.nuspec` file contains package metadata, including version, name, and author information. This allows ThirdPatch to identify and deploy the package correctly.

2. The `thirdpatchinstall.ps1` file is required and installs the package by extracting the ZIP file to the desired location. **This file must be named `thirdpatchinstall.ps1` or `chocolateyinstall.ps1` for the package to function properly.**

3. The optional `thirdpatchuninstall.ps1` file manages package removal and cleanup. For ZIP-based packages, it typically removes the installed folder and its contents since ZIP files do not include built-in uninstallers. **This file must be named `thirdpatchuninstall.ps1` or `chocolateyuninstall.ps1` for the package to function properly.**

4. The optional `thirdpatchbeforemodify.ps1` file performs checks before updates, removals, or other modifications. For ZIP packages, it verifies that the installation folder exists, but additional checks can be added as needed.

5. Place the application ZIP file inside the `tools` folder alongside the scripts. Update the ZIP filename references in each script so the package can locate the correct file. For example, replace `"example.zip"` in `thirdpatchinstall.ps1` with your ZIP filename.

---

## MSI Package

1. The `.nuspec` file contains package metadata, including version, name, and author information. This file is the same regardless of application format.

2. The `thirdpatchinstall.ps1` file is required and installs the application by locating and executing the MSI file. **This file must be named `thirdpatchinstall.ps1` or `chocolateyinstall.ps1` for the package to function properly.**

3. The optional `thirdpatchuninstall.ps1` file manages removal and cleanup. For MSI packages, it initiates the uninstall process defined by the MSI. **This file must be named `thirdpatchuninstall.ps1` or `chocolateyuninstall.ps1` for the package to function properly.**

4. The optional `thirdpatchbeforemodify.ps1` file performs checks before updates, removals, or other modifications. Custom checks, such as verifying disk space or dependencies, can be added.

5. Place the MSI file inside the `tools` folder alongside the scripts. Update the MSI filename references in the scripts so the package can locate the correct file. For example, replace `"example.msi"` in `thirdpatchinstall.ps1` with your MSI filename.

---

## EXE Package

1. The `.nuspec` file contains package metadata, including version, name, and author information. This file is the same regardless of application format.

2. The `thirdpatchinstall.ps1` file is required and installs the application by locating and executing the EXE file. **This file must be named `thirdpatchinstall.ps1` or `chocolateyinstall.ps1` for the package to function properly.**

3. The optional `thirdpatchuninstall.ps1` file manages removal and cleanup. For EXE packages, it initiates the uninstall process defined by the application. **This file must be named `thirdpatchuninstall.ps1` or `chocolateyuninstall.ps1` for the package to function properly.**

4. The optional `thirdpatchbeforemodify.ps1` file performs checks before updates, removals, or other modifications. Additional checks, such as verifying disk space or dependencies, can be added as needed.

5. Place the EXE file inside the `tools` folder alongside the scripts. Update the EXE filename references in the scripts so the package can locate the correct file. For example, replace `"example.exe"` in `thirdpatchinstall.ps1` with your EXE filename.

# Templates and Examples

Templates for ZIP, MSI, and EXE packages are available here:

https://github.com/automationtheory/thirdpatch-examples

The repository also includes the example packages referenced above. Template fields that require changes are marked for easier editing, allowing you to download the appropriate package type, customize it, and use it with ThirdPatch once completed.