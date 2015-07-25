@echo off
if exist C:\Creations\Programmation\VideoGames\BennuGD\devBennu\bin\stderr.txt  del C:\Creations\Programmation\VideoGames\BennuGD\devBennu\bin\stderr.txt
if exist C:\Creations\Programmation\VideoGames\BennuGD\devBennu\bin\stdout.txt  del C:\Creations\Programmation\VideoGames\BennuGD\devBennu\bin\stdout.txt
if exist %2.dcb    del %2.dcb
pushd  %3 
C:\Creations\Programmation\VideoGames\BennuGD\devBennu\bin\bgdc.exe -s bgdi -Ca %1






pause 
