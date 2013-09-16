@echo off

taskkill /F /IM nginx.exe > nul

cd /d %~dp0

xcopy /y /e nginx-1.4.2\script\build_index.py d:\websites\nginx-1.4.2\script\
xcopy /y /e nginx-1.4.2\template\bt.htm d:\websites\nginx-1.4.2\template\

d:

cd d:\websites\nginx-1.4.2\

del /Q  html\*

video_ser.bat

pause
