#download wallpaper \ lock
Invoke-WebRequest https://github.com/drewpchannel/setWallPaper/archive/refs/heads/main.zip -OutFile .\wps.zip
Expand-Archive .\wps.zip

#get machine username, user has to be logged in or the hive might not be mounted
$SID = & ".\wps\setWallPaper-main\SIDget\GetSID.ps1"

#change to path of downloaded wallpaper.
$filePath = Resolve-Path ".\wps\setWallPaper-main"

Set-ItemProperty -Path "Registry::HKEY_USERS\$SID\Control Panel\Desktop" -Name WallPaper -value "$filePath\Treeline Wallpaper.png"
