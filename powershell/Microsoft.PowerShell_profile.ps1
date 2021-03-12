Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Avit

$pathDirs = @(
  "$env:ProgramFiles\Sublime Text 3",
  # "C:\cmder\vendor\git-for-windows\usr\bin",
  "$HOME\wkspaces\codice-wrk\01plastic\bin\client",
  "$HOME\terraform",
  "$HOME\bin"
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

function Remove-TerraformModule {
  [CmdletBinding()]
  param (

    [Parameter(Mandatory = $true,
               Position = 0,
               ValueFromPipeline = $true,
               ValueFromPipelineByPropertyName = $true,
               HelpMessage = "Module name to delete")]
    [string]
    $Module,

    # Specifies a path to one or more locations.
    [Parameter(Mandatory = $true,
               Position = 1,
               ValueFromPipeline = $true,
               ValueFromPipelineByPropertyName = $true,
               HelpMessage = "List of versions you'd like to delete.")]
    [ValidateNotNullOrEmpty()]
    [string[]]
    $Versions,

    # Specifies organization name
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]
    $Organization = "PlasticSCM",

    # Specifies organization name
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]
    $Provider = "google",

    # Specifies Terraform backend
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]
    $Backend = "https://ptfe.internal.unity3d.com/",

    [Parameter()]
    [Switch]
    $Confirm
  )

  begin {
    if (!$Confirm) {
      Write-Output "This would delete version(s) [$($Versions -join ", ")] of module '$Module' (provider: $Provider) in organization $Organization."
      Write-Output "Include -Confirm to apply the operation."
      return
    }

    if (![uri]::IsWellFormedUriString($Backend, [urikind]::Absolute)) {
      Write-Error "Invalid backend URI: $Backend"
      return
    }

    $baseUri = [uri]::new($Backend)

    $credentialsPath = Join-Path -Path $env:APPDATA -ChildPath terraform.d/credentials.tfrc.json

    if (!(Test-Path $credentialsPath)) {
      Write-Error "Terraform credentials file '$credentialsPath' not found!"
      return
    }

    $plainTextToken = (Get-Content $credentialsPath | ConvertFrom-Json).credentials."ptfe.internal.unity3d.com".token

    if (!$plainTextToken) {
      Write-Error -Message "Token not found in $credentialsPath!"
      return
    }

    $token = $plainTextToken | ConvertTo-SecureString -AsPlainText -Force

    $deletePath = "/api/v2/registry-modules/actions/delete"
  }

  process {
    if (!$baseUri -or !(Test-Path $credentialsPath) -or !$plainTextToken) {
      return
    }

    Write-Output "Selected module: $Module (Organization: $Organization, Provider: $Provider)"

    $Versions | ForEach-Object {
      Write-Output "Deleting version $($_)..."

      $uri = [uri]::new($baseUri, "$deletePath/$Organization/$Module/$Provider/$_")

      try {
        Invoke-RestMethod -Uri $uri -Method Post -Authentication Bearer -Token $token
      } catch {
        ($_ | ConvertFrom-Json).errors | ForEach-Object {
          if ($_ -is [string]) {
            Write-Error "Request failed! $_"
          } else {
            Write-Error "Request failed! $($_.status) $($_.title)"
          }
        }
      }
    }
  }
}
