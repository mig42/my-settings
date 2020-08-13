Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Avit

$pathDirs = @(
  "$env:ProgramFiles\Sublime Text 3",
  # "C:\cmder\vendor\git-for-windows\usr\bin",
  "$HOME\wkspaces\codice-wrk\01plastic\bin\client"
)

$env:Path = ($pathDirs + $env:Path.Split(";")) -join ";"

Set-Alias -Name bcm -Value "C:\Program Files\PlasticSCM5\client\cm.exe"
Set-Alias -Name unzip -Value Expand-Archive

# function prompt {
#   "PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) ";
# }

# function prompt {
#   $time = Get-Date -Format "HH:mm:ss";
#   Write-Host $time -ForegroundColor DarkYellow -NoNewline;
#   Write-Host " $($executionContext.SessionState.Path.CurrentLocation)" -ForegroundColor DarkGreen;
#   Write-Host "λ" -NoNewline -ForegroundColor DarkGray;
#   return " ";
#     #return " ⌨ `e[48;5;$($color)m`e[38;5;0m `e[38;5;15m$content `e[48;5;0m`e[38;5;$($color)m "
# }
