@echo off
setlocal enabledelayedexpansion
set "script_dir=%~dp0"
:: Set the path to your FFmpeg executable
set "ffmpeg=%script_dir%\ffmpeg.exe"

:: Set the input video folder and output GIF folder
set "input_folder=%~1"
set "output_folder=%~2"

:: Loop through all video files in the input folder
for %%i in ("%input_folder%\*.mp4") do (
    :: Get the file name without extension
    set "filename=%%~ni"

    :: Define the output GIF file name and path
    set "output_gif=!output_folder!\!filename!.gif"

    :: Use FFmpeg to convert the video to GIF
    "%ffmpeg%" -i "%%i" -vf "fps=10,scale=320:-1:flags=lanczos" -loop 0 "!output_gif!"

    echo Converted "%%i" to "!output_gif!"
)

echo All videos converted to GIFs.
pause
