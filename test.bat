@echo off
title Test
color fc
::####################################

: one
echo Please enter your name
echo.
echo.
set /p name=">> "
echo.
echo.
cls
echo Hello, nice to meet you %name%!
echo.
echo.
pause 
cls
echo How old are you?
echo.
echo.
set /p age=">> "
echo.
set /a nextyear=%age% + 1
cls
echo You are going to be %nextyear% in a year!
echo.
echo.
pause 
goto two
::############################################

: two
cls
echo Welcome to page 2!
echo.
echo.
echo Do you know anyone that is %nextyear%?
echo.
echo.
set /p input=">> "
pause >nul
