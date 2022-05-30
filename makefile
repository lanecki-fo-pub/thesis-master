all: render clean
	@echo "done"

render:
	@echo "building..."
	@pandoc \
		--lua-filter=lyt/include.lua \
		--template=lyt/template.tex \
		--from markdown \
		src/root.md \
		-o build.tex
	@echo "rendering..."
	@lualatex --draftmode build.tex #1>build.trash &>build.trash
	@bibtex build #1>build.trash &>build.trash
	@lualatex build.tex #1>build.trash &>build.trash # compile twice for bibliography
	@mv build.pdf paper.pdf

clean:
	@echo "cleaning up..."
	@find . -name "build*" -delete
	@rm -f texput.log
