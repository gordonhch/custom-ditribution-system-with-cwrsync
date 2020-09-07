# cwrsync-micro-content-ditribution-script
A script for one-way syncing files into individual folders from a server. Useful for maintaining your custom build and maintained softwares, modded game files, or media files that get updated routinely. 

Currently made for PowerShell but should work for linux distros as rsync runs natively without the compatibility extras.

# Concepts
Rsync - a linux command for efficiently syncing files.
cygwin - a tool for running linux commands on PowerShell
cwrsync - a package for rsync usage on PowerShell by [itefix](https://itefix.net/cwrsync)
