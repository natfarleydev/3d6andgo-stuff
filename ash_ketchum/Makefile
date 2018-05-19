GCS_TEMPLATE=$(shell kpsewhich gurps-gcs-template.gcx)

.PRECIOUS: %.gcx

all: ash_ketchum_factsheet.pdf

%.pdf: %.tex *.sty *.lua pikachu.gcx ash_ketchum.gcx
	latexmk -lualatex $(basename $@)

%.gcx: %.gcs
	gcs $< -text -text_template=$(GCS_TEMPLATE)
	sed -i 's/\([0-9]\),\([0-9]\{3\}\)/\1\2/g' $@
	sed -i 's/SM{+/SM{/g' $@
	sed -i 's/, [x+-][0-9.]\+%\?//g' $@
	sed -i 's/ ([0-9.]\+[x+-])//g' $@
	sed -i 's/Appears constantly (No roll required)/Appears constantly/g' $@
	sed -i 's/\(CR: [0-9]\+\).\+\.)/\1)/g' $@
	sed -i 's/%/\\%/g' $@

clean:
	latexmk -CA
	rm -f *.gcx
