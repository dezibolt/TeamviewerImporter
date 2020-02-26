Param(
 [string]$rid,
 [string]$alias,
 [float]$i
)

#Define Variables

#Teamviewer Token
$token = '[INSERTTOKENHERE]'

#CSV-Path
$path = C:\temp\test.csv

#Number of CSV-rows
$number = 510


$bearer = 'Bearer',$token
$header = New-Object 'System.Collections.Generic.Dictionary[[String],[String]]'
$header.Add('authorization', $bearer)

#Define URL For Request.

$ReqURI = 'https://webapi.teamviewer.com/api/v1/devices/'

#Import .csv

$import = Import-CSV -Path $path

#Loop through .csv for different body for request

foreach ($_ in 1..$number){
        
        $alias = $import | Where-Object {$_.pk -eq $i} | Select-Object -ExpandProperty alias
        $rid = $import | Where-Object {$_.pk -eq $i} | Select-Object -ExpandProperty remotecontrol_id
        $gid = $import | Where-Object {$_.pk -eq $i} | Select-Object -ExpandProperty groupid
        $passw = $import | Where-Object {$_.pk -eq $i} | Select-Object -ExpandProperty password

#Define Body For Request.  

$Jsonbody= @{
    alias = $alias
    remotecontrol_id = $rid
    groupid = $gid
    password = $passw
            } | ConvertTo-Json

#Send Request

$Response = Invoke-RestMethod -Header $header -Method POST -ContentType 'application/json' -Uri $ReqURI -Body $Jsonbody -Verbose| fl *

#Next row

$i++

}