GCS_TEMPLATE=$(shell kpsewhich gurps-gcs-template.gcx)

.PRECIOUS: %.gcx

all: spike_spiegel_factsheet.pdf

%.pdf: %.tex *.sty spikespiegel.gcx
	latexmk -lualatex $(basename $@)

%.gcx: %.gcs
	gcs $< -text -text_template=$(GCS_TEMPLATE)
	sed -i 's/%/\\%/g' $@

clean:
	latexmk -CA
	rm -f *.gcx
