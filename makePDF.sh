#!/bin/bash

#Generación de PDF compilando el archivo LaTeX con pdflatex
pdflatex -synctex=1 -interaction=nonstopmode proyecto.tex
