all: gurps_critical_roll_tables.pdf

%.pdf: %.tex
	lualatex $<

clean:
	latexmk -CA
