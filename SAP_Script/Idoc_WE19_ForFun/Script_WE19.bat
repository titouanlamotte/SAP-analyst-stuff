@echo off
for /f "tokens=*" %%a in (C:\Users\*****\Desktop\*****.csv) do (
  echo line=%%a
  cscript //nologo C:\Users\*****\Desktop\Script_WE19.vbs %%a
)
timeout 1
pause