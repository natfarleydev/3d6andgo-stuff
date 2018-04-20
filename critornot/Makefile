all: gurps_critical_roll_tables.pdf gurps_critical_roll_tables_fail_17.pdf

%.pdf: %.tex
	lualatex $<

clean:
	latexmk -CA
