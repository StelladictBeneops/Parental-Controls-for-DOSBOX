REM Parental Controls for Individual DOS GAMES via Auto-Launcher

@echo off
		REM Launches game in fullscreen

		set message1="You have 5 minutes left, please wrap-up your work before the application closes."

		set message2="You have 1 minutes left, please wrap-up your work before the application closes."

	REM Set the path to the DOSBOX executable file

set DOSBOX_PATH="C:\Program Files\DOSBox-0.74-3\DOSBox.exe"

	REM Launch DOSBox and send commands

REM Launches game in fullscreen

REM Replace EDUCA with the folder the game is in, and LEARN with the actual game you want launched in DOS

start "" %DOSBOX_PATH% -conf %gamepath%\dosbox.conf -fullscreen -c "mount C C:\DOSGAMES\ " -c "c:" -c "CD  EDUCA" -c "LEARN"

REM Warning that playtime is almost over

		timeout /t 900

		PowerShell -Command "Add-Type -AssemblyName System.Speech; (New-Object System.Speech.Synthesis.SpeechSynthesizer).Speak(%message1%)"

REM One minute grace to finish-up work before closing the game

		timeout /t 300

		PowerShell -Command "Add-Type -AssemblyName System.Speech; (New-Object System.Speech.Synthesis.SpeechSynthesizer).Speak(%message2%)"

		timeout /t 60

REM Closes game at the end of playtime

%DOXBOX_PATH% -exit

REM Hides the icon of the batch file after playtime is done.
REM Replace the File Path below with the actual Path to your BAT file so it can disappear after the game has been played.

attrib -h "C:\ComputerHistory\EducationalGame.BAT"
