all: weapons.pdf blankweaponscards.pdf

blankweaponscards.pdf: weapons.pdf
	pdfjam weapons.pdf 2-3 -o blankweaponscards.pdf

weapons.pdf: weapons.tex
	latexmk -lualatex weapons.tex

clean:
	latexmk -CA
	rm -f blankweaponscards.pdf

