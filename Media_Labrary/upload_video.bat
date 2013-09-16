@echo off
cd /d %~dp0
cd videos
xcopy /d /E .\* d:\websites\nginx-1.4.2\static\videos\

cd /d d:\websites\nginx-1.4.2\

video_ser.bat

cd /d %~dp0

pause