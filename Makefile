IMAGE := texlive

.PHONY: build pdf clean shell

build:
	docker build -t $(IMAGE) .

pdf: build
	docker run --rm -v "$(CURDIR)":/source $(IMAGE)

shell: build
	docker run --rm -it -v "$(CURDIR)":/source --entrypoint sh $(IMAGE)

clean:
	rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.bcf *.run.xml \
		*.synctex.gz *.fdb_latexmk *.fls *.nav *.snm *.vrb *.xdv main.pdf
