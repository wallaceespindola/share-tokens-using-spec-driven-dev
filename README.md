# Sharing Copilot token credits in a team

![Share the credits](docs/images/banner.png)

[![MIT License](https://img.shields.io/badge/License-MIT-yellow)](LICENSE)
[![Docs](https://img.shields.io/badge/Written_in-Markdown-000000?logo=markdown)](docs/spec/PRD-copilot-capacity-sharing.md)
[![Diagrams](https://img.shields.io/badge/Diagrams-PlantUML_%7C_Mermaid-ff3670?logo=mermaid&logoColor=white)](docs/specs/report-generation/design.md)
[![GitHub Copilot](https://img.shields.io/badge/Built_for-GitHub_Copilot-8957e5?logo=githubcopilot&logoColor=white)](https://docs.github.com/en/copilot)
[![Spec Kit](https://img.shields.io/badge/Spec--driven-Spec_Kit-2ea44f?logo=github)](https://github.com/github/spec-kit)
[![docs CI](https://github.com/wallaceespindola/share-tokens-using-spec-driven-dev/actions/workflows/docs.yml/badge.svg)](https://github.com/wallaceespindola/share-tokens-using-spec-driven-dev/actions/workflows/docs.yml)

The idea: a team's Copilot token credits should work as a shared pool, even though each bundle is licensed to one person. When one developer runs out and a teammate still has credits left, the work moves to the credits, not the credits to the person.

This is done with spec-driven development. The developer who is out of credits (or has no license) writes a Markdown task spec. A teammate with credits left implements it with Copilot. The developer who wrote the spec validates the result and opens the pull request. Nobody shares a login or transfers credits.

## Why

Companies usually buy Copilot through a contract with Microsoft/GitHub where each developer has a personal credit limit per billing period: a per-user allowance, or a per-user budget that admins set on the organization's pool. Usage is uneven: some developers hit their limit early, others end the period with credits left over, and some have no license at all. A limit belongs to one user, so leftover credits do nothing for the colleague who ran out.

Those leftover credits are capacity the company has already paid for. Routing work to the people who still have credits gets more out of the same contract, without extra seats, shared logins or license violations.

## How it works

Nobody transfers tokens or accounts. The unit of sharing is a task spec, `docs/backlog/TASK-NNN-short-slug.md`, committed to the repository.

| Role | Does |
|------|------|
| Business | Provides requirements and acceptance criteria |
| Owner | Writes the task spec, validates the result, makes the final commit and opens the PR |
| Reviewer | Approves the task against the definition of ready before any credits are spent |
| Delegate | Implements the task with Copilot, including tests and docs, and hands it back |

```mermaid
flowchart TD
    A[Business requirements] --> B[Owner writes task spec]
    B --> C{Reviewer:<br/>definition of ready?}
    C -- No --> B
    C -- Yes --> D[Delegate implements with Copilot<br/>code + tests]
    D --> F[Owner validates]
    F --> G{Issue?}
    G -- Yes --> H[Owner updates spec] --> D
    G -- No --> I[Owner opens PR]
    I --> K[Same CI/CD and quality gates] --> L[Merge]
```

The owner does the parts that cost no credits (specifying and validating). The delegate spends credits only on implementation, where Copilot saves the most time. Because the spec, decisions and implementation notes live in the repository, nothing important stays trapped in someone's Copilot chat.

## Spec-driven development and Spec Kit

The process is spec-driven development applied to a team instead of a single developer. In spec-driven development, intent is written down as a structured Markdown spec before any code, and the AI agent plans and implements from that spec. [GitHub Spec Kit](https://github.com/github/spec-kit) packages this as a workflow for Copilot and other agents: `/speckit-constitution` once per project, then `/speckit-specify`, `/speckit-plan`, `/speckit-tasks`, `/speckit-implement` and `/speckit-converge` per feature.

Here, the spec does one more job: it is the handoff between the teammate who has no credits left and the teammate who does. The pieces line up like this:

| Spec Kit step | In this process |
|---------------|-----------------|
| Constitution | `docs/ARCHITECTURE.md`, `CODING_GUIDE.md`, `TESTING_GUIDE.md`, `.github/copilot-instructions.md` |
| Specify | Business requirements in `docs/specs/`, written up by the owner as a task spec |
| Plan, tasks | The task spec in `docs/backlog/`, approved by the reviewer |
| Implement | The delegate runs it with Copilot, spending their credits |
| Converge | The owner validates, and the spec is updated until the result matches it |

Spec Kit is optional. A team can run the process with plain task files and the `implement-task` prompt, or use Spec Kit (`uv tool install specify-cli`, then `specify init . --integration copilot`) to generate and drive the specs.

The full process, including what to delegate, the definition of ready, credit-saving tips and recommended agents and skills, is in the [PRD](docs/spec/PRD-copilot-capacity-sharing.md).

## Repository layout

| Path | Contents |
|------|----------|
| `docs/spec/PRD-copilot-capacity-sharing.md` | The process definition |
| `docs/backlog/` | Task specs, one file per task (see `TASK-042` as an example) |
| `docs/specs/` | Feature design documents referenced by tasks |
| `docs/ARCHITECTURE.md`, `docs/CODING_GUIDE.md`, `docs/TESTING_GUIDE.md` | Example team standards that tasks point to |
| `.github/copilot-instructions.md` | Context Copilot loads on every request |
| `.github/prompts/implement-task.prompt.md` | The prompt a delegate runs to implement a task |

## Try it

1. Copy `docs/backlog/TASK-042-order-summary-report.md` as a template for your own task.
2. Get it reviewed against the definition of ready in the PRD.
3. As the delegate, open Copilot Chat in agent mode and run `/implement-task` with the task file attached.
4. As the owner, validate the result and open the PR.

To reuse it in your own project, copy `docs/spec/`, the task template and the `.github/` files.

## Slides

A 21-slide talk on this process is in `docs/presentations/`: `share-copilot-capacity.pptx` for PowerPoint and Google Slides, `share-copilot-capacity.pdf` for Speaker Deck, and the Marp source `slides.md`.

To use it in Google Slides: open [slides.google.com](https://slides.google.com), create a blank presentation, then **File > Open > Upload** and pick the `.pptx` (or **File > Import slides** to add it to a deck you already have). Then **File > Save as Google Slides**. Full steps, including Speaker Deck, are in [GOOGLE_SLIDES.md](docs/presentations/GOOGLE_SLIDES.md).

## Development

The project is documentation only. Diagrams are PlantUML (`.puml`) and Mermaid (`.mmd`) sources with rendered PNGs next to them.

```bash
make help       # list targets
make diagrams   # render all .puml and .mmd files (needs plantuml; Mermaid runs via npx)
make lint       # markdownlint
make links      # offline link check (needs lychee: brew install lychee)
make slides     # export the Marp deck to PDF and PPTX
```

CI runs the Markdown lint and link check on every push and pull request.

## Support

If you find this project helpful, please consider:

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-support%20my%20work-FFDD00?style=flat&labelColor=101010&logo=buy-me-a-coffee&logoColor=white)](https://www.buymeacoffee.com/wallace.espindola)
[![Star on GitHub](https://img.shields.io/badge/Star%20on%20GitHub-share--tokens--using--spec--driven--dev-181717?style=flat&logo=github)](https://github.com/wallaceespindola/share-tokens-using-spec-driven-dev)

[![GitHub stars](https://img.shields.io/github/stars/wallaceespindola/share-tokens-using-spec-driven-dev?style=social)](https://github.com/wallaceespindola/share-tokens-using-spec-driven-dev/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/wallaceespindola/share-tokens-using-spec-driven-dev?style=social)](https://github.com/wallaceespindola/share-tokens-using-spec-driven-dev/network/members)
[![GitHub watchers](https://img.shields.io/github/watchers/wallaceespindola/share-tokens-using-spec-driven-dev?style=social)](https://github.com/wallaceespindola/share-tokens-using-spec-driven-dev/watchers)
[![GitHub issues](https://img.shields.io/github/issues/wallaceespindola/share-tokens-using-spec-driven-dev)](https://github.com/wallaceespindola/share-tokens-using-spec-driven-dev/issues)
[![GitHub last commit](https://img.shields.io/github/last-commit/wallaceespindola/share-tokens-using-spec-driven-dev)](https://github.com/wallaceespindola/share-tokens-using-spec-driven-dev/commits/main)

Star the repo on GitHub if it helps your team. It motivates me a lot!

## Author

Wallace Espindola, Solution Architect

- Email: <wallace.espindola@gmail.com>
- LinkedIn: <https://www.linkedin.com/in/wallaceespindola/>
- GitHub: <https://github.com/wallaceespindola/>

## License

[MIT](LICENSE)
