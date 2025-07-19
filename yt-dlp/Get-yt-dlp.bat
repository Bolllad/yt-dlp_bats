@echo off

rem Define the ESCAPE character
for /f %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"

rem Attempt to install Python 3.12
echo Starting %ESC%[1;41mPython 3.12%ESC%[0m installation via %ESC%[1;45mwinget%ESC%[0m...
start /wait cmd /c winget install --id python.Python.3.12 --no-upgrade
IF %ERRORLEVEL% == -1978335135 (
    echo. Package already installed.
) ELSE IF %ERRORLEVEL% NEQ 0 (
    echo. %ESC%[0mAn error occurred during Python 3.12 installation.
    echo. Error code:%ESC%[91m %ERRORLEVEL%%ESC%[0m
    echo %ESC%[1;4myt-dlp is a py3 script and won't run without Python 3.9 or newer! Consider manual installation%ESC%[0m.
    pause
) ELSE (
    echo. %ESC%[0mPython 3.12 installed succesfully.
)
echo.

rem Attempt to install FFmpeg
echo Starting %ESC%[1;41mFFmpeg%ESC%[0m installation via %ESC%[1;45mwinget%ESC%[0m...
start /wait cmd /c winget install --id BtbN.FFmpeg.GPL  --no-upgrade
IF %ERRORLEVEL% NEQ 0 (
    echo. %ESC%[0mAn error occurred during FFmpeg installation.
    echo. Error code:%ESC%[91m %ERRORLEVEL%%ESC%[0m
    echo %ESC%[1;4mConsider installing FFmpeg manually%ESC%[0m.
) ELSE (
    echo. %ESC%[0mFFmpeg installed succesfully.
)
echo.

rem Attempt to install yt-dlp
echo Starting %ESC%[1;41myt-dlp%ESC%[0m installation via %ESC%[1;45mpip%ESC%[0m...
start /wait cmd /c pip3 install yt-dlp
IF %ERRORLEVEL% NEQ 0 (
    echo. %ESC%[0mAn error occurred during yt-dlp installation.
    echo. Error code:%ESC%[91m %ERRORLEVEL%%ESC%[0m
    echo.

    echo %ESC%[36mPress any key to exit . . .%ESC%[0m
    pause >nul
    exit
) ELSE (
    echo. %ESC%[0myt-dlp installed succesfully.
)
echo.

rem Check if yt-dlp is available + version
echo Checking %ESC%[1;41myt-dlp version%ESC%[0m...
FOR /F "tokens=* USEBACKQ" %%F IN (`yt-dlp -U`) DO (
SET var=%%F
)
echo. %var%
echo. Finished!
echo.

pause

rem Create video download batch files
echo @echo off> as-mp4-ytdlp.bat
echo. >> as-mp4-ytdlp.bat
echo rem Define the ESCAPE character>> as-mp4-ytdlp.bat
echo for /f %%%%a in ('echo prompt $E^^^| cmd') do set "ESC=%%%%a">> as-mp4-ytdlp.bat
echo. >> as-mp4-ytdlp.bat
echo echo Use %%ESC%%[1;41myt-dlp%%ESC%%[0m download and convert video to %%ESC%%[1;44m.mp4 (best available resolution and bitrate)%%ESC%%[0m>> as-mp4-ytdlp.bat
echo set /P url=Enter video URL: %%ESC%%[1;95m>> as-mp4-ytdlp.bat
echo. >> as-mp4-ytdlp.bat
echo start /wait cmd /c yt-dlp --ffmpeg-location "%%localappdata%%\Microsoft\WinGet\Packages\BtbN.FFmpeg.GPL_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-N-120061-gcfd1f81e7d-win64-gpl\bin" -v -S "res,codec,br" --recode-video mp4 -P %%~dp0 %%url%%>> as-mp4-ytdlp.bat
echo IF %%ERRORLEVEL%% NEQ 0 (>> as-mp4-ytdlp.bat
echo    echo %%ESC%%[0mAn error occurred during video download or conversion.>> as-mp4-ytdlp.bat
echo    echo Error code:%%ESC%%[91m %%ERRORLEVEL%%%%ESC%%[0m>> as-mp4-ytdlp.bat
echo ) ELSE (>> as-mp4-ytdlp.bat
echo    echo %%ESC%%[0mVideo downloaded and convereted succesfully.>> as-mp4-ytdlp.bat
echo )>> as-mp4-ytdlp.bat
echo echo.>> as-mp4-ytdlp.bat
echo echo %%ESC%%[36mPress any key to exit . . .%%ESC%%[0m>> as-mp4-ytdlp.bat
echo pause ^>nul>> as-mp4-ytdlp.bat

echo @echo off> as-mp3-ytdlp.bat
echo. >> as-mp3-ytdlp.bat
echo rem Define the ESCAPE character>> as-mp3-ytdlp.bat
echo for /f %%%%a in ('echo prompt $E^^^| cmd') do set "ESC=%%%%a">> as-mp3-ytdlp.bat
echo. >> as-mp3-ytdlp.bat
echo echo Use %%ESC%%[1;41myt-dlp%%ESC%%[0m download and convert video to %%ESC%%[1;44m.mp3%%ESC%%[0m>> as-mp3-ytdlp.bat
echo set /P url=Enter video URL: %%ESC%%[1;95m>> as-mp3-ytdlp.bat
echo. >> as-mp3-ytdlp.bat
echo start /wait cmd /c yt-dlp --ffmpeg-location "%%localappdata%%\Microsoft\WinGet\Packages\BtbN.FFmpeg.GPL_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-N-120061-gcfd1f81e7d-win64-gpl\bin" -v -t mp3 -P %%~dp0 %%url%%>> as-mp3-ytdlp.bat
echo IF %%ERRORLEVEL%% NEQ 0 (>> as-mp3-ytdlp.bat
echo    echo %%ESC%%[0mAn error occurred during video download or conversion.>> as-mp3-ytdlp.bat
echo    echo Error code:%%ESC%%[91m %%ERRORLEVEL%%%%ESC%%[0m>> as-mp3-ytdlp.bat
echo ) ELSE (>> as-mp3-ytdlp.bat
echo    echo %%ESC%%[0mVideo downloaded and convereted succesfully.>> as-mp3-ytdlp.bat
echo )>> as-mp3-ytdlp.bat
echo echo.>> as-mp3-ytdlp.bat
echo echo %%ESC%%[36mPress any key to exit . . .%%ESC%%[0m>> as-mp3-ytdlp.bat
echo pause ^>nul>> as-mp3-ytdlp.bat

echo.
echo. Created %ESC%[1;42mas-mp4-ytdlp.bat%ESC%[0m and %ESC%[1;42mas-mp3-ytdlp.bat%ESC%[0m in directory!
echo.

echo %ESC%[36mPress any key to exit . . .%ESC%[0m
pause >nul