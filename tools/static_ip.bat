@echo off
netsh interface ip set address name="��������" source=static addr=192.168.11.77 mask=255.255.255.0
netsh interface ip set address name="��������" gateway=192.168.11.11 gwmetric=0
netsh interface ip set dns name="��������" source=static addr=8.8.8.8 register=primary
netsh interface ip add dns name="��������" addr=8.8.4.4
netsh interface ip set wins name="��������" source=static addr=none