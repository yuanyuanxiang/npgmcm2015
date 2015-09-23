@echo off
del *.aux /s 2>nul
del *.bak /s 2>nul
del *.log /s 2>nul
del *.bbl /s 2>nul
del *.blg /s 2>nul
del *.thm /s 2>nul
del *.toc /s 2>nul
del *.out /s 2>nul
del *.gz /s 2>nul
del *.dvi /s 2>nul
del *.ps /s 2>nul
del *.sav /s 2>nul
del *.gz(busy) /s 2>nul
@echo on
ping -n 4 127.0.0.1 >nul