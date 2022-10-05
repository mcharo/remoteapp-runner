#!/bin/bash

remote='remotedesktopserver'
domain='domain'
user=`id -un`

app=${1:-wt}
args=${*:2}

# special case, launching powershell directly
# isn't working on macos, so wrap with cmd
if [ "$1" == "powershell" ]; then
    app="cmd"
    args="/c powershell ${*:2}"
fi

args="${args// /%20}"
query="full%20address=s:$remote&remoteapplicationmode=i:1&shell%20working%20directory=s:C:/Users/$user&remoteapplicationname=s:Remote%20App&remoteapplicationprogram=s:$app&remoteapplicationcmdline=s:$args&domain=s:$domain&username=s:$user"

open -a "Microsoft Remote Desktop" "rdp://$query"
