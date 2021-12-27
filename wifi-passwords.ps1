$all_profiles = netsh wlan show profiles 
$test = $all_profiles.Trim() | Select-String 'All User Profile' | ForEach-Object { $_ -replace '(?<=\S)\s+:\s+(?=\S)','=' } 
$profiles = $test -creplace '[^\\]*=','' 
$all = foreach($item in $profiles) {netsh wlan show profile name=$item key=clear } 
$all | ConvertFrom-String | select p2, p5 | Select-String "SSID" 
$all | ConvertFrom-String | select p3, p5 | Select-String "Content"