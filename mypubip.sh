#!/bin/bash
#THIS BASH SCRIPT PRINT PUBLIC IP ASSOCIATED WITH SYSTEM
bold=$(tput bold)
myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
echo "Public IP address associated with this system is:$bold ${myip}"
