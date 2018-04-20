all: gurps_critical_roll_tables.pdf

%.pdf: %.tex gurps_critical_roll_tables.lua
	lualatex $<

clean:
	latexmk -CA
