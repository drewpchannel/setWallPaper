if (Test-Path -Path .\wps)
{
    Remove-Item -Path .\wps -Recurse
}

if (Test-Path -Path .\wps.zip)
{
    Remove-Item -Path .\wps.zip
}

#download wallpaper \ lock
Invoke-WebRequest https://github.com/drewpchannel/setWallPaper/archive/refs/heads/main.zip -OutFile .\wps.zip
Expand-Archive .\wps.zip

#get machine username, user has to be logged in or the hive might not be mounted
$SID = & ".\wps\setWallPaper-main\SIDget\GetSID.ps1"

#change to path of downloaded wallpaper.
$filePath = Resolve-Path ".\wps\setWallPaper-main"

Set-ItemProperty -Path "Registry::HKEY_USERS\$SID\Control Panel\Desktop" -Name WallPaper -value "$filePath\Treeline Wallpaper.png"
cmd.exe "/c rundll32.exe user32.dll, UpdatePerUserSystemParameters 1, True"

Remove-Item .\wps -Recurse
Remove-Item .\wps.zip