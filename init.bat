@echo off

taskkill /F /IM nginx.exe > nul

xcopy /y /e tools\jinja2 c:\Python27\jinja2\

xcopy /y /e tools\videos.lnk "C:\Documents and Settings\Administrator\����\"
xcopy /y /e tools\video_ser.bat.lnk "C:\Documents and Settings\Administrator\����\"

netsh  firewall set opmode disable

mkdir d:\websites

xcopy /y /e nginx-1.4.2 d:\websites\nginx-1.4.2\

echo "�ϴ���Ƶ�⣿"

pause

cd /d %~dp0

cd Media_Lab

upload_video.bat

echo "finish"

pause

cd /d %~dp0

cd d:\websites\nginx-1.4.2\

video_ser.bat

pause