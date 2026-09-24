# Artigo — Redes sem Fio

Artigo acadêmico em LaTeX no padrão ABNT (usando `abntex2cite`).

## Estrutura

- `main.tex` — arquivo principal, monta o documento a partir dos demais.
- `config/pacotes.tex` — pacotes LaTeX utilizados.
- `elementos_do_texto/` — capa e referências bibliográficas.
- `input/` — seções do texto (introdução, metodologia, resultados etc.).
- `refbib.bib` — base de referências bibliográficas.

## Compilando com Docker

Não é necessário instalar LaTeX localmente — basta ter o [Docker](https://docs.docker.com/get-docker/) instalado.

```bash
make pdf
```

Isso builda uma imagem baseada em `texlive/texlive:latest` (TeX Live completo) e compila o artigo com `latexmk`, que executa sozinho as passadas de `pdflatex` e `bibtex` necessárias para a bibliografia ABNT. O resultado é o arquivo `main.pdf` gerado na raiz do repositório.

Outros comandos disponíveis:

```bash
make build   # apenas builda a imagem Docker
make shell   # abre um shell dentro do container, útil para depurar erros de compilação
make clean   # remove os arquivos gerados pela compilação (aux, log, pdf, etc.)
```

Tudo roda localmente dentro do container — nenhum dado é enviado para serviços externos.

### Sem `make`

Caso não tenha o `make` disponível, o mesmo resultado pode ser obtido diretamente com Docker:

```bash
docker build -t texlive .
docker run --rm -v "$(pwd)":/source texlive
```
