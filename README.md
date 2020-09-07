# cwrsync-micro-content-ditribution-script

A script for one-way syncing files into individual folders from a server. 

Useful for maintaining your custom build and maintained softwares, modded game files, or media files that gets updated routinely. 

Currently made for PowerShell but should be easily made to work for linux distros since rsync runs natively without the compatibility extras.



# Concepts

Rsync - a linux command for efficiently syncing files.

cygwin - a tool for running linux commands on PowerShell

cwrsync - a package for rsync usage on PowerShell by [itefix](https://itefix.net/cwrsync)

This script package is essentially a repackaged cwrsync ready for use once you set up your server with the files.



# How to use

Setup a vps server and upload your folder and files there. We'll call the base sync folder 'folder1'.

Add a new user to be used for syncing only. We call this user 'username1'. Log in with this user.

Disable Key-authentication for this account for now. _Don't do this with your root._

As we have your files at /rootpath1/path2/path3/folder1/ at the server 1.1.1.1, look at this line in the script:


> username1@1.1.1.1:/rootpath1/path2/path3/folder1/ folder1/

replace placeholders:
* `username1` with the account, 
* `1.1.1.1` with your ip or address, 
* `/rootpath1/path2/path3/folder1/` for the path to the sync folder(the source),
* `folder1/` for the client folder to download into(the destination).



using paths:
* keep the `/` in-place to avoid syntax issues. 
* You could use relative paths in the source path and/or `../` in the destination path.
* But beware that your users might break the path relations without realizing it.
* The current implementation allows your users to move the folders as long as they move/copy cwrsync with it.



Run the script:
* The Auto-update version updates check the files' modification dates and updates accordingly. Files not on the server are left untouched.
* The RESET version resets your folder to be identical as the one on the server. Files not on the server are deleted.
  - depends on your situation less capable users are better off without the reset script until they need one from you.
  
* answer '**yes**' to proceed if the script prompt question on the identity of your server.
* password is the your account password.

If proceeded correctly, you've just made yourself a sync server.
Restrict the account on your server with `rssh` to prevent unauthorized access. [guide](http://terranhost.com/blog/2011/09/use-rssh-to-restrict-user-access-to-sftp/index.html)


# Conclusion
Spin up a vps, did some config, This usually require only an hour of work if not minutes.

From my test this server can easily handle 10s of GBs resonably fast as long as your server has the storage space. 

You can use public key and private key pairs to enchance security for your users(to confirm the ip / address connects to your server and isn't redirected to others'). 
In an extreme scenario that your server got hacked this will not protect your users.


That's it! 
For more info you can check out `rssh`, `chmod` file permissions and rsync's `flags` & `excludes` to further customize this setup to your liking.
