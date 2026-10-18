# Docs-only project: specs, articles, slides and diagrams.
PUML := $(shell find docs -name '*.puml')
MMD  := $(shell find docs -name '*.mmd')
DECK := docs/presentations/slides.md

.PHONY: help diagrams lint links slides check clean

help: ## Show targets
	@grep -E '^[a-z-]+:.*## ' $(MAKEFILE_LIST) | awk -F':.*## ' '{printf "  %-10s %s\n", $$1, $$2}'

diagrams: ## Render all PlantUML and Mermaid sources to PNG next to their source
	@for f in $(PUML); do plantuml -tpng "$$f"; done
	@for f in $(MMD); do npx -y @mermaid-js/mermaid-cli -i "$$f" -o "$${f%.mmd}.png" -b white; done

lint: ## Lint Markdown
	npx -y markdownlint-cli2 "**/*.md" "#node_modules"

links: ## Check relative links between Markdown files (offline)
	lychee --offline --no-progress "**/*.md"

slides: ## Export the Marp deck to PDF (Speaker Deck) and PPTX
	npx -y @marp-team/marp-cli $(DECK) --pdf --allow-local-files -o docs/presentations/share-copilot-capacity.pdf
	npx -y @marp-team/marp-cli $(DECK) --pptx --allow-local-files -o docs/presentations/share-copilot-capacity-marp.pptx

check: lint links ## Run all checks

clean: ## Remove generated HTML exports
	rm -f docs/presentations/*.html
