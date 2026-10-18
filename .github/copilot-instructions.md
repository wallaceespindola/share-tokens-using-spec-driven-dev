# Copilot instructions

This repository defines a process for sharing GitHub Copilot capacity across a team through task specs. Read `docs/spec/PRD-copilot-capacity-sharing.md` for the full process.

## When implementing a task

- The task file in `docs/backlog/TASK-NNN-*.md` is the only source of requirements. Do not add behavior it does not ask for, and respect its "Out of scope" list.
- Follow `docs/ARCHITECTURE.md`, `docs/CODING_GUIDE.md` and `docs/TESTING_GUIDE.md`.
- Stack: Java 25, Spring Boot, PostgreSQL, Kafka only where the task requires it, JUnit 5 and Mockito.
- Every acceptance criterion maps to at least one test. Run the full test suite before handing back.
- Fill in the task's "Implementation notes" section: what changed, decisions made, open questions.
- If the task is ambiguous, stop and list the questions instead of guessing.

## When writing docs

- Plain, direct English. Sentence-case headings. No em dashes.
- Diagrams as PlantUML (`.puml`) or Mermaid (`.mmd`) sources next to their rendered PNG.
