winget install starship --force
Invoke-WebRequest https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Hack.zip  -OutFile "$env:TEMP\Hack.zip"
Invoke-WebRequest https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip  -OutFile "$env:TEMP\JetBrainsMono.zip"
Expand-Archive -LiteralPath "$env:TEMP\Hack.zip" -DestinationPath "$env:TEMP\Fonts\"
Expand-Archive -LiteralPath "$env:TEMP\JetBrainsMono.zip" -DestinationPath "$env:TEMP\Fonts\"
Move-Item "$env:TEMP\Fonts\*.ttf" "C:\Windows\Fonts\"
if (-not (Get-Module -Name "Terminal-Icons")) {Install-Module Terminal-Icons -force }
Move-Item $PROFILE "$($PROFILE)-$((Get-Date).ToString('ddMMyyyy-HHmm')).bk"
Move-Item $PROFILE.AllUsersAllHosts "$($PROFILE.AllUsersAllHosts)-$((Get-Date).ToString('ddMMyyyy-HHmm')).bk"
Copy-Item profile.ps1 $PROFILE.AllUsersAllHosts

mkdir ~\.config\
Copy-Item starship.toml ~\.config\starship.toml
