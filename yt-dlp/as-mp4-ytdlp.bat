@echo off
 
rem Define the ESCAPE character
for /f %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"
 
echo Use %ESC%[1;41myt-dlp%ESC%[0m download and convert video to %ESC%[1;44m.mp4 (best available resolution and bitrate)%ESC%[0m
set /P url=Enter video URL: %ESC%[1;95m
 
start /wait cmd /c yt-dlp --ffmpeg-location "%localappdata%\Microsoft\WinGet\Packages\BtbN.FFmpeg.GPL_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-N-120061-gcfd1f81e7d-win64-gpl\bin" -v -S "res,codec,br" --recode-video mp4 -P %~dp0 %url%
echo. %ESC%[0mFinished! 
pause
