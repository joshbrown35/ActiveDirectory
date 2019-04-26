Import-Module ActiveDirectory

$filepath = Read-Host -Prompt "Enter path to CSV file"

$users = Import-Csv $filepath


foreach ($user in $users) {
    $fname = $user.'firstname'
    $lname = $user.'lastname'
    $uname = $user.'username'
    $description = $user.'description'
    $pw = $user.'password'
    $ou = $user.'ou'
    $action = $user.'Action'


    If ($action -eq "Add") {
        New-ADUser -Name "$fname" -Surname "$lname" -DisplayName "$uname" -Description "$description" -Path "$ou" -AccountPassword (ConvertTo-SecureString "$pw" -AsPlainText -Force) 
   

  } ElseIf ($action -eq "Remove") {
        Remove-ADUser -Identity "CN=$fname,$ou"
    } 
    Else { Write-Host ("Action is not correctly specified")
    }
}  
