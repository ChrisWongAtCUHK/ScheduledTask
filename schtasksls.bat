@ECHO OFF

@REM Get first parameter from input command
SET SUBSTRING1=%1

@REM Temporary file name
SET FILETMP=SCHTASKS.TMP

@REM Create the temporary file
ECHO. > %FILETMP%

@REM Batch script to list out the scheduled tasks start with inpute substring
@REM	redirect the output to temporary file
FOR /F "delims=" %%I IN ('SCHTASKS /QUERY') DO (
	ECHO %%I >> %FILETMP%
)

@REM Find the substring
FINDSTR "%SUBSTRING1%" %FILETMP%

@REM Clean up
DEL /Q %FILETMP%
