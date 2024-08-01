#get machine username, user has to be logged in or the hive might not be mounted
$SID = & ".\sms\startMenuSetter-main\SIDget\GetSID.ps1"

#change to path of downloaded wallpaper
$filePath = Resolve-Path ".\"