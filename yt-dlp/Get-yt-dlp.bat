@echo off

rem Define the ESCAPE character
for /f %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"

echo Starting %ESC%[1;41mPython 3.12%ESC%[0m installation via %ESC%[1;45mwinget%ESC%[0m...
start /wait cmd /c winget install --id python.Python.3.12
echo. Finished!
echo.

echo Starting %ESC%[1;41mFFmpeg%ESC%[0m installation via %ESC%[1;45mwinget%ESC%[0m...
start /wait cmd /c winget install --id BtbN.FFmpeg.GPL
echo. Finished!
echo.

echo Starting %ESC%[1;41myt-dlp%ESC%[0m installation via %ESC%[1;45mpip%ESC%[0m...
start /wait cmd /c pip install yt-dlp
echo. Finished!
echo.

echo Checking %ESC%[1;41myt-dlp version%ESC%[0m...
FOR /F "tokens=* USEBACKQ" %%F IN (`yt-dlp -U`) DO (
SET var=%%F
)
echo. %var%
echo. Finished!
echo.

pause

echo @echo off> as-mp4-ytdlp.bat
echo. >> as-mp4-ytdlp.bat
echo rem Define the ESCAPE character>> as-mp4-ytdlp.bat
echo for /f %%%%a in ('echo prompt $E^^^| cmd') do set "ESC=%%%%a">> as-mp4-ytdlp.bat
echo. >> as-mp4-ytdlp.bat
echo echo Use %%ESC%%[1;41myt-dlp%%ESC%%[0m download and convert video to %%ESC%%[1;44m.mp4 (best available resolution and bitrate)%%ESC%%[0m>> as-mp4-ytdlp.bat
echo set /P url=Enter video URL: %%ESC%%[1;95m>> as-mp4-ytdlp.bat
echo. >> as-mp4-ytdlp.bat
echo start /wait cmd /c yt-dlp --ffmpeg-location "%%localappdata%%\Microsoft\WinGet\Packages\BtbN.FFmpeg.GPL_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-N-120061-gcfd1f81e7d-win64-gpl\bin" -v -S "res,codec,br" --recode-video mp4 -P %%~dp0 %%url%%>> as-mp4-ytdlp.bat
echo echo. %%ESC%%[0mFinished! >> as-mp4-ytdlp.bat
echo pause>> as-mp4-ytdlp.bat

echo @echo off> as-mp3-ytdlp.bat
echo. >> as-mp3-ytdlp.bat
echo rem Define the ESCAPE character>> as-mp3-ytdlp.bat
echo for /f %%%%a in ('echo prompt $E^^^| cmd') do set "ESC=%%%%a">> as-mp3-ytdlp.bat
echo. >> as-mp3-ytdlp.bat
echo echo Use %%ESC%%[1;41myt-dlp%%ESC%%[0m download and convert video to %%ESC%%[1;44m.mp3%%ESC%%[0m>> as-mp3-ytdlp.bat
echo set /P url=Enter video URL: %%ESC%%[1;95m>> as-mp3-ytdlp.bat
echo. >> as-mp3-ytdlp.bat
echo start /wait cmd /c yt-dlp --ffmpeg-location "%%localappdata%%\Microsoft\WinGet\Packages\BtbN.FFmpeg.GPL_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-N-120061-gcfd1f81e7d-win64-gpl\bin" -v -t mp3 -P %%~dp0 %%url%%>> as-mp3-ytdlp.bat
echo echo. %%ESC%%[0mFinished!>> as-mp3-ytdlp.bat
echo pause>> as-mp3-ytdlp.bat

echo.
echo Created %ESC%[1;42mas-mp4-ytdlp.bat%ESC%[0m and %ESC%[1;42mas-mp3-ytdlp.bat%ESC%[0m in directory!
echo.

pause