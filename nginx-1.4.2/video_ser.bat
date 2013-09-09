@echo off
taskkill /F /IM nginx.exe > nul

d:

cd d:\websites\nginx-1.4.2\

start nginx

cd d:\websites\nginx-1.4.2\script\

build_index.py

cd ..