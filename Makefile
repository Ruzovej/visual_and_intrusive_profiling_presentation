.PHONY: all
all: build/presentation.pdf

build:
	@[ -d build ] || mkdir -p build

# Compile PDF (run twice for proper references and TOC)
build/presentation.pdf: presentation.tex | build Makefile
	@set -e; for i in 1 2 3; do \
		pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build presentation.tex; \
	done

.PHONY: examples
examples: nvtx_example tracy_example

.PHONY: nvtx_example
nvtx_example: examples/nvtx/build/nvtx_example
examples/nvtx/build/nvtx_example: examples/nvtx/build.bash examples/nvtx/CMakeLists.txt examples/nvtx/main.cxx
	@set -e; \
	cd examples/nvtx && \
	bash build.bash

.PHONY: tracy_example
tracy_example: examples/tracy/build/tracy_example
examples/tracy/build/tracy_example: examples/tracy/build.bash examples/tracy/CMakeLists.txt examples/tracy/main.cxx
	@set -e; \
	cd examples/tracy && \
	bash build.bash

.PHONY: clean
clean:
	rm -rf build

.PHONY: help
help:
	@printf "Important available targets:\n"
	@printf "  all        - Compile the presentation (default)\n"
	@printf "  clean      - Remove build files but keep PDF\n"
	@printf "  help       - Show this help message\n"
