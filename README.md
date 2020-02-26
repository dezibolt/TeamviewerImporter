# TeamviewerImporter
Imports a TeamViewer computer-list from a csv via powershell

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
