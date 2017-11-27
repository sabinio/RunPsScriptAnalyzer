param(    
    $PsFolder
)
Function Test-PsScripts {
    [cmdletbinding()]
    param(
        [ValidateNotNullOrEmpty()]
        $Folder
    )
    try {
        Find-Module -Name "PsScriptAnalyzer"
    }
    catch {
        Write-Host "No PsScriptAnalyzer" 
        Install-PackageProvider -Name NuGet -Force -Scope CurrentUser
        Install-Module PSScriptAnalyzer -Force -Scope CurrentUser
    }
    finally {
        Import-Module PSScriptAnalyzer -Force
        Write-Host " PsScriptAnalyzer Imported"
        try {
            $DiagnosticRecord = Invoke-ScriptAnalyzer -Path $Folder -Recurse 
            $diagnosticRecord | Select-Object $_
            
        }
        catch {
            Write-Error $_.Exception
        }
    }
}
Test-PsScripts -Folder $PsFolder