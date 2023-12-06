#!/bin/bash


#################################################################
#Note: I reccomened performing the following steps before doing 
#this to make the script work
#
#Step 1:
#   Generate ssh pub/priv keys 
#     | ssh-keygen -t rsa
#     | just pick defaults and no password for least security and 
#     | most convenience
#Step 2:
#   Send newly generate keys to the backup server
#     | scp -P "port of backup server" "~/.ssh/id_rsa.pub" "ip of backup server":./
#Step 3:
#   Send ssh files to the right directories on the backup machine
#     | Connect to backup machine and enter home dir
#     | mkdir .ssh
#     | mv id_rsa.pub .ssh/authorized_keys
#     | Disconnect from backup machine
#Step 4:
#   Reconnect to backup machine and enter password if prompted
#Step 5:
#   Enjoy
#
#
##################################################################
#Note: Place this script in your main server directory


time=$(date +%Y%m%d_%H%M%S)

ip= #ip of remote machine#
port= #port number for scp#

7z a "World Backup: $time" ./world #Put in your own worldname if desired
scp -P ./*.7z $ip:/backup/ #you can change this dir to wherever you want
rm *.7z


