# ThirdPatch Examples and Templates

## What is ThirdPatch?
ThirdPatch is an RMM-neutral solution for MSP third-party patching with flat-rate pricing and support for custom applications. ThirdPatch is compatible anywhere Powershell can run, meaning it has ecosystem integrations with a number of RMMs including ConnectWise Automate, Atera, JumpCloud, and more!

## What is a package?
A package is a NuGet file (essentially a ZIP file of sorts), that can install and manage custom applications. By combining basic reusable components like install and uninstall files, a package becomes a quick way to disburse and install custom applications that a business may need. To learn more about packages and how they are created and configured, please refer to the ThirdPatch docs located at: https://docs.thirdpartypatching.com/en/creating-packages. 

The purpose of this repository is to provide some example packages based on different application formats, as well as corresponding template files that work with ThirdPatch that you can simply edit and use!

## Example Packages:

### ZIP package:
1. The first element of a package to consider is the .nuspec file. This file contains all of the metadata for the package, such as its version number, package name, and author information. This is pertinent information as it allows the package to be identified and rolled-out correctly.
(Insert ZIP .nuspec image here)
2. Next, the thirdpatchinstall.ps1 file is absolutely essential to the proper functioning of your package. This file installs the package by extracting the ZIP file to the desired path. **It is important to note that this file MUST be named thirdpatchinstall.ps1 or chocolateyinstall.ps1 in order for the package to function properly.** 
(Insert ZIP thirdpatchinstall.ps1 image here)
3. After the thirdpatchinstall.ps1 file, there are two other optional but recommended files you can include. The first is the thirdpatchuninstall.ps1 file. This file is in charge of uninstalling the package and doing cleanup. This is important if there is a specific way you would like a package to be uninstalled, as it allows for more in-depth clean-up. In the case of a ZIP file-based package, it essentially just clears the folder the package was in, deleting everything. Since ZIP files have no executable uninstallers, this is a good method to remove the package and its related folders entirely. **It is important to note that this file MUST be named thirdpatchuninstall.ps1 or chocolateyuninstall.ps1 in order for the package to function properly.**
(insert ZIP thirdpatchuninstall.ps1 image here)
4. The next optional file is the thirdpatchbeforemodify.ps1 file. This file is in charge of ensuring the package can be updated, remove, or otherwise modified successfully BEFORE the modification takes place. This is useful for things like ensuring there is enough disk space before starting the update process, ensuring the right dependencies are installed, or other checking other pertinent information. In the case of a ZIP file-based package, the thirdpatchbeforemodify.ps1 file checks that the folder where the program is installed exists, but other checks can be added if desired. 
(insert ZIP thirdpatchbeforemodify.ps1 image here).
5. Lastly, ensure that you have the ZIP file that contains your application inside of the "tools" folder alongside the thirdpatchinstall.ps1 file, and optionally the thirdpatchuninstall.ps1 and thirdpatchbeforemodify.ps1 files. **Please ensure you update the name of the ZIP file inside all three of these files so the package can identify the ZIP file you are using. For example, in thirdpatchinstall.ps1, replace "example.zip" with whatever your ZIP file is named.**


### MSI Package:

1. As with the ZIP package, the first file to consider when creating a package for an MSI file is the .nuspec file. This file contains all of the metadata for the package, such as its version number, package name, and author information. This is pertinent information as it allows the package to be identified and rolled-out correctly. This file is the same no matter what type of application file the package uses.
(Insert MSI .nuspec image here)
2. Next, the thirdpatchinstall.ps1 file is absolutely essential to the proper functioning of your package. This file installs the package by finding the MSI file, then installing the application according to the MSI file's instructions. **It is important to note that this file MUST be named thirdpatchinstall.ps1 or chocolateyinstall.ps1 in order for the package to function properly.** 
(Insert MSI thirdpatchinstall.ps1 image here)
3. After the thirdpatchinstall.ps1 file, there are two other optional but recommended files you can include. The first is the thirdpatchuninstall.ps1 file. This file is in charge of uninstalling the package and doing cleanup. This is important if there is a specific way you would like a package to be uninstalled, as it allows for more in-depth clean-up. In the case of an MSI file-based package, the package will follow the uninstall instructions for the MSI application, and all we have to do is initiate that process. **It is important to note that this file MUST be named thirdpatchuninstall.ps1 or chocolateyuninstall.ps1 in order for the package to function properly.**
(insert MSI thirdpatchuninstall.ps1 image here)
4. The next optional file is the thirdpatchbeforemodify.ps1 file. This file is in charge of ensuring the package can be updated, remove, or otherwise modified successfully BEFORE the modification takes place. This is useful for things like ensuring there is enough disk space before starting the update process, ensuring the right dependencies are installed, or other checking other pertinent information. In the case of an MSI file-based package, custom checks can be added if desired to check things like free disk space, required dependencies, etc.
(insert MSI thirdpatchbeforemodify.ps1 image here).
5. Lastly, ensure that you have the MSI file that contains your application inside of the "tools" folder alongside the thirdpatchinstall.ps1 file, and optionally the thirdpatchuninstall.ps1 and thirdpatchbeforemodify.ps1 files. **Please ensure you update the name of the MSI file inside all three of these files so the package can identify the MSI file you are using. For example, in thirdpatchinstall.ps1, replace "example.msi" with whatever your MSI file is named.**

### EXE Package:

1. As with the ZIP and MSI packages, the first file to consider when creating a package for an EXE file is the .nuspec file. This file contains all of the metadata for the package, such as its version number, package name, and author information. This is pertinent information as it allows the package to be identified and rolled-out correctly. This file is the same no matter what type of application file the package uses.
(Insert EXE .nuspec image here)
2. Next, the thirdpatchinstall.ps1 file is absolutely essential to the proper functioning of your package. This file installs the package by finding the EXE file, then installing the application according to the EXE file's instructions. **It is important to note that this file MUST be named thirdpatchinstall.ps1 or chocolateyinstall.ps1 in order for the package to function properly.** 
(Insert EXE thirdpatchinstall.ps1 image here)
3. After the thirdpatchinstall.ps1 file, there are two other optional but recommended files you can include. The first is the thirdpatchuninstall.ps1 file. This file is in charge of uninstalling the package and doing cleanup. This is important if there is a specific way you would like a package to be uninstalled, as it allows for more in-depth clean-up. In the case of an EXE file-based package, the package will follow the uninstall instructions for the EXE application, and all we have to do is initiate that process. **It is important to note that this file MUST be named thirdpatchuninstall.ps1 or chocolateyuninstall.ps1 in order for the package to function properly.**
(insert EXE thirdpatchuninstall.ps1 image here)
4. The next optional file is the thirdpatchbeforemodify.ps1 file. This file is in charge of ensuring the package can be updated, remove, or otherwise modified successfully BEFORE the modification takes place. This is useful for things like ensuring there is enough disk space before starting the update process, ensuring the right dependencies are installed, or other checking other pertinent information. In the case of an EXE file-based package, custom checks can be added if desired to check things like free disk space, required dependencies, etc.
(insert EXE thirdpatchbeforemodify.ps1 image here).
5. Lastly, ensure that you have the EXE file that contains your application inside of the "tools" folder alongside the thirdpatchinstall.ps1 file, and optionally the thirdpatchuninstall.ps1 and thirdpatchbeforemodify.ps1 files. **Please ensure you update the name of the EXE file inside all three of these files so the package can identify the EXE file you are using. For example, in thirdpatchinstall.ps1, replace "example.exe" with whatever your EXE file is named.**

## Templates and Examples

To find ThirdPatch package templates for all three of these package types, visit https://github.com/automationtheory/thirdpatch-examples. Here, you will also find all three of the example packages used above if you would like to have a closer look at the packages in an example format. In the template versions, fields that must be changed are marked for easier editing and modifications, so you can just download the applicable package format and edit. After your package is completed correctly, they are ready to be used with ThirdPatch!



