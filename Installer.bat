@echo off
:start
cls
echo ##################################
echo # Enter y to continue            #
echo # Enter n to cancel              #
echo ##################################
set /p ans="Do you want to continue? (Y/n):"
echo 

if %ans%==y (
goto y
)
if %ans%==n (
goto n
)
if %ans%==yes (
goto y
)
if %ans%==no (
goto n
)
goto error

:y
cls
echo Downloading ... (this may take a while)
echo [----------------------------------------] 0%%
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://hype100.net/files/download.php?id=2&token=rVEOUHYHhTm4W6cmy5Y8o6qWWUlFUafy&download','GoodDayMC.zip')"
cls
echo Downloading ... (this may take a while)
echo [####------------------------------------] ~~%%
timeout 1 > NUL
cls
echo Downloading ... (this may take a while)
echo [############----------------------------] ~~%%
timeout 1 > NUL
cls
echo Expanding archive ... (this may take a while)
echo [####################--------------------] 50%%
powershell -Command "Expand-Archive GoodDayMC.zip GoodDayMC"
cls
echo Moving files ... (this may take a while)
echo [###########################-------------] 67,5%%
move "%cd%\GoodDayMC\*.*" "%cd%\"
move "%cd%\GoodDayMC\mods" "%cd%\"
move "%cd%\GoodDayMC\config" "%cd%\"
move "%cd%\GoodDayMC\ModTranslations" "%cd%\"
move "%cd%\GoodDayMC\.fabric" "%cd%\"
ren GoodDayMC Update
cls
echo Deleting installation files ... (this may take a while)
echo [###################################-----] 87,5%%
del GoodDayMC.zip
del Install-dev.bat
#rmdir /S /Q "%cd%\test"
timeout 4 > NUL
cls
echo Download is done!
echo [########################################] 100%%
pause
cls
timeout 5 > NUL

:n
exit 100

:error
cls
echo ##################################
echo # Enter y to continue            #
echo # Enter n to cancel              #
echo ##################################
echo Do you want to continue? (Y/n): ERROR: Invalid Input!
timeout 10
goto start