@echo off
start sapshcut.exe -u=SAP_USER -pw=SAP_PW -language=EN -system=### -client=000
echo %time%
timeout 5 > NUL
echo %time%
pushd %~dp0
cscript Start_sapshcut.vbs
pause