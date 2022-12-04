winget install starship --force
Install-Module Terminal-Icons -force
Move-Item $PROFILE "$($PROFILE)-$((Get-Date).ToString('ddMMyyyy-HHmm')).bk"
Move-Item $PROFILE.AllUsersAllHosts "$($PROFILE.AllUsersAllHosts)-$((Get-Date).ToString('ddMMyyyy-HHmm')).bk"
Copy-Item profile.ps1 $PROFILE.AllUsersAllHosts

mkdir ~\.config\
Copy-Item starship.toml ~\.config\starship.toml