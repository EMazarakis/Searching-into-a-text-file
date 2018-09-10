@echo off
REM change the color of the cmd
color 4e

REM Setting variables
set where_searching_file_is="C:\Users\e.mazarakis\Desktop\test"
set file_with_results=Results.txt
set /a count = 0
set myDATE=" "
set myTIME=" "

REM Open cmd under the proper directory
cd %where_searching_file_is%

echo.

REM Taking the current DATE and TIME
for /f "tokens=2" %%i in ('date /T') do (set myDATE=%%i)
for /f %%i in ('time /T') do (set myTIME=%%i)


REM if "Results.txt" exists under where_searching_file_is, it must be deleted
if exist %file_with_results% ( 
DEL /F %file_with_results%
echo "Previous %file_with_results% was deleted!!!"
) else ( 
echo "%file_with_results% was not existed"
)


REM Writing to the file Results.txt
echo Results %myDATE% , %myTIME% >> %file_with_results%
echo --------------------------------- >> %file_with_results%

for /f "tokens=3 delims= " %%A in ('findstr /c:"Error line: " search.log') do (
(echo %%A) >> %file_with_results%
(echo.) >> %file_with_results%
set /a count += 1
)

REM Print without new line at the end
echo | set /p="--------------------------------" >> %file_with_results%

echo "%count%  co_ids were found."
echo "Bye Byeeeeeeee Searcher"

pause
REM ------------------------------------------------------------------------------------------------
