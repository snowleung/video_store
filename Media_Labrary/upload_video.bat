@echo off
cd /d %~dp0
cd videos

for %%i in (*) do (if not exist "d:\websites\nginx-1.4.2\static\videos\%%i" copy "%%i" d:\websites\nginx-1.4.2\static\videos\)

cd /d d:\websites\nginx-1.4.2\

video_ser.bat

cd /d %~dp0

