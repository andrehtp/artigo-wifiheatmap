FROM texlive/texlive:latest

WORKDIR /source

CMD ["latexmk", "-pdf", "-synctex=1", "-interaction=nonstopmode", "main.tex"]
