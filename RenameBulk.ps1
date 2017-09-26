

# Gets script path 
function Get-ScriptDirectory {
  $Invocation = (Get-Variable MyInvocation -Scope 1).Value
  Split-Path $Invocation.MyCommand.Path
}

function Get-ScriptDirectoryCleaned {
  $Invocation = (Get-Variable MyInvocation -Scope 1).Value
  Split-Path (Split-Path $Invocation.MyCommand.Path -parent) -leaf|
      ForEach-Object {
        $_ -replace "\\","_" `
           -replace "\._",""
    } 
}

function Get-NewFilename {
    Resolve-Path -Relative |
    ForEach-Object {
        $_ -replace "\\","_" `
           -replace "\._",""
    } 
}

# Go to script path 
cd (Get-ScriptDirectory)

Get-ScriptDirectory
Get-ScriptDirectoryCleaned

Get-ChildItem -Recurse -Filter *jpg | 

    
    % {
       $resolvedPath = (Resolve-Path -Relative)
       $newFileName = $resolvedPath -replace "\\","_" `
           -replace "\._",""
        $newFileName

        Rename-Item -NewName $newFileName -WhatIf 

     }
    

 #   Rename-Item -NewName { $_.Directory.Name+'_'+$_.Directory.Name+'_'+$_.Name } -WhatIf


<# 

Usage:
1. Drop this script into top level folder

#>
