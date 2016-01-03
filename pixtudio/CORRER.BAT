@echo off

set var3=%3
set var3=%var3:"=%

echo Looking for main.prg file in parents directories...
:checkMain
if not exist %var3%\main.prg (
	FOR %%a IN ("%var3:~0,-1%") DO (
		set var3=%%~dpa
		if %var3%==%~d0\ (
			echo No main.prg found.			
			set var1=%1
			set var2=%2
			goto continue
		)
		goto checkMain
	)
) else (
	set var1=%var3%\main.prg
	set var2=%var3%\main.dcb
)

:continue

echo Main file : %var1%
if exist %~dp0\stderr.txt  del %~dp0\stderr.txt
if exist %~dp0\stdout.txt  del %~dp0\stdout.txt
if exist %var2%.dcb    del %var2%.dcb
pushd  %var3%
%~dp0\pxtp.exe  %var1%
if exist %~dp0\stdout.txt   type %~dp0\stdout.txt
if exist %~dp0\stderr.txt   type %~dp0\stderr.txt
if exist %~dp0\stderr.txt   goto quit
%~dp0\pxtb.exe %var2%
if exist %~dp0\stderr.txt  type %~dp0\stderr.txt
:quit
