# test one - as expected 
$OldErrorActionPref = $ErrorActionPreference
$qwerty = (Join-Path $PSScriptRoot ".\RunPsScriptAnalyzer.ps1")
. $qwerty -PsFolder $PSScriptRoot