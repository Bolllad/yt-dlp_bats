@echo off
 
rem Define the ESCAPE character
for /f %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"
 
echo Use %ESC%[1;41myt-dlp%ESC%[0m download and convert video to %ESC%[1;44m.mp3%ESC%[0m
set /P url=Enter video URL: %ESC%[1;95m
 
start /wait cmd /c yt-dlp --ffmpeg-location "%localappdata%\Microsoft\WinGet\Packages\BtbN.FFmpeg.GPL_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-N-120061-gcfd1f81e7d-win64-gpl\bin" -v -t mp3 -P %~dp0 %url%
IF %ERRORLEVEL% NEQ 0 (
   echo %ESC%[0mAn error occurred during video download or conversion.
   echo Error code:%ESC%[91m %ERRORLEVEL%%ESC%[0m
) ELSE (
   echo %ESC%[0mVideo downloaded and convereted succesfully.
)
echo.
echo %ESC%[36mPress any key to exit . . .%ESC%[0m
pause >nul
