$test = 'not found'
$Path = (Get-ItemProperty ‘HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\environment’)
$Path.PSObject.Properties | ForEach-Object {
If ($_.Name -like '*LM_LICENSE_FILE*'){
$test = 'found'
}}

if ($test = 'not found') {
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\environment' -Name "LM_LICENSE_FILE" -Value ”27000@test.university.com”  -PropertyType "String"
}
