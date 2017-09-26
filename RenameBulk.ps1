<# 

Usage:
1. Drop this script into top level folder
2. Remove -WhatIf flag
3. Run and profit

#>


# Gets script path 
function Get-ScriptDirectory {
  $Invocation = (Get-Variable MyInvocation -Scope 1).Value
  Split-Path $Invocation.MyCommand.Path
}

# Go to script path 
cd (Get-ScriptDirectory)

# Get all items with target format recursively 
Get-ChildItem -Recurse -Filter *jpg | 
 
    % {

# get file path and clean it
       $cleanedPath = $_.pspath -replace "\\","_" `
           -replace ".*(?=raw_)","" `

# rename file
       Rename-Item -Path $_.PSPath -NewName $cleanedPath -WhatIf 

     }
    

