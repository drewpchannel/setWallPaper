#Setup Folder
if (-not (Test-Path -Path C:\treeline_files))
{
    New-Item -Path C:\treeline_files -ItemType Directory | Out-Null
}

#download wallpaper \ lock
Invoke-WebRequest https://github.com/drewpchannel/setWallPaper/archive/refs/heads/main.zip -OutFile c:\treeline_files\wps.zip
Expand-Archive -Path c:\treeline_files\wps.zip -DestinationPath c:\treeline_files -Force

#get machine username, user has to be logged in or the hive might not be mounted
$SID = & "c:\treeline_files\setWallPaper-main\SIDget\GetSID.ps1"

Set-ItemProperty -Path "Registry::HKEY_USERS\$SID\Control Panel\Desktop" -Name WallPaper -value "c:\treeline_files\setWallPaper-main\Treeline Wallpaper.png"