# Getting This Deck into Google Slides

Two ways to bring `share-copilot-capacity.pptx` into Google Slides.

## Option 1: Import into an existing presentation

1. Open [Google Slides](https://slides.google.com) and create a blank presentation (or open one you have)
2. Go to **File → Import slides**
3. Click the **Upload** tab and select `docs/presentations/share-copilot-capacity.pptx`
4. Select **All** slides, then click **Import slides**

## Option 2: Open the PPTX directly from Drive

1. Upload `share-copilot-capacity.pptx` to [Google Drive](https://drive.google.com)
2. Right-click the file → **Open with → Google Slides**
3. Optionally: **File → Save as Google Slides** to convert it to a native Slides file

Fonts note: the deck uses only Arial for text and Courier New for code, so it converts cleanly. Speaker notes come along with the import (**View → Show speaker notes**). Diagrams are PNG images, so they look the same everywhere. After import, check the table slides (7 and 16), since row heights can shift slightly.

## Speaker Deck

Upload `share-copilot-capacity.pdf` to [Speaker Deck](https://speakerdeck.com). It is exported from the Marp deck (`slides.md`) and has the same 21 slides.

## Marp alternative (HTML / PDF)

`docs/presentations/slides.md` is a [Marp](https://marp.app) deck with speaker notes as HTML comments. Export it without PowerPoint:

```bash
# HTML
npx @marp-team/marp-cli docs/presentations/slides.md --allow-local-files -o docs/presentations/slides.html

# PDF (the Speaker Deck file)
npx @marp-team/marp-cli docs/presentations/slides.md --pdf --allow-local-files -o docs/presentations/share-copilot-capacity.pdf

# PPTX (Marp's own export, an alternative to the bundled one)
npx @marp-team/marp-cli docs/presentations/slides.md --pptx --allow-local-files -o docs/presentations/slides-marp.pptx
```

`--allow-local-files` lets Marp embed the diagram PNGs. If Marp cannot find a browser, point it at Chrome with `CHROME_PATH`.

## Diagrams

Sources live in `docs/presentations/diagrams/`:

| Diagram | Source | Render |
|---|---|---|
| Delegation flow | `delegation-flow.mmd` | `mmdc -i delegation-flow.mmd -o delegation-flow.png -b white -s 3` |
| Handoff sequence | `handoff-sequence.puml` | `plantuml -tpng handoff-sequence.puml` |
| Per-user credit limits (illustrative) | `credit-usage.svg` | open in a browser and export or screenshot to PNG |

---

Author: Wallace Espindola, <wallace.espindola@gmail.com>
LinkedIn: <https://www.linkedin.com/in/wallaceespindola/> | GitHub: <https://github.com/wallaceespindola/>
Repo: <https://github.com/wallaceespindola/share-tokens-using-spec-driven-dev>
