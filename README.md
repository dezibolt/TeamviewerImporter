# TeamviewerImporter
Imports a TeamViewer computer-list from a csv via powershell

# Before using this script

## Prepare the csv-file
You need to prepare your csv file. If you have the same problem as me, exporting and reimporting a computerlist or migrating accounts I recommend using the exporter from u/myunclesam:
https://github.com/MyUncleSam/TeamviewerExporter

If you have the required already here is what the csv-file should look like:

### import_final.csv
pk,remotecontrol_id,groupid,alias,password
1,rXXXXXXXXX,gXXXXXXXXX,MyFirstServer,StRoNgPaSsWoRd
2,rXXXXXXXXX,gXXXXXXXXX,MySecondServer,StRoNgPaSsWoRd
3,rXXXXXXXXX,gXXXXXXXXX,MyFirstClient,StRoNgPaSsWoRd

### Explanation:
pk = primarykey
remotecontrol_id = Teamviewer ID with preceding 'r'
groupid = (optional) GroupID - if you login to teamviewer management and select the group you can see the GroupID in the URL
alias = alias
password = password

## AuthorizationToken
Token from your teamviewer account which should be used. No username / password credentials are needed here. You can create one by:
1. login at https://login.teamviewer.com
2. on the top right click on your profil and edit it (https://login.teamviewer.com/nav/profile)
3. create a new Script APP
4. Insert the returned token into the poweshellscript.

Permission for teamviewer app:
- group management -> full
- computers and contacts -> full

# Configuration

Edit the TVImport.ps1 and change the following variables:

Teamviewer Token
$token = '[INSERTTOKENHERE]'

CSV-Path
$path = C:\temp\test.csv

Number of CSV-rows
$number = 510
