# Windows-wifi-pass
Powershell Script that retireves wifi passwords

```
$all_profiles = netsh wlan show profiles
$test = $all_profiles.Trim() | Select-String 'All User Profile' | ForEach-Object { $_ -replace '(?<=\S)\s+:\s+(?=\S)','=' }
$profiles = $test -creplace '[^\\]*=','' 
$all = foreach($item in $profiles) {netsh wlan show profile name=$item key=clear } 
$all | ConvertFrom-String | select p2, p5 | Select-String "SSID" 
$all | ConvertFrom-String | select p3, p5 | Select-String "Content"
```
Output:

![obraz](https://user-images.githubusercontent.com/82705344/147459191-5bf8d6f4-3f4e-4c3c-974d-a9030c1ab826.png)


ToDo:
1. Change output format
