#!/bin/bash

#Generación de PDF compilando el archivo LaTeX con pdflatex
cd text && pdflatex -synctex=1 -interaction=nonstopmode -output-directory=../ proyecto.tex
