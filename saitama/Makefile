GCS_TEMPLATE=$(shell kpsewhich gurps-gcs-template.gcx)

.PRECIOUS: %.gcx

all: saitama_factsheet.pdf

%.pdf: %.tex *.sty saitama.gcx
	latexmk -lualatex $(basename $@)

%.gcx: %.gcs
	gcs $< -text -text_template=$(GCS_TEMPLATE)
	sed -i 's/%/\\%/g' $@
	sed -i 's/\([0-9]\),\([0-9]\{3\}\)/\1\2/g' $@

clean:
	latexmk -CA
	rm -f *.gcx
