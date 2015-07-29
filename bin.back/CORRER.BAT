@echo off

set var3=%3
set var3=%var3:"=%

if exist %var3%\main.prg set var1=%var3%\main.prg
if exist %var3%\main.prg set var2=%var3%\main
if exist %var3%\main.prg goto Continue

set var1=%1
set var2=%2

:Continue

if exist %~dp0\stderr.txt  del %~dp0\stderr.txt
if exist %~dp0\stdout.txt  del %~dp0\stdout.txt
if exist %var2%.dcb    del %var2%.dcb
pushd  %var3%
%~dp0\bgdc.exe  %var1%
if exist %~dp0\stdout.txt   type %~dp0\stdout.txt
if exist %~dp0\stderr.txt   type %~dp0\stderr.txt
if exist %~dp0\stderr.txt   goto quit
%~dp0\bgdi.exe %var2%
if exist %~dp0\stderr.txt  type %~dp0\stderr.txt
:quit
pause 
