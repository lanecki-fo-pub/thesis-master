all: render
	@echo "done"

render:
	@echo "rendering booklet"
	@pandoc \
		--pdf-engine=lualatex \
		--lua-filter=lyt/include.lua \
		--template=lyt/template.tex \
		--from markdown \
		src/root.md \
		-o bounce.pdf

clean:
	@echo "cleaning up"
	@rm -f "bounce.pdf"
