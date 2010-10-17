all:
	cd src && pdflatex main.tex && mv main.pdf ../AaD.pdf && cd ..
