.PHONY: all
all: build/presentation.pdf

build:
	@[ -d build ] || mkdir -p build

# Compile PDF (run twice for proper references and TOC)
build/presentation.pdf: presentation.tex | build Makefile
	@for i in 1 2 3; do \
		pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build presentation.tex; \
	done

.PHONY: clean
clean:
	rm -rf build

.PHONY: help
help:
	@printf "Important available targets:\n"
	@printf "  all        - Compile the presentation (default)\n"
	@printf "  clean      - Remove build files but keep PDF\n"
	@printf "  help       - Show this help message\n"
