param(    
    $PsFolder #= $PSScriptRoot
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
            ForEach ($r in $diagnosticRecord)
            {
                Write-Host $r.Message
            }
            
        }
        catch {
            Write-Error $_.Exception
        }
    }
}
Test-PsScripts -Folder $PsFolder