GCS_TEMPLATE=$(shell kpsewhich gurps-gcs-template.gcx)

.PRECIOUS: %.gcx

all: main.pdf

%.pdf: %.tex *.sty *.lua retsuko.gcx buildings.lua
	latexmk -lualatex -shell-escape $(basename $@)

%.gcx: %.gcs
	gcs $< -text -text_template=$(GCS_TEMPLATE)
	sed -i 's/\([0-9]\),\([0-9]\{3\}\)/\1\2/g' $@
	sed -i 's/SM{+/SM{/g' $@
	sed -i 's/, [x+-][0-9.]\+%\?//g' $@
	sed -i 's/ ([0-9.]\+[x+-])//g' $@
	sed -i 's/Appears constantly (No roll required)/Appears constantly/g' $@
	sed -i 's/\(CR: [0-9]\+\).\+\.)/\1)/g' $@
	sed -i 's/%/\\%/g' $@

# TODO make this rule properly so I can multi-process this. (the command here
# will build 'building-4' only)
# 
# tikz/building-%.pdf: main.tex buildings.lua
# 	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "buildling-4" '\def\tikzexternalrealjob{main}\input{main}'

clean:
	latexmk -CA
	rm -f *.gcx
