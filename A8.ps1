Get-ADComputer -Filter * | Select -Property Name,ObjectClass,DistinguishedName,Enabled,createdTimeStamp |
Export-Csv "C:\Scripts\Complist.csv" 
