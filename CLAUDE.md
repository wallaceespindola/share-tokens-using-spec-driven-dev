# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A documentation-only project: Markdown files and diagrams. There is no application code. It defines a team process for sharing GitHub Copilot token credits: developers who are out of credits write a `TASK-NNN.md` spec, a teammate with credits left implements it with Copilot, and the spec writer validates and opens the PR. The source of truth for the process is `docs/spec/PRD-copilot-capacity-sharing.md`; keep `README.md` and the articles consistent with it.

Work here means editing `.md` files and `.puml` / `.mmd` diagram sources. Do not add application code, build tooling or dependencies.

## Layout

- `docs/spec/`: the PRD (process definition).
- `docs/backlog/`: task specs, `TASK-NNN-short-slug.md` (TASK-042 is the worked example).
- `docs/specs/`: feature designs that tasks reference. `docs/ARCHITECTURE.md`, `CODING_GUIDE.md`, `TESTING_GUIDE.md` are example team standards.
- `docs/articles/<platform>/`: `article.md`, `banner.png`, `diagrams/`. Each platform takes a different angle and title on the same theme.
- `docs/presentations/`: Marp `slides.md`, exported PPTX/PDF, Google Slides notes.
- `.github/copilot-instructions.md`, `.github/prompts/implement-task.prompt.md`: the Copilot assets the PRD describes.

## Commands

```bash
make diagrams   # render every .puml (plantuml) and .mmd (mermaid-cli via npx) to a PNG next to its source
make lint       # markdownlint-cli2, config in .markdownlint.json
make links      # offline relative-link check (needs lychee)
make slides     # Marp export of docs/presentations/slides.md to PDF and PPTX
```

CI (`.github/workflows/docs.yml`) runs markdownlint and the offline link check.

## Conventions

- Every article has a `banner.png` (modern, abstract, futuristic, at most 3-4 words; see the `article-image-generator` skill) and at least one diagram embedded from its `diagrams/` folder.
- Diagrams: keep the `.puml` / `.mmd` source next to its rendered PNG, and re-render after editing the source. Articles embed the PNG by relative path.
- Prose: sentence-case headings, no em dashes, no fabricated stats or anecdotes. Never name the author's employer or internal tools.
- Copilot billing and file-location details change often; verify against docs.github.com before stating them.
- Author info: Wallace Espindola, <wallace.espindola@gmail.com>, <https://www.linkedin.com/in/wallaceespindola/>, <https://github.com/wallaceespindola/>
