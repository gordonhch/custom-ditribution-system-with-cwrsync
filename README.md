# cwrsync-micro-content-ditribution-script

A script for one-way syncing files into individual folders from a server. 

Useful for maintaining your custom build and maintained softwares, modded game files, or media files that get updated routinely. 

Currently made for PowerShell but should work for linux distros as rsync runs natively without the compatibility extras.



# Concepts

Rsync - a linux command for efficiently syncing files.

cygwin - a tool for running linux commands on PowerShell

cwrsync - a package for rsync usage on PowerShell by [itefix](https://itefix.net/cwrsync)

This script package is essentially a repackaged cwrsync ready for use once you set up your server with the files.



# How to use

Setup a vps server and upload your folder and files there. We'll call the base sync folder 'folder1'.

Add a new user to be used for syncing only. We call this user 'username1'

As we have your files at /rootpath1/path2/path3/folder1/ at the server 1.1.1.1, look at this line in the script:


> username1@1.1.1.1:/rootpath1/path2/path3/folder1/ folder1/

###replace the command:
username1 with the account, 
1.1.1.1 with your ip or address, 
/rootpath1/path2/path3/folder1/ for the path to the sync folder(the source),
folder1/ for the client folder to download into(the destination).


###paths:
keep the / in-place to avoid syntax issues. 
Feel free to use relative paths in the source path and/or ../ in the destination path.
But beware that your users might break the path relations without realizing it.
The current implementation allows your users to move the folders as long as they move/copy cwrsync with it.



