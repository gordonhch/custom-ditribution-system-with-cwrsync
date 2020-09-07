@ECHO OFF
REM *****************************************************************
REM
REM CWRSYNC.CMD - Batch file template to start your rsync command (s).
REM
REM *****************************************************************

REM Make environment variable changes local to this batch file
SETLOCAL

REM Specify where to find rsync and related files
REM Default value is the directory of this batch file
SET CWRSYNCHOME=%~dp0

REM Create a home directory for .ssh 
REM IF NOT EXIST %CWRSYNCHOME%\home\%USERNAME%.ssh MKDIR %CWRSYNCHOME%\home\%USERNAME%.ssh
IF NOT EXIST %CWRSYNCHOME%home.ssh MKDIR %CWRSYNCHOME%home.ssh

REM Make cwRsync home as a part of system PATH to find required DLLs
SET CWOLDPATH=%PATH%
SET PATH=%CWRSYNCHOME%cwrsync-bin;%PATH%

REM Windows paths may contain a colon (:) as a part of drive designation and 
REM backslashes (example c:\, g:\). However, in rsync syntax, a colon in a 
REM path means searching for a remote host. Solution: use absolute path 'a la unix', 
REM replace backslashes (\) with slashes (/) and put -/cygdrive/- in front of the 
REM drive letter:
REM 
REM Example : C:\WORK\* --> /cygdrive/c/work/*
REM 
REM Example 1 - rsync recursively to a unix server with an openssh server :
REM
REM       rsync -r /cygdrive/c/work/ remotehost:/home/user/work/
REM
REM Example 2 - Local rsync recursively 
REM
REM       rsync -r /cygdrive/c/work/ /cygdrive/d/work/doc/
REM
REM Example 3 - rsync to an rsync server recursively :
REM    (Double colons?? YES!!)
REM
REM       rsync -r /cygdrive/c/doc/ remotehost::module/doc
REM
REM Rsync is a very powerful tool. Please look at documentation for other options. 
REM

REM ** CUSTOMIZE ** Enter your rsync command(s) here


SETLOCAL
REM SET CWRSYNCHOME=c:\commands\cwrsync
REM SET HOME=c:\Users\Petah\
SET CWOLDPATH=%PATH%
SET PATH=%CWRSYNCHOME%\bin;%PATH%
REM %~dp0\cwrsync\bin\rsync.exe %*

echo ===START cars RESET >> cwrsync_log.txt
setlocal
for /f "tokens=*" %%f in ('tzutil /g') do (
  echo %DATE%     %TIME%     ^(%%f^) >> cwrsync_log.txt
  )
endlocal 
rsync -chavvzP --delete --force --stats --exclude-from={'cwrsync-exclude.txt'} username1@1.1.1.1:/rootpath1/path2/path3/folder1/ folder1/ 

@echo 'fin'
echo ===FINISHED folder1 RESET >> cwrsync_log.txt
setlocal
for /f "tokens=*" %%f in ('tzutil /g') do (
  echo %DATE%     %TIME%     ^(%%f^) >> cwrsync_log.txt
  )
endlocal 
pause