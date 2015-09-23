xelatex cover.tex
pdflatex paper.tex
pdflatex paper.tex
pdflatex B10028002.tex
del cover.pdf /s
del paper.pdf /s
@echo off
ping -n 4 127.0.0.1 >nul
@echo on
Clean.bat