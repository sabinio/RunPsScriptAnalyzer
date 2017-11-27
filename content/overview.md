# Downloads and Installs PSScriptAnalyzer on Build Agent And Runs Against Folder
This plugin will check if PsScriptAnalyzer is installed and if it isn't htne it eill download/install and run PSScriptAnalyzer against a given folder.

The plugin itself is built and deployed via VSTS. The following badge shows the current status of that build.

[<img src="https://sabinio.visualstudio.com/_apis/public/build/definitions/573f7b7f-2303-49f0-9b89-6e3117380331/114/badge"/>](https://sabinio.visualstudio.com/Sabin.IO/_apps/hub/ms.vss-ciworkflow.build-ci-hub?_a=edit-build-definition&id=114)

## How To Use
Enter the path to the folder you wish to run PSScriptAnalyzer against.

This extension does not require the account running the build to be an administrator on the machine; there fore this can run on the Hosted Build Agent Service.

